@interface CSDSharedConversationServerBag
- (BOOL)faceTimeSpamReportingCheckPrefix;
- (BOOL)gftaasPseudonymsEnabled:(id)a3;
- (BOOL)isAutomaticUpgradingEnabled;
- (BOOL)isControlMessageOverQREnabled;
- (BOOL)isFaceTimeMyselfEnabled;
- (BOOL)isGFTDowngradeToOneToOneAvailable;
- (BOOL)isGuestModeSupported;
- (BOOL)isLetMeInRequestUIForUnknownParticipantEnabled;
- (BOOL)isMSNPillDataSourceEnabled;
- (BOOL)isModernGFTEnabled;
- (BOOL)isNoConversationParticipantEndCallEnabled;
- (BOOL)isParticipantIDToURIIncludedInPush;
- (BOOL)isSharePlayVersionCheckEnabled;
- (BOOL)isShortMKIEnabled;
- (BOOL)isUPlusNDowngradeAvailable;
- (BOOL)isUPlusOneSessionCapabilitiesEnabled;
- (BOOL)shouldRingForIncomingCallEnabled;
- (CSDSharedConversationServerBag)init;
- (NSDictionary)activityIdentifierBundleIDMapping;
- (double)liveLookupTimeoutSeconds;
- (id)localBundleIDForActivityIdentifier:(id)a3;
- (id)stableBundleIdentifierForLocalBundleIdentifier:(id)a3;
- (int64_t)voIPDOSCount;
- (unint64_t)AVCBlobRecoveryGracePeriod;
- (unint64_t)AVCBlobRecoveryTimeout;
- (unint64_t)activeParticipantPruningTimeout;
- (unint64_t)activeParticipantRefreshDelay;
- (unint64_t)addParticipantFromQRTime;
- (unint64_t)clearMuteCacheDelay;
- (unint64_t)greenTeaHandoffTimeout;
- (unint64_t)groupFaceTimeTLESampleRate;
- (unint64_t)handoffAudioDeviceTimeout;
- (unint64_t)handoffUPlusOneLeaveDelay;
- (unint64_t)handoffUPlusOneLeaveTimeout;
- (unint64_t)inactiveLinkCacheLimit;
- (unint64_t)inactiveLinkPseudonymExpiry;
- (unint64_t)letMeInRequestNotificationTimeout;
- (unint64_t)letMeInRequestRecoveryTimeout;
- (unint64_t)letMeInRequestUINotificationGracePeriod;
- (unint64_t)linkPseudonymExpiry;
- (unint64_t)linkRemainingTimeBeforeAutoRenewal;
- (unint64_t)linkRenewalExtensionTime;
- (unint64_t)linkSyncRecoverFailureLimit;
- (unint64_t)linkSyncRecoverTimeLimit;
- (unint64_t)maxActiveParticipantFetchRetries;
- (unint64_t)maxKickMemberRetries;
- (unint64_t)maxRemoteSpatialPersonaParticipants;
- (unint64_t)messageRetryIntervalMillis;
- (unint64_t)messageRetryMaxAttempts;
- (unint64_t)noConversationParticipantTimeout;
- (unint64_t)rebroadcastTimeThreshold;
- (unint64_t)sessionCleanupTimeout;
- (unint64_t)uPlusOneAuthTagSampleRate;
- (unint64_t)voIPDOSMaxJailTimeSeconds;
- (unint64_t)voIPDOSMinJailTimeSeconds;
- (unint64_t)voIPDOSTimeSeconds;
- (unint64_t)watchInviteNotificationDelay;
- (unint64_t)watchLPMDialDelay;
- (unint64_t)webNicknameLengthLimit;
@end

@implementation CSDSharedConversationServerBag

- (unint64_t)activeParticipantPruningTimeout
{
  v2 = self;
  unint64_t v3 = sub_1001ECAA8();

  return v3;
}

- (unint64_t)sessionCleanupTimeout
{
  v2 = self;
  unint64_t v3 = sub_1001ECAF4();

  return v3;
}

- (unint64_t)greenTeaHandoffTimeout
{
  v2 = self;
  unint64_t v3 = sub_1001ECB40();

  return v3;
}

- (unint64_t)AVCBlobRecoveryGracePeriod
{
  v2 = self;
  unint64_t v3 = sub_1001ECB8C();

  return v3;
}

