@interface ADAccount
+ (BOOL)setActiveAccountIdentifier:(id)a3;
+ (id)_accountForIdentifier:(id)a3 infoDictionary:(id)a4 intanceContext:(id)a5 isReadOnly:(BOOL)a6 isCoupledToHost:(BOOL)a7;
+ (id)accountForIdentifier:(id)a3;
+ (id)activeAccount;
+ (id)activeAccountForInstanceContext:(id)a3;
- (ADAccount)init;
- (ADAccount)initWithMessageDictionary:(id)a3;
- (AFInstanceContext)instanceContext;
- (BOOL)_onQueueSetKeychainValue:(id)a3 forKey:(id)a4;
- (BOOL)_setKeychainValueSync:(id)a3 forKey:(id)a4;
- (BOOL)hasConnectionPolicyFailed;
- (BOOL)isReadOnly;
- (BOOL)needsCreation;
- (BOOL)needsDestruction;
- (BOOL)peerSiriEnabled;
- (BOOL)setLocalCryptoKeyData:(id)a3;
- (BOOL)setValidationDataSync:(id)a3;
- (BOOL)watchExistsForAssistantId:(id)a3;
- (NSDate)connectionPolicyDate;
- (NSDate)connectionPolicyFirstFailureDate;
- (NSDate)validationExpiration;
- (NSDictionary)connectionPolicy;
- (NSNumber)validationVersion;
- (NSString)aceHost;
- (NSString)assistantIdentifier;
- (NSString)connectionPolicyHostname;
- (NSString)group;
- (NSString)hostname;
- (NSString)identifier;
- (NSString)label;
- (NSString)lastAssistantDataAnchor;
- (NSString)localeIdentifier;
- (NSString)loggingAssistantIdentifier;
- (NSString)peerAssistantIdentifier;
- (NSString)peerHostname;
- (NSString)peerLanguageCode;
- (NSString)peerLoggingAssistantIdentifier;
- (NSString)peerSpeechIdentifier;
- (NSString)peerUserAgentString;
- (NSString)predefinedServer;
- (NSString)speechIdentifier;
- (id)_hostnameOverride;
- (id)_hostnameQAOverride;
- (id)_infoDictionaryForPreferences;
- (id)_keychainValueForKey:(id)a3;
- (id)_preferences;
- (id)_serverOverrideFromPreferences;
- (id)aceHostCluster;
- (id)connectionPolicyExpirationDate;
- (id)description;
- (id)localCryptoKeyData;
- (id)messageDictionary;
- (id)pairedWatches;
- (id)saConnectionPolicy;
- (id)saRemoteDevice:(id)a3;
- (id)serverCertificateData;
- (id)validationData;
- (int64_t)connectionPolicyStatus;
- (unint64_t)connectionPolicyFailureCount;
- (void)_markKeychainValuesAsDirty;
- (void)_removeKeychainValueForKey:(id)a3;
- (void)_setKeychainValue:(id)a3 forKey:(id)a4;
- (void)clearAssistantData;
- (void)clearAssistantDataDuringForcedRedirect;
- (void)removeAndSave;
- (void)resetCachedHostname;
- (void)save;
- (void)setAceHost:(id)a3;
- (void)setAssistantIdentifier:(id)a3;
- (void)setConnectionPolicy:(id)a3;
- (void)setConnectionPolicyDate:(id)a3;
- (void)setConnectionPolicyFailureCount:(unint64_t)a3;
- (void)setConnectionPolicyFirstFailureDate:(id)a3;
- (void)setConnectionPolicyHostname:(id)a3;
- (void)setGroup:(id)a3;
- (void)setHostname:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInstanceContext:(id)a3;
- (void)setIsReadOnly:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLastAssistantDataAnchor:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setLoggingAssistantIdentifier:(id)a3;
- (void)setNeedsCreation:(BOOL)a3;
- (void)setNeedsDestruction:(BOOL)a3;
- (void)setPairedWatches:(id)a3;
- (void)setPeerAssistantIdentifier:(id)a3;
- (void)setPeerHostname:(id)a3;
- (void)setPeerLanguageCode:(id)a3;
- (void)setPeerLoggingAssistantIdentifier:(id)a3;
- (void)setPeerSiriEnabled:(BOOL)a3;
- (void)setPeerSpeechIdentifier:(id)a3;
- (void)setPeerUserAgentString:(id)a3;
- (void)setPredefinedServer:(id)a3;
- (void)setServerCertificateData:(id)a3;
- (void)setSpeechIdentifier:(id)a3;
- (void)setValidationData:(id)a3;
- (void)setValidationExpiration:(id)a3;
- (void)setValidationVersion:(id)a3;
- (void)updateAssistantIdentifiers;
- (void)updateGizmoData:(id)a3 forUniqueId:(id)a4;
@end

@implementation ADAccount

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ADAccount;
  id v4 = -[ADAccount description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"%@ {identifier = %@, label = %@, assistantIdentifier = %@, speechIdentifier = %@} (needsCreation = %d, needsDestruction = %d, isReadOnly = %d)",  v5,  self->_identifier,  self->_label,  self->_assistantIdentifier,  self->_speechIdentifier,  self->_needsCreation,  self->_needsDestruction,  self->_isReadOnly);

  return v6;
}

