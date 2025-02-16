@interface ApplicationServiceInstance
- (_TtC10LinkDaemon26ApplicationServiceInstance)init;
- (void)actionWithIdentifier:(NSString *)a3 frameworkBundles:(NSArray *)a4 completionHandler:(id)a5;
- (void)appShortcutsProviderTypeNameWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)entityWithIdentifier:(NSString *)a3 frameworkBundles:(NSArray *)a4 completionHandler:(id)a5;
- (void)enumWithIdentifier:(NSString *)a3 frameworkBundles:(NSArray *)a4 completionHandler:(id)a5;
- (void)fetchListenerEndpointForProcessInstanceIdentifier:(NSString *)a3 reply:(id)a4;
- (void)fetchProcessInstanceIdentifiersForBundleIdentifier:(NSString *)a3 reply:(id)a4;
- (void)getObservationStatusForBundleIdentifier:(NSString *)a3 entityType:(NSString *)a4 reply:(id)a5;
- (void)persistIntentEnablementForIntent:(NSString *)a3 enablement:(LNIntentEnablement *)a4 reply:(id)a5;
- (void)queryWithIdentifier:(NSString *)a3 frameworkBundles:(NSArray *)a4 completionHandler:(id)a5;
- (void)refreshAutoShortcutSubstitution:(NSArray *)a3 spans:(NSArray *)a4 parameterPresentationSubstitutions:(NSArray *)a5 reply:(id)a6;
- (void)registerListenerEndpointWithXPCListenerEndpoint:(NSXPCListenerEndpoint *)a3 reply:(id)a4;
- (void)registerOnObservationStatusChangedForBundleIdentifier:(NSString *)a3 entityType:(NSString *)a4 reply:(id)a5;
- (void)requestUpdateAppShortcutParametersWithReply:(id)a3;
- (void)retrieveEnabledIntentsWithReply:(id)a3;
- (void)retrievePersistedIntentEnablementsWithReply:(id)a3;
- (void)retrieveSiriLanguageWithReply:(id)a3;
- (void)sendAppNotificationEvents:(NSArray *)a3 bundleIdentifier:(NSString *)a4 reply:(id)a5;
- (void)setIntentEnabled:(NSString *)a3 enabled:(BOOL)a4 reply:(id)a5;
- (void)unregisterOnObservationStatusChangedForBundleIdentifier:(NSString *)a3 entityType:(NSString *)a4 registrationUUID:(NSUUID *)a5 reply:(id)a6;
- (void)updateRelevantIntents:(NSArray *)a3 bundleIdentifier:(NSString *)a4 reply:(id)a5;
@end

@implementation ApplicationServiceInstance

- (void)dealloc
{
  v2 = self;
  sub_10005DFA4();
}

- (void).cxx_destruct
{
  uint64_t v3 = type metadata accessor for UUID(0LL);
  sub_100068194(v3);
  uint64_t v4 = sub_10000E918();
  sub_100068194(v4);
  sub_100068550(OBJC_IVAR____TtC10LinkDaemon26ApplicationServiceInstance_sourceBundleIdentifier);
  sub_100068550(OBJC_IVAR____TtC10LinkDaemon26ApplicationServiceInstance_destinationBundleIdentifier);
  swift_release();
  sub_100068178(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10LinkDaemon26ApplicationServiceInstance_observationStatusRegistrySource));
}

- (void)requestUpdateAppShortcutParametersWithReply:(id)a3
{
}

- (void)refreshAutoShortcutSubstitution:(NSArray *)a3 spans:(NSArray *)a4 parameterPresentationSubstitutions:(NSArray *)a5 reply:(id)a6
{
  v10 = _Block_copy(a6);
  v11 = (void *)swift_allocObject(&unk_100124ED8, 56LL, 7LL);
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_1000BC15C((uint64_t)&unk_100132898, (uint64_t)v11);
}

- (void)updateRelevantIntents:(NSArray *)a3 bundleIdentifier:(NSString *)a4 reply:(id)a5
{
}

- (void)persistIntentEnablementForIntent:(NSString *)a3 enablement:(LNIntentEnablement *)a4 reply:(id)a5
{
}

- (void)retrievePersistedIntentEnablementsWithReply:(id)a3
{
}

- (void)retrieveEnabledIntentsWithReply:(id)a3
{
}

- (void)retrieveSiriLanguageWithReply:(id)a3
{
}

- (void)setIntentEnabled:(NSString *)a3 enabled:(BOOL)a4 reply:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject(&unk_100124DC0, 48LL, 7LL);
  *(void *)(v9 + 16) = a3;
  *(_BYTE *)(v9 + 24) = a4;
  *(void *)(v9 + 32) = v8;
  *(void *)(v9 + 40) = self;
  v10 = a3;
  v11 = self;
  sub_1000BC15C((uint64_t)&unk_1001327E8, v9);
}

- (void)actionWithIdentifier:(NSString *)a3 frameworkBundles:(NSArray *)a4 completionHandler:(id)a5
{
}

- (void)enumWithIdentifier:(NSString *)a3 frameworkBundles:(NSArray *)a4 completionHandler:(id)a5
{
}

- (void)queryWithIdentifier:(NSString *)a3 frameworkBundles:(NSArray *)a4 completionHandler:(id)a5
{
}

- (void)entityWithIdentifier:(NSString *)a3 frameworkBundles:(NSArray *)a4 completionHandler:(id)a5
{
}

- (void)appShortcutsProviderTypeNameWithCompletionHandler:(id)a3
{
}

- (void)sendAppNotificationEvents:(NSArray *)a3 bundleIdentifier:(NSString *)a4 reply:(id)a5
{
}

- (void)getObservationStatusForBundleIdentifier:(NSString *)a3 entityType:(NSString *)a4 reply:(id)a5
{
}

- (void)registerOnObservationStatusChangedForBundleIdentifier:(NSString *)a3 entityType:(NSString *)a4 reply:(id)a5
{
}

- (void)unregisterOnObservationStatusChangedForBundleIdentifier:(NSString *)a3 entityType:(NSString *)a4 registrationUUID:(NSUUID *)a5 reply:(id)a6
{
  v10 = _Block_copy(a6);
  v11 = (void *)swift_allocObject(&unk_100124C58, 56LL, 7LL);
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_1000BC15C((uint64_t)&unk_1001326E8, (uint64_t)v11);
}

- (_TtC10LinkDaemon26ApplicationServiceInstance)init
{
}

- (void)registerListenerEndpointWithXPCListenerEndpoint:(NSXPCListenerEndpoint *)a3 reply:(id)a4
{
}

- (void)fetchProcessInstanceIdentifiersForBundleIdentifier:(NSString *)a3 reply:(id)a4
{
}

- (void)fetchListenerEndpointForProcessInstanceIdentifier:(NSString *)a3 reply:(id)a4
{
}

@end