- (unint64_t)AVCBlobRecoveryTimeout
{
  v2 = self;
  unint64_t v3 = sub_1001ECBD8();

  return v3;
}

- (unint64_t)noConversationParticipantTimeout
{
  v2 = self;
  unint64_t v3 = sub_1001ECC24();

  return v3;
}

- (unint64_t)rebroadcastTimeThreshold
{
  v2 = self;
  unint64_t v3 = sub_1001ECC70();

  return v3;
}

- (unint64_t)activeParticipantRefreshDelay
{
  v2 = self;
  unint64_t v3 = sub_1001ECCBC();

  return v3;
}

- (BOOL)isAutomaticUpgradingEnabled
{
  v2 = self;
  char v3 = sub_1001ECD08();

  return v3 & 1;
}

- (unint64_t)uPlusOneAuthTagSampleRate
{
  v2 = self;
  unint64_t v3 = sub_1001ECD54();

  return v3;
}

- (unint64_t)groupFaceTimeTLESampleRate
{
  v2 = self;
  unint64_t v3 = sub_1001ECDA0();

  return v3;
}

- (BOOL)isShortMKIEnabled
{
  v2 = self;
  char v3 = sub_1001ECDEC();

  return v3 & 1;
}

- (BOOL)isParticipantIDToURIIncludedInPush
{
  v2 = self;
  char v3 = sub_1001ECE38();

  return v3 & 1;
}

- (BOOL)isModernGFTEnabled
{
  v2 = self;
  char v3 = sub_1001ECE84();

  return v3 & 1;
}

- (BOOL)isSharePlayVersionCheckEnabled
{
  v2 = self;
  char v3 = sub_1001ECED0();

  return v3 & 1;
}

- (BOOL)isLetMeInRequestUIForUnknownParticipantEnabled
{
  v2 = self;
  char v3 = sub_1001ECF1C();

  return v3 & 1;
}

- (BOOL)isNoConversationParticipantEndCallEnabled
{
  v2 = self;
  char v3 = sub_1001ECF68();

  return v3 & 1;
}

- (BOOL)isUPlusOneSessionCapabilitiesEnabled
{
  v2 = self;
  char v3 = sub_1001ECFB4();

  return v3 & 1;
}

- (BOOL)isControlMessageOverQREnabled
{
  v2 = self;
  char v3 = sub_1001ED000();

  return v3 & 1;
}

- (BOOL)shouldRingForIncomingCallEnabled
{
  v2 = self;
  char v3 = sub_1001ED04C();

  return v3 & 1;
}

- (BOOL)isFaceTimeMyselfEnabled
{
  v2 = self;
  char v3 = sub_1001ED098();

  return v3 & 1;
}

- (unint64_t)maxActiveParticipantFetchRetries
{
  v2 = self;
  unint64_t v3 = sub_1001ED0E4();

  return v3;
}

- (unint64_t)maxKickMemberRetries
{
  v2 = self;
  unint64_t v3 = sub_1001ED130();

  return v3;
}

- (unint64_t)linkPseudonymExpiry
{
  v2 = self;
  unint64_t v3 = sub_1001ED17C();

  return v3;
}

- (unint64_t)addParticipantFromQRTime
{
  v2 = self;
  unint64_t v3 = sub_1001ED1C8();

  return v3;
}

- (unint64_t)linkRenewalExtensionTime
{
  v2 = self;
  unint64_t v3 = sub_1001ED214();

  return v3;
}

- (unint64_t)linkRemainingTimeBeforeAutoRenewal
{
  v2 = self;
  unint64_t v3 = sub_1001ED260();

  return v3;
}

- (unint64_t)inactiveLinkPseudonymExpiry
{
  v2 = self;
  unint64_t v3 = sub_1001ED2AC();

  return v3;
}

- (unint64_t)inactiveLinkCacheLimit
{
  v2 = self;
  unint64_t v3 = sub_1001ED2F8();

  return v3;
}

- (unint64_t)webNicknameLengthLimit
{
  v2 = self;
  unint64_t v3 = sub_1001ED344();

  return v3;
}

- (unint64_t)linkSyncRecoverFailureLimit
{
  v2 = self;
  unint64_t v3 = sub_1001ED390();

  return v3;
}

- (unint64_t)linkSyncRecoverTimeLimit
{
  v2 = self;
  unint64_t v3 = sub_1001ED3DC();

  return v3;
}