- (ADAccount)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ADAccount;
  v2 = -[ADAccount init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create(0LL, v4);

    keychainQueue = v2->_keychainQueue;
    v2->_keychainQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (ADAccount)initWithMessageDictionary:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = -[ADAccount init](self, "init");
  v6 = v5;
  if (v5)
  {
    v5->_isReadOnly = 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoIdentifierKey]);
    -[ADAccount setIdentifier:](v6, "setIdentifier:", v7);

    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoLabelKey]);
    -[ADAccount setLabel:](v6, "setLabel:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoAssistantIdentifierKey]);
    -[ADAccount setAssistantIdentifier:](v6, "setAssistantIdentifier:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoLoggingAssistantIdentifierKey]);
    -[ADAccount setLoggingAssistantIdentifier:](v6, "setLoggingAssistantIdentifier:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoSpeechIdentifierKey]);
    -[ADAccount setSpeechIdentifier:](v6, "setSpeechIdentifier:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoHostnameKey]);
    -[ADAccount setHostname:](v6, "setHostname:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoPeerAssistantIdentifierKey]);
    -[ADAccount setPeerAssistantIdentifier:](v6, "setPeerAssistantIdentifier:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoPeerLoggingAssistantIdentifierKey]);
    -[ADAccount setPeerLoggingAssistantIdentifier:](v6, "setPeerLoggingAssistantIdentifier:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoPeerSpeechIdentifierKey]);
    -[ADAccount setPeerSpeechIdentifier:](v6, "setPeerSpeechIdentifier:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoPeerUserAgentStringKey]);
    -[ADAccount setPeerUserAgentString:](v6, "setPeerUserAgentString:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoPeerLanguageCodeKey]);
    -[ADAccount setPeerLanguageCode:](v6, "setPeerLanguageCode:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoPeerSiriEnabledKey]);
    -[ADAccount setPeerSiriEnabled:](v6, "setPeerSiriEnabled:", [v18 BOOLValue]);

    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoPeerHostnameKey]);
    -[ADAccount setPeerHostname:](v6, "setPeerHostname:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoPredefinedServerKey]);
    -[ADAccount setPredefinedServer:](v6, "setPredefinedServer:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoAceHostKey]);
    -[ADAccount setAceHost:](v6, "setAceHost:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoConnectionPolicyKey]);
    -[ADAccount setConnectionPolicy:](v6, "setConnectionPolicy:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoConnectionPolicyDateKey]);
    -[ADAccount setConnectionPolicyDate:](v6, "setConnectionPolicyDate:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoConnectionPolicyFirstFailureDateKey]);
    -[ADAccount setConnectionPolicyFirstFailureDate:](v6, "setConnectionPolicyFirstFailureDate:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoConnectionPolicyHostnameKey]);
    -[ADAccount setConnectionPolicyHostname:](v6, "setConnectionPolicyHostname:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoGroupKey]);
    -[ADAccount setGroup:](v6, "setGroup:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kAFAccountInfoLocaleIdentifierKey]);
    -[ADAccount setLocaleIdentifier:](v6, "setLocaleIdentifier:", v27);
  }

  return v6;
}

- (id)messageDictionary
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:kAFAccountInfoIdentifierKey];
  }
  label = self->_label;
  if (label) {
    [v4 setObject:label forKey:kAFAccountInfoLabelKey];
  }
  assistantIdentifier = self->_assistantIdentifier;
  if (assistantIdentifier) {
    [v4 setObject:assistantIdentifier forKey:kAFAccountInfoAssistantIdentifierKey];
  }
  loggingAssistantIdentifier = self->_loggingAssistantIdentifier;
  if (loggingAssistantIdentifier) {
    [v4 setObject:loggingAssistantIdentifier forKey:kAFAccountInfoLoggingAssistantIdentifierKey];
  }
  speechIdentifier = self->_speechIdentifier;
  if (speechIdentifier) {
    [v4 setObject:speechIdentifier forKey:kAFAccountInfoSpeechIdentifierKey];
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount hostname](self, "hostname"));
  [v4 setObject:v10 forKey:kAFAccountInfoHostnameKey];

  peerAssistantIdentifier = self->_peerAssistantIdentifier;
  if (peerAssistantIdentifier) {
    [v4 setObject:peerAssistantIdentifier forKey:kAFAccountInfoPeerAssistantIdentifierKey];
  }
  peerLoggingAssistantIdentifier = self->_peerLoggingAssistantIdentifier;
  if (peerLoggingAssistantIdentifier) {
    [v4 setObject:peerLoggingAssistantIdentifier forKey:kAFAccountInfoPeerLoggingAssistantIdentifierKey];
  }
  peerSpeechIdentifier = self->_peerSpeechIdentifier;
  if (peerSpeechIdentifier) {
    [v4 setObject:peerSpeechIdentifier forKey:kAFAccountInfoPeerSpeechIdentifierKey];
  }
  peerUserAgentString = self->_peerUserAgentString;
  if (peerUserAgentString) {
    [v4 setObject:peerUserAgentString forKey:kAFAccountInfoPeerUserAgentStringKey];
  }
  peerLanguageCode = self->_peerLanguageCode;
  if (peerLanguageCode) {
    [v4 setObject:peerLanguageCode forKey:kAFAccountInfoPeerLanguageCodeKey];
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_peerSiriEnabled));
  [v4 setObject:v16 forKey:kAFAccountInfoPeerSiriEnabledKey];

  peerHostname = self->_peerHostname;
  if (peerHostname) {
    [v4 setObject:peerHostname forKey:kAFAccountInfoPeerHostnameKey];
  }
  group = self->_group;
  if (group) {
    [v4 setObject:group forKey:kAFAccountInfoGroupKey];
  }
  predefinedServer = self->_predefinedServer;
  if (predefinedServer) {
    [v4 setObject:predefinedServer forKey:kAFAccountInfoPredefinedServerKey];
  }
  aceHost = self->_aceHost;
  if (aceHost) {
    [v4 setObject:aceHost forKey:kAFAccountInfoAceHostKey];
  }
  connectionPolicy = self->_connectionPolicy;
  if (connectionPolicy) {
    [v4 setObject:connectionPolicy forKey:kAFAccountInfoConnectionPolicyKey];
  }
  connectionPolicyDate = self->_connectionPolicyDate;
  if (connectionPolicyDate) {
    [v4 setObject:connectionPolicyDate forKey:kAFAccountInfoConnectionPolicyDateKey];
  }
  connectionPolicyFirstFailureDate = self->_connectionPolicyFirstFailureDate;
  if (connectionPolicyFirstFailureDate) {
    [v4 setObject:connectionPolicyFirstFailureDate forKey:kAFAccountInfoConnectionPolicyFirstFailureDateKey];
  }
  connectionPolicyHostname = self->_connectionPolicyHostname;
  if (connectionPolicyHostname) {
    [v4 setObject:connectionPolicyHostname forKey:kAFAccountInfoConnectionPolicyHostnameKey];
  }
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier) {
    [v4 setObject:localeIdentifier forKey:kAFAccountInfoLocaleIdentifierKey];
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_needsCreation));
  [v4 setObject:v26 forKey:kAFAccountInfoNeedsCreationKey];

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_needsDestruction));
  [v4 setObject:v27 forKey:kAFAccountInfoNeedsDestructionKey];

  return v4;
}

- (NSString)identifier
{
  identifier = self->_identifier;
  if (!identifier)
  {
    uint64_t v4 = SiriCoreUUIDStringCreate(0LL);
    dispatch_queue_t v5 = (NSString *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_identifier;
    self->_identifier = v5;

    -[ADAccount _markKeychainValuesAsDirty](self, "_markKeychainValuesAsDirty");
    identifier = self->_identifier;
  }

  return identifier;
}

- (void)setAssistantIdentifier:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  assistantIdentifier = self->_assistantIdentifier;
  if (assistantIdentifier != v4 && !-[NSString isEqualToString:](assistantIdentifier, "isEqualToString:", v4))
  {
    v6 = (NSString *)-[NSString copy](v4, "copy");
    v7 = self->_assistantIdentifier;
    self->_assistantIdentifier = v6;

    self->_sharedDataChanged = 1;
    keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A6EC8;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }
}

- (void)setLoggingAssistantIdentifier:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  loggingAssistantIdentifier = self->_loggingAssistantIdentifier;
  if (loggingAssistantIdentifier != v4
    && !-[NSString isEqualToString:](loggingAssistantIdentifier, "isEqualToString:", v4))
  {
    v6 = (NSString *)-[NSString copy](v4, "copy");
    v7 = self->_loggingAssistantIdentifier;
    self->_loggingAssistantIdentifier = v6;

    self->_sharedDataChanged = 1;
    keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A6EB4;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }
}

- (void)setSpeechIdentifier:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  speechIdentifier = self->_speechIdentifier;
  if (speechIdentifier != v4 && !-[NSString isEqualToString:](speechIdentifier, "isEqualToString:", v4))
  {
    v6 = (NSString *)-[NSString copy](v4, "copy");
    v7 = self->_speechIdentifier;
    self->_speechIdentifier = v6;

    self->_sharedDataChanged = 1;
    keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A6EA0;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }
}

- (id)_hostnameOverride
{
  uint64_t v3 = AFInternalConfigValueForKey(@"Predefined Servers", a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_t v5 = self->_predefinedServer;
  if (!v5)
  {
    if ((AFPreferencesShouldIgnoreInternalConfig() & 1) != 0)
    {
      dispatch_queue_t v5 = 0LL;
LABEL_14:
      v6 = 0LL;
      goto LABEL_15;
    }

    hostname = self->_hostname;
    if (hostname && !-[NSString isEqualToString:](hostname, "isEqualToString:", @"https://guzzoni.apple.com"))
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1000A6E68;
      v16[3] = &unk_1004EFD30;
      v16[4] = self;
      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 keysOfEntriesPassingTest:v16]);
      if ([v11 count])
      {
        dispatch_queue_t v5 = (NSString *)objc_claimAutoreleasedReturnValue([v11 anyObject]);
      }

      else
      {
        uint64_t v13 = AFInternalConfigValueForKey(@"Deprecated Servers", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        dispatch_queue_t v5 = (NSString *)objc_claimAutoreleasedReturnValue([v14 objectForKey:self->_hostname]);
      }

      if (!v5) {
        goto LABEL_14;
      }
    }

    else
    {
      uint64_t v10 = AFInternalConfigValueForKey(@"Default Server Override", v8);
      dispatch_queue_t v5 = (NSString *)objc_claimAutoreleasedReturnValue(v10);
      if (!v5) {
        goto LABEL_14;
      }
    }

    -[ADAccount setPredefinedServer:](self, "setPredefinedServer:", v5);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v5]);
  v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[ADAccount _hostnameOverride]";
    __int16 v19 = 2112;
    v20 = v5;
    __int16 v21 = 2112;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Found Predefined Server '%@' = %@", buf, 0x20u);
  }

- (id)_hostnameQAOverride
{
  if (self->_hasCachedHostnameQAOverride) {
    return self->_cachedHostnameQAOverride;
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount _serverOverrideFromPreferences](self, "_serverOverrideFromPreferences"));
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    if (([v4 hasSuffix:@"apple.com"] & 1) != 0
      || ([v5 rangeOfString:@"apple.com:"], v6))
    {
      v7 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315394;
        uint64_t v13 = "-[ADAccount _hostnameQAOverride]";
        __int16 v14 = 2112;
        v15 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Using Server Override %@",  (uint8_t *)&v12,  0x16u);
      }
    }

    else
    {
      uint64_t v8 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315394;
        uint64_t v13 = "-[ADAccount _hostnameQAOverride]";
        __int16 v14 = 2112;
        v15 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Bad server override %@",  (uint8_t *)&v12,  0x16u);
      }

      dispatch_queue_t v5 = 0LL;
    }
  }

  self->_hasCachedHostnameQAOverride = 1;
  cachedHostnameQAOverride = self->_cachedHostnameQAOverride;
  self->_cachedHostnameQAOverride = (NSString *)v5;
  id v10 = v5;

  v11 = self->_cachedHostnameQAOverride;
  return v11;
}

