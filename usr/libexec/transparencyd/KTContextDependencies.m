@interface KTContextDependencies
- (KTAccountKeyProtocol)accountKeyServer;
- (KTApplicationPublicKeyStore)applicationKeyStore;
- (KTCloudRecordsProtocol)cloudRecords;
- (KTContextDependencies)initWithOperationDependencies:(id)a3 application:(id)a4;
- (KTContextStore)contextStore;
- (KTKVSProtocol)kvs;
- (KTLogClientProtocol)logClient;
- (KTSMDataStore)smDataStore;
- (KTSMManager)stateMachine;
- (KTTapToRadarProtocol)tapToRadar;
- (TransparencyAnalytics)analyticsLogger;
- (TransparencyFollowUpProtocol)followup;
- (TransparencyManagedDataStore)dataStore;
- (TransparencySettingsProtocol)settings;
- (TransparencyStaticKeyStore)staticKeyStore;
- (_TtC13transparencyd28KTEligibilityStatusReporting)eligibilityStatusReporter;
- (void)setAccountKeyServer:(id)a3;
- (void)setAnalyticsLogger:(id)a3;
- (void)setApplicationKeyStore:(id)a3;
- (void)setCloudRecords:(id)a3;
- (void)setContextStore:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setEligibilityStatusReporter:(id)a3;
- (void)setFollowup:(id)a3;
- (void)setKvs:(id)a3;
- (void)setLogClient:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSmDataStore:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setStaticKeyStore:(id)a3;
- (void)setTapToRadar:(id)a3;
@end

@implementation KTContextDependencies

- (KTContextDependencies)initWithOperationDependencies:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___KTContextDependencies;
  v8 = -[KTContextDependencies init](&v22, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 publicKeyStore]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationPublicKeyStore:v7]);
    -[KTContextDependencies setApplicationKeyStore:](v8, "setApplicationKeyStore:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 dataStore]);
    -[KTContextDependencies setDataStore:](v8, "setDataStore:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 staticKeyStore]);
    -[KTContextDependencies setStaticKeyStore:](v8, "setStaticKeyStore:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 logClient]);
    -[KTContextDependencies setLogClient:](v8, "setLogClient:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 contextStore]);
    -[KTContextDependencies setContextStore:](v8, "setContextStore:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 accountKeyService]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 accountKeyService:v7]);
    -[KTContextDependencies setAccountKeyServer:](v8, "setAccountKeyServer:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue([v6 kvs]);
    -[KTContextDependencies setKvs:](v8, "setKvs:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue([v6 followup]);
    -[KTContextDependencies setFollowup:](v8, "setFollowup:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 cloudRecords]);
    -[KTContextDependencies setCloudRecords:](v8, "setCloudRecords:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue([v6 settings]);
    -[KTContextDependencies setSettings:](v8, "setSettings:", v20);
  }

  return v8;
}

- (KTApplicationPublicKeyStore)applicationKeyStore
{
  return (KTApplicationPublicKeyStore *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setApplicationKeyStore:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDataStore:(id)a3
{
}

- (KTSMDataStore)smDataStore
{
  return (KTSMDataStore *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setSmDataStore:(id)a3
{
}

- (TransparencyStaticKeyStore)staticKeyStore
{
  return (TransparencyStaticKeyStore *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setStaticKeyStore:(id)a3
{
}

- (KTLogClientProtocol)logClient
{
  return (KTLogClientProtocol *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setLogClient:(id)a3
{
}

- (KTContextStore)contextStore
{
  return (KTContextStore *)objc_loadWeakRetained((id *)&self->_contextStore);
}

- (void)setContextStore:(id)a3
{
}

- (KTSMManager)stateMachine
{
  return (KTSMManager *)objc_loadWeakRetained((id *)&self->_stateMachine);
}

- (void)setStateMachine:(id)a3
{
}

- (KTAccountKeyProtocol)accountKeyServer
{
  return (KTAccountKeyProtocol *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setAccountKeyServer:(id)a3
{
}

- (KTKVSProtocol)kvs
{
  return (KTKVSProtocol *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setKvs:(id)a3
{
}

- (TransparencyFollowUpProtocol)followup
{
  return (TransparencyFollowUpProtocol *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setFollowup:(id)a3
{
}

- (KTCloudRecordsProtocol)cloudRecords
{
  return (KTCloudRecordsProtocol *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setCloudRecords:(id)a3
{
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setSettings:(id)a3
{
}

- (TransparencyAnalytics)analyticsLogger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setAnalyticsLogger:(id)a3
{
}

- (KTTapToRadarProtocol)tapToRadar
{
  return (KTTapToRadarProtocol *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setTapToRadar:(id)a3
{
}

- (_TtC13transparencyd28KTEligibilityStatusReporting)eligibilityStatusReporter
{
  return (_TtC13transparencyd28KTEligibilityStatusReporting *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setEligibilityStatusReporter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end