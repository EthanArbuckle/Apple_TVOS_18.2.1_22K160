@interface OTOperationDependencies
- (BOOL)permittedToSendMetrics;
- (CKKSKeychainView)ckks;
- (CKKSLockStateTracker)lockStateTracker;
- (CKKSPeerProvider)octagonAdapter;
- (CKKSReachabilityTracker)reachabilityTracker;
- (Class)escrowRequestClass;
- (Class)notifierClass;
- (CuttlefishXPCWrapper)cuttlefishXPCWrapper;
- (NSString)containerName;
- (NSString)contextID;
- (NSString)deviceSessionID;
- (NSString)flowID;
- (OTAccountsAdapter)accountsAdapter;
- (OTAuthKitAdapter)authKitAdapter;
- (OTCuttlefishAccountStateHolder)stateHolder;
- (OTDeviceInformationAdapter)deviceInformationAdapter;
- (OTPersonaAdapter)personaAdapter;
- (OTSOSAdapter)sosAdapter;
- (OctagonStateFlagHandler)flagHandler;
- (TPSpecificUser)activeAccount;
- (id)initForContainer:(id)a3 contextID:(id)a4 activeAccount:(id)a5 stateHolder:(id)a6 flagHandler:(id)a7 sosAdapter:(id)a8 octagonAdapter:(id)a9 accountsAdapter:(id)a10 authKitAdapter:(id)a11 personaAdapter:(id)a12 deviceInfoAdapter:(id)a13 ckksAccountSync:(id)a14 lockStateTracker:(id)a15 cuttlefishXPCWrapper:(id)a16 escrowRequestClass:(Class)a17 notifierClass:(Class)a18 flowID:(id)a19 deviceSessionID:(id)a20 permittedToSendMetrics:(BOOL)a21 reachabilityTracker:(id)a22;
- (void)setAccountsAdapter:(id)a3;
- (void)setActiveAccount:(id)a3;
- (void)setAuthKitAdapter:(id)a3;
- (void)setContainerName:(id)a3;
- (void)setContextID:(id)a3;
- (void)setDeviceInformationAdapter:(id)a3;
- (void)setDeviceSessionID:(id)a3;
- (void)setEscrowRequestClass:(Class)a3;
- (void)setFlagHandler:(id)a3;
- (void)setFlowID:(id)a3;
- (void)setLockStateTracker:(id)a3;
- (void)setNotifierClass:(Class)a3;
- (void)setOctagonAdapter:(id)a3;
- (void)setPermittedToSendMetrics:(BOOL)a3;
- (void)setPersonaAdapter:(id)a3;
- (void)setSosAdapter:(id)a3;
- (void)setStateHolder:(id)a3;
@end

@implementation OTOperationDependencies