- (id)_serverOverrideFromPreferences
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount _preferences](self, "_preferences"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 serverOverride]);

  if (!v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));

    if (!v4)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[ADAccount _serverOverrideFromPreferences]"));
      [v11 handleFailureInFunction:v12, @"ADAccount.m", 540, @"Invalid parameter not satisfying: %@", @"[AFInstanceContext currentContext] != nil" file lineNumber description];
    }

    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));
    unsigned int v6 = [v5 isEndpoint];

    if (v6)
    {
      v7 = objc_alloc(&OBJC_CLASS___ADPreferences);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext defaultContext](&OBJC_CLASS___AFInstanceContext, "defaultContext"));
      v9 = -[ADPreferences initWithInstanceContext:](v7, "initWithInstanceContext:", v8);
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADPreferences serverOverride](v9, "serverOverride"));
    }

    else
    {
      uint64_t v3 = 0LL;
    }
  }

  return v3;
}

- (NSString)hostname
{
  cachedHostname = self->_cachedHostname;
  if (cachedHostname)
  {
    uint64_t v3 = cachedHostname;
  }

  else
  {
    if (AFIsInternalInstall(self))
    {
      dispatch_queue_t v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADAccount _hostnameOverride](self, "_hostnameOverride"));
      hostname = v5;
      if (v5 || (hostname = self->_hostname) != 0LL) {
        v7 = hostname;
      }
      else {
        v7 = @"https://guzzoni.apple.com";
      }
    }

    else
    {
      v7 = @"https://guzzoni.apple.com";
    }

    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[ADAccount _hostnameQAOverride](self, "_hostnameQAOverride"));
    v9 = (void *)v8;
    if (v8) {
      id v10 = (void *)v8;
    }
    else {
      id v10 = v7;
    }
    id v11 = v10;

    int v12 = (NSString *)[v11 copy];
    uint64_t v13 = self->_cachedHostname;
    self->_cachedHostname = v12;

    uint64_t v3 = self->_cachedHostname;
  }

  return v3;
}

- (void)setHostname:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  hostname = self->_hostname;
  if (hostname != v4)
  {
    v9 = v4;
    unsigned __int8 v6 = -[NSString isEqualToString:](hostname, "isEqualToString:", v4);
    uint64_t v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      uint64_t v8 = self->_hostname;
      self->_hostname = v7;

      -[ADAccount resetCachedHostname](self, "resetCachedHostname");
      uint64_t v4 = v9;
    }
  }
}

- (void)resetCachedHostname
{
  cachedHostname = self->_cachedHostname;
  self->_cachedHostname = 0LL;

  self->_hasCachedHostnameQAOverride = 0;
}

- (NSString)localeIdentifier
{
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier)
  {
    uint64_t v3 = localeIdentifier;
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](&OBJC_CLASS___NSLocale, "autoupdatingCurrentLocale"));
    uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue([v4 localeIdentifier]);
  }

  return v3;
}

- (id)serverCertificateData
{
  cachedServerCertificateData = self->_cachedServerCertificateData;
  if (!cachedServerCertificateData)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount _keychainValueForKey:](self, "_keychainValueForKey:", @"Server Certificate Data"));
    dispatch_queue_t v5 = (NSData *)[v4 copy];
    unsigned __int8 v6 = self->_cachedServerCertificateData;
    self->_cachedServerCertificateData = v5;

    cachedServerCertificateData = self->_cachedServerCertificateData;
  }

  return cachedServerCertificateData;
}

- (void)setServerCertificateData:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (NSData *)[v6 copy];
  cachedServerCertificateData = self->_cachedServerCertificateData;
  self->_cachedServerCertificateData = v4;

  -[ADAccount _setKeychainValue:forKey:](self, "_setKeychainValue:forKey:", v6, @"Server Certificate Data");
}

- (id)validationData
{
  cachedValidationData = self->_cachedValidationData;
  if (!cachedValidationData)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount _keychainValueForKey:](self, "_keychainValueForKey:", @"Validation Data"));
    dispatch_queue_t v5 = (NSData *)[v4 copy];
    id v6 = self->_cachedValidationData;
    self->_cachedValidationData = v5;

    cachedValidationData = self->_cachedValidationData;
  }

  return cachedValidationData;
}

- (void)setValidationData:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (NSData *)[v6 copy];
  cachedValidationData = self->_cachedValidationData;
  self->_cachedValidationData = v4;

  -[ADAccount _setKeychainValue:forKey:](self, "_setKeychainValue:forKey:", v6, @"Validation Data");
}

- (BOOL)setValidationDataSync:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (NSData *)[v4 copy];
  cachedValidationData = self->_cachedValidationData;
  self->_cachedValidationData = v5;

  LOBYTE(self) = -[ADAccount _setKeychainValueSync:forKey:]( self,  "_setKeychainValueSync:forKey:",  v4,  @"Validation Data");
  return (char)self;
}

- (void)setValidationExpiration:(id)a3
{
  id v4 = (NSDate *)[a3 copy];
  validationExpiration = self->_validationExpiration;
  self->_validationExpiration = v4;
}

- (id)localCryptoKeyData
{
  cachedLocalCryptoKeyData = self->_cachedLocalCryptoKeyData;
  if (!cachedLocalCryptoKeyData)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount _keychainValueForKey:](self, "_keychainValueForKey:", @"Local Crypto Key Data"));
    dispatch_queue_t v5 = (NSData *)[v4 copy];
    id v6 = self->_cachedLocalCryptoKeyData;
    self->_cachedLocalCryptoKeyData = v5;

    cachedLocalCryptoKeyData = self->_cachedLocalCryptoKeyData;
  }

  return cachedLocalCryptoKeyData;
}

