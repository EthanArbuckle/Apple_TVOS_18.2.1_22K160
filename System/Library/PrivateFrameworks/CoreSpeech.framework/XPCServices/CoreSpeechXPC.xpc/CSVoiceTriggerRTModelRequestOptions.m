@interface CSVoiceTriggerRTModelRequestOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)allowMph;
- (CSCoreSpeechServicesAccessoryInfo)accessoryInfo;
- (CSVoiceTriggerRTModelRequestOptions)initWithCSRTModelRequestOptions:(id)a3 builder:(id)a4;
- (CSVoiceTriggerRTModelRequestOptions)initWithCoder:(id)a3;
- (CSVoiceTriggerRTModelRequestOptions)initWithMutableBuilder:(id)a3;
- (NSNumber)accessoryModelType;
- (NSNumber)engineMajorVersion;
- (NSNumber)engineMinorVersion;
- (NSNumber)userSelectedPhraseType;
- (NSString)siriLocale;
- (NSUUID)endpointId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSVoiceTriggerRTModelRequestOptions

- (CSVoiceTriggerRTModelRequestOptions)initWithMutableBuilder:(id)a3
{
  v4 = (void (**)(id, CSVoiceTriggerRTModelRequestOptionsMutable *))a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerRTModelRequestOptions;
  v5 = -[CSVoiceTriggerRTModelRequestOptions init](&v21, "init");
  v6 = objc_alloc_init(&OBJC_CLASS___CSVoiceTriggerRTModelRequestOptionsMutable);
  if (v5)
  {
    if (v4) {
      v4[2](v4, v6);
    }
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerRTModelRequestOptionsMutable mSiriLocale](v6, "mSiriLocale"));
    siriLocale = v5->_siriLocale;
    v5->_siriLocale = (NSString *)v7;

    v5->_allowMph = -[CSVoiceTriggerRTModelRequestOptionsMutable mAllowMph](v6, "mAllowMph");
    v5->_userSelectedPhraseType = (NSNumber *) -[CSVoiceTriggerRTModelRequestOptionsMutable mUserSelectedPhrasetype]( v6,  "mUserSelectedPhrasetype");
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerRTModelRequestOptionsMutable mEndpointId](v6, "mEndpointId"));
    endpointId = v5->_endpointId;
    v5->_endpointId = (NSUUID *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerRTModelRequestOptionsMutable mEngineMajorVersion](v6, "mEngineMajorVersion"));
    engineMajorVersion = v5->_engineMajorVersion;
    v5->_engineMajorVersion = (NSNumber *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerRTModelRequestOptionsMutable mEngineMinorVersion](v6, "mEngineMinorVersion"));
    engineMinorVersion = v5->_engineMinorVersion;
    v5->_engineMinorVersion = (NSNumber *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerRTModelRequestOptionsMutable mAccessoryModelType](v6, "mAccessoryModelType"));
    accessoryModelType = v5->_accessoryModelType;
    v5->_accessoryModelType = (NSNumber *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerRTModelRequestOptionsMutable mAccessoryInfo](v6, "mAccessoryInfo"));
    v18 = (CSCoreSpeechServicesAccessoryInfo *)[v17 copy];
    accessoryInfo = v5->_accessoryInfo;
    v5->_accessoryInfo = v18;
  }

  return v5;
}

- (CSVoiceTriggerRTModelRequestOptions)initWithCSRTModelRequestOptions:(id)a3 builder:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000A08C;
  v10[3] = &unk_10001C630;
  id v11 = a3;
  id v12 = a4;
  id v6 = v12;
  id v7 = v11;
  v8 = -[CSVoiceTriggerRTModelRequestOptions initWithMutableBuilder:](self, "initWithMutableBuilder:", v10);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100009F00;
  v7[3] = &unk_10001C658;
  objc_copyWeak(&v8, &location);
  v5 = -[CSVoiceTriggerRTModelRequestOptions initWithMutableBuilder:](v4, "initWithMutableBuilder:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

- (CSVoiceTriggerRTModelRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"CSRTModelRequestOptionsSiriLocale"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned __int8 v7 = [v4 decodeBoolForKey:@"CSRTModelRequestOptionsAllowMph"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"CSRTModelRequestOptionsUserSelectedPhraseType"];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"CSRTModelRequestOptionsEndpointId"];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"CSRTModelRequestOptionsngineMajorVersion"];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"CSRTModelRequestOptionsEngineMinorVersion"];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"CSRTModelRequestOptionsAccessoryModelType"];
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = [v4 decodeObjectOfClass:objc_opt_class(CSCoreSpeechServicesAccessoryInfo) forKey:@"CSRTModelRequestOptionsAccessoryInfo"];
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100009E70;
  v29[3] = &unk_10001C680;
  unsigned __int8 v37 = v7;
  id v30 = v6;
  id v31 = v9;
  id v32 = v11;
  id v33 = v13;
  id v34 = v15;
  id v35 = v17;
  id v36 = v19;
  id v20 = v19;
  id v21 = v17;
  id v22 = v15;
  id v23 = v13;
  id v24 = v11;
  id v25 = v9;
  id v26 = v6;
  v27 = -[CSVoiceTriggerRTModelRequestOptions initWithMutableBuilder:](self, "initWithMutableBuilder:", v29);

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  siriLocale = self->_siriLocale;
  id v5 = a3;
  [v5 encodeObject:siriLocale forKey:@"CSRTModelRequestOptionsSiriLocale"];
  [v5 encodeBool:self->_allowMph forKey:@"CSRTModelRequestOptionsAllowMph"];
  [v5 encodeObject:self->_userSelectedPhraseType forKey:@"CSRTModelRequestOptionsUserSelectedPhraseType"];
  [v5 encodeObject:self->_endpointId forKey:@"CSRTModelRequestOptionsEndpointId"];
  [v5 encodeObject:self->_engineMajorVersion forKey:@"CSRTModelRequestOptionsngineMajorVersion"];
  [v5 encodeObject:self->_engineMinorVersion forKey:@"CSRTModelRequestOptionsEngineMinorVersion"];
  [v5 encodeObject:self->_accessoryModelType forKey:@"CSRTModelRequestOptionsAccessoryModelType"];
  [v5 encodeObject:self->_accessoryInfo forKey:@"CSRTModelRequestOptionsAccessoryInfo"];
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"siriLocale: %@, allowMph: %d, phraseType: %@, endpointId: %@, engineMajorVersion: %@, engineMinorVersion: %@, accessoryModelType:%@, accessoryInfo: %@",  self->_siriLocale,  self->_allowMph,  self->_userSelectedPhraseType,  self->_endpointId,  self->_engineMajorVersion,  self->_engineMinorVersion,  self->_accessoryModelType,  self->_accessoryInfo);
}

- (BOOL)allowMph
{
  return self->_allowMph;
}

- (NSNumber)userSelectedPhraseType
{
  return self->_userSelectedPhraseType;
}

- (NSUUID)endpointId
{
  return self->_endpointId;
}

- (NSNumber)engineMajorVersion
{
  return self->_engineMajorVersion;
}

- (NSNumber)engineMinorVersion
{
  return self->_engineMinorVersion;
}

- (NSNumber)accessoryModelType
{
  return self->_accessoryModelType;
}

- (NSString)siriLocale
{
  return self->_siriLocale;
}

- (CSCoreSpeechServicesAccessoryInfo)accessoryInfo
{
  return self->_accessoryInfo;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end