- (id)initForContainer:(id)a3 contextID:(id)a4 activeAccount:(id)a5 stateHolder:(id)a6 flagHandler:(id)a7 sosAdapter:(id)a8 octagonAdapter:(id)a9 accountsAdapter:(id)a10 authKitAdapter:(id)a11 personaAdapter:(id)a12 deviceInfoAdapter:(id)a13 ckksAccountSync:(id)a14 lockStateTracker:(id)a15 cuttlefishXPCWrapper:(id)a16 escrowRequestClass:(Class)a17 notifierClass:(Class)a18 flowID:(id)a19 deviceSessionID:(id)a20 permittedToSendMetrics:(BOOL)a21 reachabilityTracker:(id)a22
{
  id v48 = a3;
  id v47 = a4;
  id v46 = a5;
  id v45 = a6;
  id v44 = a7;
  id v43 = a8;
  id v42 = a9;
  id v41 = a10;
  id v40 = a11;
  id v39 = a12;
  id v38 = a13;
  id v27 = a14;
  id v28 = a15;
  id v29 = a16;
  id v37 = a19;
  id v36 = a20;
  id v35 = a22;
  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___OTOperationDependencies;
  v30 = -[OTOperationDependencies init](&v49, "init");
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_containerName, a3);
    objc_storeStrong((id *)&v31->_contextID, a4);
    objc_storeStrong((id *)&v31->_activeAccount, a5);
    objc_storeStrong((id *)&v31->_stateHolder, a6);
    objc_storeStrong((id *)&v31->_flagHandler, a7);
    objc_storeStrong((id *)&v31->_sosAdapter, a8);
    objc_storeStrong((id *)&v31->_octagonAdapter, a9);
    objc_storeStrong((id *)&v31->_accountsAdapter, a10);
    objc_storeStrong((id *)&v31->_authKitAdapter, a11);
    objc_storeStrong((id *)&v31->_personaAdapter, a12);
    objc_storeStrong((id *)&v31->_deviceInformationAdapter, a13);
    objc_storeWeak((id *)&v31->_ckks, v27);
    objc_storeStrong((id *)&v31->_lockStateTracker, a15);
    objc_storeStrong((id *)&v31->_cuttlefishXPCWrapper, a16);
    objc_storeStrong((id *)&v31->_escrowRequestClass, a17);
    objc_storeStrong((id *)&v31->_notifierClass, a18);
    objc_storeStrong((id *)&v31->_flowID, a19);
    objc_storeStrong((id *)&v31->_deviceSessionID, a20);
    v31->_permittedToSendMetrics = a21;
    objc_storeStrong((id *)&v31->_reachabilityTracker, a22);
  }

  return v31;
}

- (NSString)containerName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setContainerName:(id)a3
{
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setContextID:(id)a3
{
}

- (TPSpecificUser)activeAccount
{
  return (TPSpecificUser *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setActiveAccount:(id)a3
{
}

- (OTCuttlefishAccountStateHolder)stateHolder
{
  return (OTCuttlefishAccountStateHolder *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setStateHolder:(id)a3
{
}

- (OctagonStateFlagHandler)flagHandler
{
  return (OctagonStateFlagHandler *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setFlagHandler:(id)a3
{
}

- (OTSOSAdapter)sosAdapter
{
  return (OTSOSAdapter *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setSosAdapter:(id)a3
{
}

- (CKKSPeerProvider)octagonAdapter
{
  return (CKKSPeerProvider *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setOctagonAdapter:(id)a3
{
}

- (OTAccountsAdapter)accountsAdapter
{
  return (OTAccountsAdapter *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setAccountsAdapter:(id)a3
{
}

- (OTAuthKitAdapter)authKitAdapter
{
  return (OTAuthKitAdapter *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setAuthKitAdapter:(id)a3
{
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setPersonaAdapter:(id)a3
{
}

- (OTDeviceInformationAdapter)deviceInformationAdapter
{
  return (OTDeviceInformationAdapter *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setDeviceInformationAdapter:(id)a3
{
}

- (CuttlefishXPCWrapper)cuttlefishXPCWrapper
{
  return (CuttlefishXPCWrapper *)objc_getProperty(self, a2, 104LL, 1);
}

- (CKKSKeychainView)ckks
{
  return (CKKSKeychainView *)objc_loadWeakRetained((id *)&self->_ckks);
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 120LL, 1);
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setLockStateTracker:(id)a3
{
}

- (Class)escrowRequestClass
{
  return (Class)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setEscrowRequestClass:(Class)a3
{
}

- (Class)notifierClass
{
  return (Class)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setNotifierClass:(Class)a3
{
}

- (NSString)flowID
{
  return (NSString *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setFlowID:(id)a3
{
}

- (NSString)deviceSessionID
{
  return (NSString *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setDeviceSessionID:(id)a3
{
}

- (BOOL)permittedToSendMetrics
{
  return self->_permittedToSendMetrics;
}

- (void)setPermittedToSendMetrics:(BOOL)a3
{
  self->_permittedToSendMetrics = a3;
}

- (void).cxx_destruct
{
}

@end