- (BOOL)setLocalCryptoKeyData:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[ADAccount _setKeychainValueSync:forKey:]( self,  "_setKeychainValueSync:forKey:",  v4,  @"Local Crypto Key Data");
  if (v5)
  {
    id v6 = (NSData *)[v4 copy];
    cachedLocalCryptoKeyData = self->_cachedLocalCryptoKeyData;
    self->_cachedLocalCryptoKeyData = v6;
  }

  return v5;
}

- (void)clearAssistantData
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[ADAccount _preferences](self, "_preferences"));
  [v3 setCountryCode:0];
}

- (void)clearAssistantDataDuringForcedRedirect
{
}

- (id)aceHostCluster
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount aceHost](self, "aceHost"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 componentsSeparatedByString:@":"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  return v4;
}

- (void)_markKeychainValuesAsDirty
{
  keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A6DC4;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(keychainQueue, block);
}

- (id)_keychainValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000A6D70;
  v16 = sub_1000A6D80;
  id v17 = 0LL;
  keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A6D88;
  block[3] = &unk_1004FBE80;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(keychainQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)_removeKeychainValueForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!self->_isReadOnly)
  {
    keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000A6D64;
    v7[3] = &unk_1004FD968;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(keychainQueue, v7);
  }
}

- (void)_setKeychainValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_isReadOnly && self->_identifier)
  {
    keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A6D54;
    block[3] = &unk_1004FD4C0;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(keychainQueue, block);
  }
}

- (BOOL)_onQueueSetKeychainValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_keychainQueue);
  if (self->_isReadOnly || (identifier = self->_identifier) == 0LL) {
    char v8 = 0;
  }
  else {
    char v8 = AFKeychainSetValueForAccountAndKey(v6, identifier, v7);
  }

  return v8;
}

- (BOOL)_setKeychainValueSync:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_isReadOnly || !self->_identifier)
  {
    BOOL v8 = 0;
  }

  else
  {
    uint64_t v16 = 0LL;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000LL;
    char v19 = 0;
    keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000A6D1C;
    v11[3] = &unk_1004F68C8;
    v15 = &v16;
    id v12 = v6;
    uint64_t v13 = self;
    id v14 = v7;
    dispatch_sync(keychainQueue, v11);
    BOOL v8 = *((_BYTE *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }

  return v8;
}

- (id)_preferences
{
  instanceContext = self->_instanceContext;
  if (!instanceContext || -[AFInstanceContext isCurrent](instanceContext, "isCurrent")) {
    return (id)objc_claimAutoreleasedReturnValue( +[ADPreferences sharedPreferences]( &OBJC_CLASS___ADPreferences,  "sharedPreferences"));
  }
  else {
    return  -[ADPreferences initWithInstanceContext:]( objc_alloc(&OBJC_CLASS___ADPreferences),  "initWithInstanceContext:",  self->_instanceContext);
  }
}

- (id)_infoDictionaryForPreferences
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = v3;
  label = self->_label;
  if (label) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", label, @"Label");
  }
  hostname = self->_hostname;
  if (hostname) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", hostname, @"Hostname");
  }
  group = self->_group;
  if (group) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", group, @"Group");
  }
  predefinedServer = self->_predefinedServer;
  if (predefinedServer) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", predefinedServer, @"Predefined Server");
  }
  aceHost = self->_aceHost;
  if (aceHost) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", aceHost, @"Ace Host");
  }
  connectionPolicy = self->_connectionPolicy;
  if (connectionPolicy) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", connectionPolicy, @"Connection Policy");
  }
  connectionPolicyDate = self->_connectionPolicyDate;
  if (connectionPolicyDate) {
    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  connectionPolicyDate,  @"Connection Policy Date");
  }
  connectionPolicyFirstFailureDate = self->_connectionPolicyFirstFailureDate;
  if (connectionPolicyFirstFailureDate) {
    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  connectionPolicyFirstFailureDate,  @"Connection Policy First Failure Date");
  }
  connectionPolicyHostname = self->_connectionPolicyHostname;
  if (connectionPolicyHostname) {
    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  connectionPolicyHostname,  @"Connection Policy Hostname");
  }
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", localeIdentifier, @"Locale Identifier");
  }
  lastAssistantDataAnchor = self->_lastAssistantDataAnchor;
  if (lastAssistantDataAnchor) {
    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  lastAssistantDataAnchor,  @"Last Assistant Data Anchor");
  }
  validationExpiration = self->_validationExpiration;
  if (validationExpiration) {
    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  validationExpiration,  @"Validation Expiration");
  }
  validationVersion = self->_validationVersion;
  if (validationVersion) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", validationVersion, @"Validation Version");
  }
  peerHostname = self->_peerHostname;
  if (peerHostname) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", peerHostname, @"Peer Hostname");
  }
  if (self->_needsCreation)
  {
    char v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v19, @"Needs Creation");
  }

  if (self->_needsDestruction)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v20, @"Needs Destruction");
  }

  uint64_t v21 = AFBuildVersion();
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  if (v22) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v22, @"Build Version");
  }
  if (self->_identifier)
  {
    v42 = self->_assistantIdentifier;
    v23 = self->_loggingAssistantIdentifier;
    v24 = self->_speechIdentifier;
    v25 = self->_peerAssistantIdentifier;
    v26 = self->_peerLoggingAssistantIdentifier;
    v27 = self->_peerSpeechIdentifier;
    v44 = v22;
    v28 = self->_peerUserAgentString;
    v29 = self->_peerLanguageCode;
    BOOL peerSiriEnabled = self->_peerSiriEnabled;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount pairedWatches](self, "pairedWatches"));
    queue = (dispatch_queue_s *)self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A6968;
    block[3] = &unk_1004F5668;
    block[4] = self;
    v49 = v42;
    v50 = v23;
    v51 = v24;
    v52 = v25;
    v53 = v26;
    v54 = v27;
    v55 = v28;
    v56 = v29;
    BOOL v58 = peerSiriEnabled;
    id v57 = v31;
    id v47 = v31;
    v46 = v29;
    v32 = v28;
    v22 = v44;
    v45 = v32;
    v33 = v27;
    v34 = v26;
    v35 = v25;
    v36 = v24;
    v37 = v23;
    v38 = v42;
    dispatch_async(queue, block);
  }

  if (-[NSMutableDictionary count](v4, "count", v42)) {
    v39 = v4;
  }
  else {
    v39 = 0LL;
  }
  v40 = v39;

  return v40;
}

- (void)updateAssistantIdentifiers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);

  -[ADAccount setAssistantIdentifier:](self, "setAssistantIdentifier:", v4);
  -[ADAccount setLoggingAssistantIdentifier:](self, "setLoggingAssistantIdentifier:", v6);
  -[ADAccount setSpeechIdentifier:](self, "setSpeechIdentifier:", v8);
  v9 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315906;
    id v11 = "-[ADAccount updateAssistantIdentifiers]";
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    v15 = v6;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s assistantId created: %@ loggingAssistantId: %@ speechId: %@",  (uint8_t *)&v10,  0x2Au);
  }
}