- (unint64_t)letMeInRequestNotificationTimeout
{
  v2 = self;
  unint64_t v3 = sub_1001ED428();

  return v3;
}

- (BOOL)isMSNPillDataSourceEnabled
{
  v2 = self;
  char v3 = sub_1001ED474();

  return v3 & 1;
}

- (unint64_t)letMeInRequestRecoveryTimeout
{
  v2 = self;
  unint64_t v3 = sub_1001ED4C0();

  return v3;
}

- (unint64_t)letMeInRequestUINotificationGracePeriod
{
  v2 = self;
  unint64_t v3 = sub_1001ED50C();

  return v3;
}

- (NSDictionary)activityIdentifierBundleIDMapping
{
  v2 = self;
  uint64_t v3 = sub_1001ED58C();

  sub_1001AFF14((uint64_t *)&unk_100447B90);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

- (id)localBundleIDForActivityIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  sub_1001ED5CC(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease(v6);
  if (v9)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }

  else
  {
    NSString v10 = 0LL;
  }

  return v10;
}

- (unint64_t)handoffAudioDeviceTimeout
{
  v2 = self;
  unint64_t v3 = sub_1001ED878();

  return v3;
}

- (id)stableBundleIdentifierForLocalBundleIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  sub_1001ED894(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease(v6);
  if (v9)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }

  else
  {
    NSString v10 = 0LL;
  }

  return v10;
}

- (unint64_t)messageRetryMaxAttempts
{
  v2 = self;
  unint64_t v3 = sub_1001EDA5C();

  return v3;
}

- (unint64_t)messageRetryIntervalMillis
{
  v2 = self;
  unint64_t v3 = sub_1001EDAA8();

  return v3;
}

- (BOOL)isGFTDowngradeToOneToOneAvailable
{
  v2 = self;
  char v3 = sub_1001EDAF4();

  return v3 & 1;
}

- (unint64_t)maxRemoteSpatialPersonaParticipants
{
  v2 = self;
  unint64_t v3 = sub_1001EDB40();

  return v3;
}

- (BOOL)isUPlusNDowngradeAvailable
{
  v2 = self;
  char v3 = sub_1001EDB8C();

  return v3 & 1;
}

- (BOOL)isGuestModeSupported
{
  v2 = self;
  char v3 = sub_1001EDBD8();

  return v3 & 1;
}

- (BOOL)gftaasPseudonymsEnabled:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_1001EDBF4(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v4 & 1;
}

- (unint64_t)handoffUPlusOneLeaveTimeout
{
  v2 = self;
  unint64_t v3 = sub_1001EDCBC();

  return v3;
}

- (unint64_t)handoffUPlusOneLeaveDelay
{
  v2 = self;
  unint64_t v3 = sub_1001EDD08();

  return v3;
}

- (unint64_t)watchInviteNotificationDelay
{
  v2 = self;
  unint64_t v3 = sub_1001EDD54();

  return v3;
}

- (unint64_t)watchLPMDialDelay
{
  v2 = self;
  unint64_t v3 = sub_1001EDDA0();

  return v3;
}

- (unint64_t)clearMuteCacheDelay
{
  v2 = self;
  unint64_t v3 = sub_1001EDDEC();

  return v3;
}

- (int64_t)voIPDOSCount
{
  v2 = self;
  int64_t v3 = sub_1001EDE38();

  return v3;
}

- (unint64_t)voIPDOSTimeSeconds
{
  v2 = self;
  unint64_t v3 = sub_1001EDE84();

  return v3;
}

- (unint64_t)voIPDOSMaxJailTimeSeconds
{
  v2 = self;
  unint64_t v3 = sub_1001EDED0();

  return v3;
}

- (unint64_t)voIPDOSMinJailTimeSeconds
{
  v2 = self;
  unint64_t v3 = sub_1001EDF1C();

  return v3;
}

- (double)liveLookupTimeoutSeconds
{
  v2 = self;
  double v3 = sub_1001EDFA8();

  return v3;
}

- (BOOL)faceTimeSpamReportingCheckPrefix
{
  v2 = self;
  char v3 = sub_1001EE018();

  return v3 & 1;
}

- (CSDSharedConversationServerBag)init
{
  return (CSDSharedConversationServerBag *)sub_1001EE06C();
}

- (void).cxx_destruct
{
}

@end