@interface IXClientProtocolInterface
+ (id)interface;
+ (id)interfaceProtocol;
+ (id)new;
+ (void)configureInterface:(id)a3;
- (IXClientProtocolInterface)init;
@end

@implementation IXClientProtocolInterface

- (IXClientProtocolInterface)init
{
  result = (IXClientProtocolInterface *)_os_crash("-[IXClientProtocolInterface init] unexpectedly called", a2);
  __break(1u);
  return result;
}

+ (id)new
{
  id result = (id)_os_crash("+[IXClientProtocolInterface new] unexpectedly called", a2);
  __break(1u);
  return result;
}

+ (id)interface
{
  id v2 = a1;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained(&qword_1000E8FE0);
  if (!WeakRetained)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 interfaceProtocol]);
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  v4));

    [v2 configureInterface:WeakRetained];
    objc_storeWeak(&qword_1000E8FE0, WeakRetained);
  }

  objc_sync_exit(v2);

  return WeakRetained;
}

+ (id)interfaceProtocol
{
  return &OBJC_PROTOCOL___IXClientProtocol;
}

+ (void)configureInterface:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  v5 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v4,  objc_opt_class(&OBJC_CLASS___IXAppInstallCoordinatorSeed),  0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v3 setClasses:v6 forSelector:"_remote_fetchSeedsForCoordinatorsWithIntent:completion:" argumentIndex:0 ofReply:1];

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSSet);
  v8 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v7, objc_opt_class(&OBJC_CLASS___NSNumber), 0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v3 setClasses:v9 forSelector:"_remote_registerObserverMachServiceName:forClientIdentifiers:respondingToSelectors:" argumentIndex:1 ofReply:0];

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSSet);
  v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v3 setClasses:v12 forSelector:"_remote_registerTransientObserver:forClientIdentifiers:respondingToSelectors:" argumentIndex:1 ofReply:0];

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSSet);
  v14 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v13, objc_opt_class(&OBJC_CLASS___NSUUID), 0LL);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v3 setClasses:v15 forSelector:"_remote_addObserversForCoordinatorsWithUUIDs:fireObserverMethods:" argumentIndex:0 ofReply:0];

  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSSet);
  v17 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v16, objc_opt_class(&OBJC_CLASS___NSUUID), 0LL);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v3 setClasses:v18 forSelector:"_remote_addObserversForDataPromisesWithUUIDs:" argumentIndex:0 ofReply:0];

  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSUUID);
  v20 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v19,  objc_opt_class(&OBJC_CLASS___NSArray),  0LL);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  [v3 setClasses:v21 forSelector:"_remote_IXSCoordinatedAppInstall:setInitialODRAssetPromiseUUIDs:completion:" argumentIndex:1 ofReply:0];

  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSUUID);
  v23 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v22,  objc_opt_class(&OBJC_CLASS___NSArray),  0LL);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  [v3 setClasses:v24 forSelector:"_remote_IXSCoordinatedAppInstall:setEssentialAssetPromiseUUIDs:completion:" argumentIndex:1 ofReply:0];

  uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v26 = objc_opt_class(&OBJC_CLASS___IXPromisedOutOfBandTransferSeed);
  v27 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v25,  v26,  objc_opt_class(&OBJC_CLASS___IXPromisedOutOfBandStreamingZipTransferSeed),  0LL);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  [v3 setClasses:v28 forSelector:"_remote_IXSCoordinatedAppInstall:getInitialODRAssetPromises:" argumentIndex:0 ofReply:1];

  uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v30 = objc_opt_class(&OBJC_CLASS___IXPromisedOutOfBandTransferSeed);
  v31 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v29,  v30,  objc_opt_class(&OBJC_CLASS___IXPromisedOutOfBandStreamingZipTransferSeed),  0LL);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  [v3 setClasses:v32 forSelector:"_remote_IXSCoordinatedAppInstall:getEssentialAssetPromises:" argumentIndex:0 ofReply:1];

  uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSArray);
  v34 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v33, objc_opt_class(&OBJC_CLASS___NSUUID), 0LL);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  [v3 setClasses:v35 forSelector:"_remote_IXSPlaceholder:setAppExtensionPlaceholderPromiseUUIDs:completion:" argumentIndex:1 ofReply:0];

  uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSArray);
  v37 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v36,  objc_opt_class(&OBJC_CLASS___IXPlaceholderSeed),  0LL);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  [v3 setClasses:v38 forSelector:"_remote_IXSPlaceholder:getAppExtensionPlaceholderPromises:" argumentIndex:0 ofReply:1];

  uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v40 = objc_opt_class(&OBJC_CLASS___IXApplicationIdentity);
  v41 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v39,  v40,  objc_opt_class(&OBJC_CLASS___IXAppRemovabilityMetadata),  0LL);
  id v42 = (id)objc_claimAutoreleasedReturnValue(v41);
  [v3 setClasses:v42 forSelector:"_remote_removabilityDataWithCompletion:" argumentIndex:0 ofReply:1];
}

@end