- (void)save
{
  BOOL isReadOnly = self->_isReadOnly;
  id v4 = (void *)AFSiriLogContextDaemon;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (isReadOnly)
  {
    if (!v5) {
      return;
    }
    id v6 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount identifier](self, "identifier"));
    int v28 = 136315394;
    v29 = "-[ADAccount save]";
    __int16 v30 = 2112;
    v31 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Unable to save account info %@ because it is read only.",  (uint8_t *)&v28,  0x16u);
  }

  else
  {
    if (v5)
    {
      BOOL v8 = v4;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount identifier](self, "identifier"));
      int v28 = 136315394;
      v29 = "-[ADAccount save]";
      __int16 v30 = 2112;
      v31 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Saving account info %@",  (uint8_t *)&v28,  0x16u);
    }

    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ADAccount _preferences](self, "_preferences"));
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount identifier](self, "identifier"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s accountInfoForIdentifier:](v6, "accountInfoForIdentifier:", v10));

    if (v11)
    {
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForKey:@"Assistant Identifier"]);
      uint64_t v13 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        assistantIdentifier = self->_assistantIdentifier;
        int v28 = 136315651;
        v29 = "-[ADAccount save]";
        __int16 v30 = 2113;
        v31 = v12;
        __int16 v32 = 2113;
        v33 = assistantIdentifier;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s oldAssistantID:%{private}@\tnewAssistantID:%{private}@",  (uint8_t *)&v28,  0x20u);
      }

      v15 = self->_assistantIdentifier;
      BOOL v16 = !v12 && v15 || ([v12 isEqualToString:v15] & 1) == 0;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForKey:@"Speech Identifier"]);
      char v19 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        speechIdentifier = self->_speechIdentifier;
        int v28 = 136315651;
        v29 = "-[ADAccount save]";
        __int16 v30 = 2113;
        v31 = v18;
        __int16 v32 = 2113;
        v33 = speechIdentifier;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s oldSpeechID:%{private}@\tnewSpeechID:%{private}@",  (uint8_t *)&v28,  0x20u);
      }

      uint64_t v21 = self->_speechIdentifier;
      BOOL v17 = !v18 && v21 || ([v18 isEqualToString:v21] & 1) == 0;
    }

    else
    {
      BOOL v17 = 1;
      BOOL v16 = 1;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount _infoDictionaryForPreferences](self, "_infoDictionaryForPreferences"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount identifier](self, "identifier"));
    -[os_log_s setAccountInfo:forIdentifier:](v6, "setAccountInfo:forIdentifier:", v22, v23);

    -[os_log_s synchronize](v6, "synchronize");
    if (self->_sharedDataChanged)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v24 postNotificationName:@"ADSharedDataDidChangeNotification" object:0];

      self->_sharedDataChanged = 0;
    }

    if (v16)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v25 postNotificationName:@"ADActiveAccountIdentifierDidChangeNotification" object:0];

      if (self->_assistantIdentifier)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        [v26 postNotificationName:@"AssistantAccountCreated" object:0];
      }
    }

    if (v17)
    {
      v27 = objc_alloc_init(&OBJC_CLASS___ADAnalyticsFBFDeliveryInfrastructure);
      -[ADAnalyticsFBFDeliveryInfrastructure deliverLogViewerIdentifier:]( v27,  "deliverLogViewerIdentifier:",  self->_speechIdentifier);
    }
  }
}

- (void)removeAndSave
{
  if (self->_identifier)
  {
    if (self->_isReadOnly)
    {
      id v3 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        id v4 = v3;
        BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount identifier](self, "identifier"));
        *(_DWORD *)buf = 136315394;
        uint64_t v13 = "-[ADAccount removeAndSave]";
        __int16 v14 = 2112;
        v15 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Unable to remove and save account info %@ because it is read only.",  buf,  0x16u);
      }
    }

    else
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[ADAccount _preferences](self, "_preferences"));
      [v11 setAccountInfo:0 forIdentifier:self->_identifier];
      [v11 synchronize];
      -[ADAccount setServerCertificateData:](self, "setServerCertificateData:", 0LL);
      -[ADAccount setValidationData:](self, "setValidationData:", 0LL);
      -[ADAccount setLocalCryptoKeyData:](self, "setLocalCryptoKeyData:", 0LL);
      -[ADAccount _removeKeychainValueForKey:](self, "_removeKeychainValueForKey:", @"Assistant Identifier");
      -[ADAccount _removeKeychainValueForKey:]( self,  "_removeKeychainValueForKey:",  @"Logging Assistant Identifier");
      uint64_t v6 = AFIsNano(-[ADAccount _removeKeychainValueForKey:](self, "_removeKeychainValueForKey:", @"Speech Identifier"));
      if ((v6 & 1) != 0 || (id v8 = (id)AFIsHorseman(v6, v7), (_DWORD)v8))
      {
        -[ADAccount _removeKeychainValueForKey:]( self,  "_removeKeychainValueForKey:",  @"Peer Assistant Identifier");
        -[ADAccount _removeKeychainValueForKey:]( self,  "_removeKeychainValueForKey:",  @"Peer Logging Assistant Identifier");
        -[ADAccount _removeKeychainValueForKey:](self, "_removeKeychainValueForKey:", @"Peer Speech Identifier");
        -[ADAccount _removeKeychainValueForKey:](self, "_removeKeychainValueForKey:", @"Peer User Agent String");
        -[ADAccount _removeKeychainValueForKey:](self, "_removeKeychainValueForKey:", @"Peer Language Code");
        id v8 = -[ADAccount _removeKeychainValueForKey:](self, "_removeKeychainValueForKey:", @"Peer Siri Enabled");
      }

      uint64_t v10 = AFSupportsPairedDevice(v8, v9);
      if ((_DWORD)v10 && (AFIsNano(v10) & 1) == 0) {
        -[ADAccount _removeKeychainValueForKey:](self, "_removeKeychainValueForKey:", @"Watch Data Exists");
      }
      -[ADAccount _markKeychainValuesAsDirty](self, "_markKeychainValuesAsDirty");
    }
  }

- (void)setIdentifier:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (NSString)loggingAssistantIdentifier
{
  return self->_loggingAssistantIdentifier;
}

- (NSString)speechIdentifier
{
  return self->_speechIdentifier;
}

- (NSString)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (NSString)predefinedServer
{
  return self->_predefinedServer;
}

- (void)setPredefinedServer:(id)a3
{
}

- (NSString)aceHost
{
  return self->_aceHost;
}

- (void)setAceHost:(id)a3
{
}

- (NSDictionary)connectionPolicy
{
  return self->_connectionPolicy;
}

- (void)setConnectionPolicy:(id)a3
{
}

- (NSDate)connectionPolicyDate
{
  return self->_connectionPolicyDate;
}

- (void)setConnectionPolicyDate:(id)a3
{
}

- (NSString)connectionPolicyHostname
{
  return self->_connectionPolicyHostname;
}

- (void)setConnectionPolicyHostname:(id)a3
{
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (NSString)lastAssistantDataAnchor
{
  return self->_lastAssistantDataAnchor;
}

- (void)setLastAssistantDataAnchor:(id)a3
{
}

- (NSDate)validationExpiration
{
  return self->_validationExpiration;
}

- (NSNumber)validationVersion
{
  return self->_validationVersion;
}

- (void)setValidationVersion:(id)a3
{
}

- (BOOL)needsCreation
{
  return self->_needsCreation;
}

- (void)setNeedsCreation:(BOOL)a3
{
  self->_needsCreation = a3;
}

- (BOOL)needsDestruction
{
  return self->_needsDestruction;
}

- (void)setNeedsDestruction:(BOOL)a3
{
  self->_needsDestruction = a3;
}

- (unint64_t)connectionPolicyFailureCount
{
  return self->_connectionPolicyFailureCount;
}

- (void)setConnectionPolicyFailureCount:(unint64_t)a3
{
  self->_connectionPolicyFailureCount = a3;
}

- (NSDate)connectionPolicyFirstFailureDate
{
  return self->_connectionPolicyFirstFailureDate;
}

- (void)setConnectionPolicyFirstFailureDate:(id)a3
{
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (void)setIsReadOnly:(BOOL)a3
{
  self->_BOOL isReadOnly = a3;
}

- (AFInstanceContext)instanceContext
{
  return self->_instanceContext;
}

- (void)setInstanceContext:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)activeAccount
{
  return [a1 activeAccountForInstanceContext:0];
}

+ (BOOL)setActiveAccountIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifiers]);
  unsigned int v6 = [v5 containsObject:v3];

  if (v6)
  {
    [v4 setActiveAccountIdentifier:v3];
    [v4 synchronize];
  }

  return v6;
}

+ (id)activeAccountForInstanceContext:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 isCurrent] & 1) == 0)
  {
    BOOL v5 = -[ADPreferences initWithInstanceContext:]( objc_alloc(&OBJC_CLASS___ADPreferences),  "initWithInstanceContext:",  v4);
    uint64_t v6 = 1LL;
  }

  else
  {
    BOOL v5 = (ADPreferences *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    uint64_t v6 = 0LL;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADPreferences activeAccountIdentifier](v5, "activeAccountIdentifier"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADPreferences accountIdentifiers](v5, "accountIdentifiers"));
  uint64_t v9 = v8;
  if (!v7 || ([v8 containsObject:v7] & 1) == 0)
  {
    if ([v9 count])
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 objectAtIndex:0]);

      uint64_t v7 = (void *)v10;
      if (v10) {
        goto LABEL_9;
      }
    }

    else
    {

      uint64_t v7 = 0LL;
    }

+ (id)accountForIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountInfoForIdentifier:v4]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( [a1 _accountForIdentifier:v4 infoDictionary:v6 intanceContext:0 isReadOnly:0 isCoupledToHost:1]);

  return v7;
}

+ (id)_accountForIdentifier:(id)a3 infoDictionary:(id)a4 intanceContext:(id)a5 isReadOnly:(BOOL)a6 isCoupledToHost:(BOOL)a7
{
  BOOL v7 = a6;
  uint64_t v10 = (ADAccount *)a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    v100 = "+[ADAccount _accountForIdentifier:infoDictionary:intanceContext:isReadOnly:isCoupledToHost:]";
    __int16 v101 = 2113;
    v102 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s %{private}@", buf, 0x16u);
  }

  __int16 v14 = objc_alloc_init(&OBJC_CLASS___ADAccount);
  -[ADAccount setInstanceContext:](v14, "setInstanceContext:", v12);
  -[ADAccount setIsReadOnly:](v14, "setIsReadOnly:", v7);
  -[ADAccount setIdentifier:](v14, "setIdentifier:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Label"]);
  -[ADAccount setLabel:](v14, "setLabel:", v15);

  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Hostname"]);
  -[ADAccount setHostname:](v14, "setHostname:", v16);

  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Group"]);
  -[ADAccount setGroup:](v14, "setGroup:", v17);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Predefined Server"]);
  -[ADAccount setPredefinedServer:](v14, "setPredefinedServer:", v18);

  char v19 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Ace Host"]);
  -[ADAccount setAceHost:](v14, "setAceHost:", v19);

  uint64_t v20 = AFBuildVersion();
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Build Version"]);
  unsigned __int8 v23 = [v21 isEqualToString:v22];

  if ((v23 & 1) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Connection Policy"]);
    -[ADAccount setConnectionPolicy:](v14, "setConnectionPolicy:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Connection Policy Date"]);
    -[ADAccount setConnectionPolicyDate:](v14, "setConnectionPolicyDate:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Connection Policy Hostname"]);
    -[ADAccount setConnectionPolicyHostname:](v14, "setConnectionPolicyHostname:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Connection Policy First Failure Date"]);
    -[ADAccount setConnectionPolicyFirstFailureDate:](v14, "setConnectionPolicyFirstFailureDate:", v27);
  }

  else
  {
    -[ADAccount setConnectionPolicy:](v14, "setConnectionPolicy:", 0LL);
    -[ADAccount setConnectionPolicyDate:](v14, "setConnectionPolicyDate:", 0LL);
    -[ADAccount setConnectionPolicyHostname:](v14, "setConnectionPolicyHostname:", 0LL);
  }

  int v28 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Locale Identifier"]);
  -[ADAccount setLocaleIdentifier:](v14, "setLocaleIdentifier:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Last Assistant Data Anchor"]);
  -[ADAccount setLastAssistantDataAnchor:](v14, "setLastAssistantDataAnchor:", v29);

  __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Validation Expiration"]);
  -[ADAccount setValidationExpiration:](v14, "setValidationExpiration:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Validation Version"]);
  -[ADAccount setValidationVersion:](v14, "setValidationVersion:", v31);

  __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Peer Hostname"]);
  -[ADAccount setPeerHostname:](v14, "setPeerHostname:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Needs Creation"]);
  -[ADAccount setNeedsCreation:](v14, "setNeedsCreation:", [v33 BOOLValue]);

  v34 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Needs Destruction"]);
  -[ADAccount setNeedsDestruction:](v14, "setNeedsDestruction:", [v34 BOOLValue]);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount _keychainValueForKey:](v14, "_keychainValueForKey:", @"Assistant Identifier"));
  v36 = (void *)objc_claimAutoreleasedReturnValue( -[ADAccount _keychainValueForKey:]( v14,  "_keychainValueForKey:",  @"Logging Assistant Identifier"));
  v92 = v36;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount _keychainValueForKey:](v14, "_keychainValueForKey:", @"Speech Identifier"));
  if (v35)
  {
    v37 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v35, 4LL);
    -[ADAccount setAssistantIdentifier:](v14, "setAssistantIdentifier:", v37);
  }

  else
  {
    v37 = (NSString *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Assistant Identifier"]);
    if (v37)
    {
      v38 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v100 = "+[ADAccount _accountForIdentifier:infoDictionary:intanceContext:isReadOnly:isCoupledToHost:]";
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s Migrating assistantIdentifier", buf, 0xCu);
      }

      -[ADAccount setAssistantIdentifier:](v14, "setAssistantIdentifier:", v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](v37, "dataUsingEncoding:", 4LL));
      -[ADAccount _setKeychainValue:forKey:](v14, "_setKeychainValue:forKey:", v39, @"Assistant Identifier");

      v36 = v92;
    }
  }

  if (v36)
  {
    v40 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v36, 4LL);
    -[ADAccount setLoggingAssistantIdentifier:](v14, "setLoggingAssistantIdentifier:", v40);
  }

  else
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount assistantIdentifier](v14, "assistantIdentifier"));

    if (!v41) {
      goto LABEL_19;
    }
    v42 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v100 = "+[ADAccount _accountForIdentifier:infoDictionary:intanceContext:isReadOnly:isCoupledToHost:]";
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "%s Creating coupled assistantIdentifier",  buf,  0xCu);
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v40 = (NSString *)objc_claimAutoreleasedReturnValue([v43 UUIDString]);

    -[ADAccount setLoggingAssistantIdentifier:](v14, "setLoggingAssistantIdentifier:", v40);
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](v40, "dataUsingEncoding:", 4LL));
    -[ADAccount _setKeychainValue:forKey:](v14, "_setKeychainValue:forKey:", v44, @"Logging Assistant Identifier");

    v36 = v92;
  }

LABEL_19:
  if (v93)
  {
    v45 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v93, 4LL);
    -[ADAccount setSpeechIdentifier:](v14, "setSpeechIdentifier:", v45);
  }

  else
  {
    v45 = (NSString *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Speech Identifier"]);
    if (v45)
    {
      v46 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v100 = "+[ADAccount _accountForIdentifier:infoDictionary:intanceContext:isReadOnly:isCoupledToHost:]";
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "%s Migrating speechIdentifier", buf, 0xCu);
      }

      -[ADAccount setSpeechIdentifier:](v14, "setSpeechIdentifier:", v45);
      id v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](v45, "dataUsingEncoding:", 4LL));
      -[ADAccount _setKeychainValue:forKey:](v14, "_setKeychainValue:forKey:", v47, @"Speech Identifier");

      v36 = v92;
    }
  }

  uint64_t v49 = AFIsNano(v48);
  v91 = v35;
  if ((v49 & 1) != 0 || (uint64_t v51 = AFIsHorseman(v49, v50), (_DWORD)v51))
  {
    uint64_t v53 = objc_claimAutoreleasedReturnValue(-[ADAccount _keychainValueForKey:](v14, "_keychainValueForKey:", @"Peer Assistant Identifier"));
    if (v53)
    {
      v54 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v53, 4LL);
      -[ADAccount setPeerAssistantIdentifier:](v14, "setPeerAssistantIdentifier:", v54);
    }

    v90 = (void *)v53;
    v55 = (void *)objc_claimAutoreleasedReturnValue( -[ADAccount _keychainValueForKey:]( v14,  "_keychainValueForKey:",  @"Peer Logging Assistant Identifier"));
    if (v55)
    {
      v56 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v55, 4LL);
      -[ADAccount setPeerLoggingAssistantIdentifier:](v14, "setPeerLoggingAssistantIdentifier:", v56);
    }

    id v57 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount _keychainValueForKey:](v14, "_keychainValueForKey:", @"Peer Speech Identifier"));
    if (v57)
    {
      BOOL v58 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v57, 4LL);
      -[ADAccount setPeerSpeechIdentifier:](v14, "setPeerSpeechIdentifier:", v58);
    }

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount _keychainValueForKey:](v14, "_keychainValueForKey:", @"Peer User Agent String"));
    if (v59)
    {
      v60 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v59, 4LL);
      -[ADAccount setPeerUserAgentString:](v14, "setPeerUserAgentString:", v60);
    }

    v61 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount _keychainValueForKey:](v14, "_keychainValueForKey:", @"Peer Language Code"));
    if (v61)
    {
      v62 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v61, 4LL);
      -[ADAccount setPeerLanguageCode:](v14, "setPeerLanguageCode:", v62);
    }

    v63 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount _keychainValueForKey:](v14, "_keychainValueForKey:", @"Peer Siri Enabled"));
    if (v63)
    {
      id v88 = v12;
      v64 = v10;
      v65 = +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", objc_opt_class(&OBJC_CLASS___NSNumber));
      v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
      v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v66,  v63,  0LL));

      if ((objc_opt_respondsToSelector(v67, "BOOLValue") & 1) != 0) {
        id v68 = [v67 BOOLValue];
      }
      else {
        id v68 = 0LL;
      }
      -[ADAccount setPeerSiriEnabled:](v14, "setPeerSiriEnabled:", v68);

      uint64_t v10 = v64;
      id v12 = v88;
    }

    v35 = v91;
    v36 = v92;
  }

  uint64_t v69 = AFSupportsPairedDevice(v51, v52);
  if ((_DWORD)v69 && (AFIsNano(v69) & 1) == 0)
  {
    v70 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v100 = "+[ADAccount _accountForIdentifier:infoDictionary:intanceContext:isReadOnly:isCoupledToHost:]";
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }

    v71 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount _keychainValueForKey:](v14, "_keychainValueForKey:", @"Watch Data Exists"));
    if (v71)
    {
      id v89 = v12;
      v72 = v10;
      uint64_t v73 = objc_opt_class(&OBJC_CLASS___NSSet);
      uint64_t v74 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      v75 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v73,  v74,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
      v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
      v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v76,  v71,  0LL));

      v78 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int128 v94 = 0u;
      __int128 v95 = 0u;
      __int128 v96 = 0u;
      __int128 v97 = 0u;
      id v79 = v77;
      id v80 = [v79 countByEnumeratingWithState:&v94 objects:v98 count:16];
      if (v80)
      {
        id v81 = v80;
        uint64_t v82 = *(void *)v95;
        do
        {
          for (i = 0LL; i != v81; i = (char *)i + 1)
          {
            if (*(void *)v95 != v82) {
              objc_enumerationMutation(v79);
            }
            id v84 = [*(id *)(*((void *)&v94 + 1) + 8 * (void)i) mutableCopy];
            -[NSMutableSet addObject:](v78, "addObject:", v84);
          }

          id v81 = [v79 countByEnumeratingWithState:&v94 objects:v98 count:16];
        }

        while (v81);
      }

      -[ADAccount setPairedWatches:](v14, "setPairedWatches:", v78);
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
      objc_msgSend(v85, "setHasPairedWatches:", -[NSMutableSet count](v78, "count") != 0);

      uint64_t v10 = v72;
      id v12 = v89;
      v35 = v91;
      v36 = v92;
    }
  }

  v14->_sharedDataChanged = 0;
  v86 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    v100 = "+[ADAccount _accountForIdentifier:infoDictionary:intanceContext:isReadOnly:isCoupledToHost:]";
    __int16 v101 = 2113;
    v102 = v14;
    _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_INFO, "%s %{private}@", buf, 0x16u);
  }

  return v14;
}

- (NSString)peerAssistantIdentifier
{
  return self->_peerAssistantIdentifier;
}

- (void)setPeerAssistantIdentifier:(id)a3
{
  id v4 = (NSString *)a3;
  peerAssistantIdentifier = self->_peerAssistantIdentifier;
  if (peerAssistantIdentifier != v4 && !-[NSString isEqualToString:](peerAssistantIdentifier, "isEqualToString:", v4))
  {
    uint64_t v6 = (NSString *)-[NSString copy](v4, "copy");
    BOOL v7 = self->_peerAssistantIdentifier;
    self->_peerAssistantIdentifier = v6;

    keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A8ADC;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }
}

- (NSString)peerLoggingAssistantIdentifier
{
  return self->_peerLoggingAssistantIdentifier;
}

- (void)setPeerLoggingAssistantIdentifier:(id)a3
{
  id v4 = (NSString *)a3;
  peerLoggingAssistantIdentifier = self->_peerLoggingAssistantIdentifier;
  if (peerLoggingAssistantIdentifier != v4
    && !-[NSString isEqualToString:](peerLoggingAssistantIdentifier, "isEqualToString:", v4))
  {
    uint64_t v6 = (NSString *)-[NSString copy](v4, "copy");
    BOOL v7 = self->_peerLoggingAssistantIdentifier;
    self->_peerLoggingAssistantIdentifier = v6;

    keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A8AC8;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }
}

- (NSString)peerSpeechIdentifier
{
  return self->_peerSpeechIdentifier;
}

- (void)setPeerSpeechIdentifier:(id)a3
{
  id v4 = (NSString *)a3;
  peerSpeechIdentifier = self->_peerSpeechIdentifier;
  if (peerSpeechIdentifier != v4 && !-[NSString isEqualToString:](peerSpeechIdentifier, "isEqualToString:", v4))
  {
    uint64_t v6 = (NSString *)-[NSString copy](v4, "copy");
    BOOL v7 = self->_peerSpeechIdentifier;
    self->_peerSpeechIdentifier = v6;

    keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A8AB4;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }
}

- (NSString)peerUserAgentString
{
  return self->_peerUserAgentString;
}

- (void)setPeerUserAgentString:(id)a3
{
  id v4 = (NSString *)a3;
  peerUserAgentString = self->_peerUserAgentString;
  if (peerUserAgentString != v4 && !-[NSString isEqualToString:](peerUserAgentString, "isEqualToString:", v4))
  {
    uint64_t v6 = (NSString *)-[NSString copy](v4, "copy");
    BOOL v7 = self->_peerUserAgentString;
    self->_peerUserAgentString = v6;

    keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A8AA0;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }
}

- (NSString)peerHostname
{
  peerHostname = (NSString *)objc_claimAutoreleasedReturnValue(-[ADAccount _hostnameQAOverride](self, "_hostnameQAOverride"));
  id v4 = peerHostname;
  if (!peerHostname) {
    peerHostname = self->_peerHostname;
  }
  BOOL v5 = peerHostname;

  return v5;
}

- (void)setPeerHostname:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  peerHostname = self->_peerHostname;
  self->_peerHostname = v4;
}

- (NSString)peerLanguageCode
{
  return self->_peerLanguageCode;
}

- (void)setPeerLanguageCode:(id)a3
{
  id v4 = (NSString *)a3;
  peerLanguageCode = self->_peerLanguageCode;
  if (peerLanguageCode != v4 && !-[NSString isEqualToString:](peerLanguageCode, "isEqualToString:", v4))
  {
    uint64_t v6 = (NSString *)-[NSString copy](v4, "copy");
    BOOL v7 = self->_peerLanguageCode;
    self->_peerLanguageCode = v6;

    keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A8A8C;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }
}

- (BOOL)peerSiriEnabled
{
  return self->_peerSiriEnabled;
}

- (void)setPeerSiriEnabled:(BOOL)a3
{
  if (self->_peerSiriEnabled != a3)
  {
    self->_BOOL peerSiriEnabled = a3;
    keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A8A78;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }

- (void)setPairedWatches:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_pairedWatches] & 1) == 0)
  {
    uint64_t v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = "-[ADAccount(SharedData) setPairedWatches:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }

    objc_storeStrong((id *)&self->_pairedWatches, a3);
    keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A8A64;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }
}

- (id)pairedWatches
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = self->_pairedWatches;
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v8), "copy", (void)v11);
        -[NSMutableSet addObject:](v3, "addObject:", v9);

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (void)updateGizmoData:(id)a3 forUniqueId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_pairedWatches;
  v33 = (void *)objc_claimAutoreleasedReturnValue([v6 assistantId]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 languageCode]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 userAgent]);
  __int128 v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "-[ADAccount(SharedData) updateGizmoData:forUniqueId:]";
    __int16 v42 = 2112;
    v43 = v33;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
    if (!v7) {
      goto LABEL_39;
    }
  }

  else if (!v7)
  {
    goto LABEL_39;
  }

  if (!v33) {
    goto LABEL_39;
  }
  if (!-[NSMutableSet count](v8, "count")) {
    goto LABEL_15;
  }
  __int16 v32 = v9;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v12 = v8;
  id v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
  if (!v13) {
    goto LABEL_14;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v36;
  __int16 v30 = v8;
  id v31 = v6;
  v29 = self;
  while (2)
  {
    id v16 = v7;
    for (i = 0LL; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v36 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v18 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
      char v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"Watch Assistant Identifier"]);
      if ([v33 isEqualToString:v19])
      {
        id v9 = v32;
        if (v32) {
          [v18 setObject:v32 forKey:@"Watch Language"];
        }
        id v7 = v16;
        if (v10) {
          [v18 setObject:v10 forKey:@"Watch User Agent String"];
        }
        [v18 setObject:v16 forKey:@"Watch Override Id"];
        v25 = (os_log_s *)AFSiriLogContextDaemon;
        id v8 = v30;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v41 = "-[ADAccount(SharedData) updateGizmoData:forUniqueId:]";
          _os_log_debug_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "%s updated assistant data",  buf,  0xCu);
        }

        goto LABEL_37;
      }

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"Watch Override Id"]);
      if ([v20 isEqualToString:v16])
      {
        id v9 = v32;
        if (v32) {
          [v18 setObject:v32 forKey:@"Watch Language"];
        }
        id v7 = v16;
        if (v10) {
          [v18 setObject:v10 forKey:@"Watch User Agent String"];
        }
        [v18 setObject:v33 forKey:@"Watch Assistant Identifier"];
        v26 = (os_log_s *)AFSiriLogContextDaemon;
        id v8 = v30;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v41 = "-[ADAccount(SharedData) updateGizmoData:forUniqueId:]";
          _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "%s updated assistant for same device",  buf,  0xCu);
        }

LABEL_37:
        id v6 = v31;
        self = v29;
        goto LABEL_38;
      }
    }

    id v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
    id v7 = v16;
    id v8 = v30;
    id v6 = v31;
    self = v29;
    if (v14) {
      continue;
    }
    break;
  }

- (BOOL)watchExistsForAssistantId:(id)a3
{
  id v4 = a3;
  id v5 = self->_pairedWatches;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[ADAccount(SharedData) watchExistsForAssistantId:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v5;
  id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v16 + 1) + 8 * (void)i),  "objectForKey:",  @"Watch Assistant Identifier",  (void)v16));
        unsigned __int8 v13 = [v4 isEqualToString:v12];

        if ((v13 & 1) != 0)
        {
          BOOL v14 = 1;
          goto LABEL_13;
        }
      }

      id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v14 = 0;
LABEL_13:

  return v14;
}

- (id)saRemoteDevice:(id)a3
{
  id v4 = a3;
  id v5 = self->_pairedWatches;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v28 = "-[ADAccount(RemoteDevice) saRemoteDevice:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = v5;
  id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
LABEL_5:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v7);
      }
      __int128 v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", @"Watch Override Id", (void)v22));
      unsigned __int8 v14 = [v4 isEqualToString:v13];

      if ((v14 & 1) != 0) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
        if (v9) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }

    id v15 = v12;

    if (!v15) {
      goto LABEL_16;
    }
    __int128 v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      int v28 = "-[ADAccount(RemoteDevice) saRemoteDevice:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s Found paired watch", buf, 0xCu);
    }

    id v17 = objc_alloc_init(&OBJC_CLASS___SARemoteDevice);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"Watch Assistant Identifier"]);
    [v17 setAssistantId:v18];

    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"Watch User Agent String"]);
    [v17 setUserAgent:v19];

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"Watch Language"]);
    [v17 setLanguage:v20];

    [v17 setSiriEnabled:1];
  }

  else
  {
LABEL_11:

    id v15 = 0LL;
LABEL_16:
    id v17 = 0LL;
  }

  return v17;
}

- (id)saConnectionPolicy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount connectionPolicy](self, "connectionPolicy"));
  if (v2) {
    id v3 = [[SAConnectionPolicy alloc] initWithDictionary:v2];
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

- (id)connectionPolicyExpirationDate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount saConnectionPolicy](self, "saConnectionPolicy"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 timeToLive]);
  id v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    double v7 = fmin(v6, 604800.0);
  }

  else
  {
    double v7 = 604800.0;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount connectionPolicyDate](self, "connectionPolicyDate"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dateByAddingTimeInterval:v7]);

  return v9;
}

- (BOOL)hasConnectionPolicyFailed
{
  return -[ADAccount connectionPolicyFailureCount](self, "connectionPolicyFailureCount") > 1;
}

- (int64_t)connectionPolicyStatus
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount saConnectionPolicy](self, "saConnectionPolicy"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount connectionPolicyDate](self, "connectionPolicyDate"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount connectionPolicyHostname](self, "connectionPolicyHostname"));
  if (v3)
  {
    if (-[ADAccount needsCreation](self, "needsCreation"))
    {
      int64_t v6 = 1LL;
    }

    else if (-[ADAccount needsDestruction](self, "needsDestruction"))
    {
      int64_t v6 = 2LL;
    }

    else if (v4)
    {
      if (v5)
      {
        if (-[ADAccount hasConnectionPolicyFailed](self, "hasConnectionPolicyFailed"))
        {
          int64_t v6 = 7LL;
        }

        else
        {
          double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount connectionPolicyExpirationDate](self, "connectionPolicyExpirationDate"));
          [v7 timeIntervalSinceNow];
          if (v8 >= 0.0)
          {
            id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount hostname](self, "hostname"));
            else {
              int64_t v6 = 4LL;
            }
          }

          else
          {
            int64_t v6 = 3LL;
          }
        }
      }

      else
      {
        int64_t v6 = 6LL;
      }
    }

    else
    {
      int64_t v6 = 5LL;
    }
  }

  else
  {
    int64_t v6 = -1LL;
  }

  return v6;
}

@end