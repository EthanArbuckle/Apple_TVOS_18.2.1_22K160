@interface TUCallProvider
- (TUCallProvider)initWithCallSource:(id)a3 configuration:(id)a4;
@end

@implementation TUCallProvider

- (TUCallProvider)initWithCallSource:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  v9 = -[TUCallProvider initWithIdentifier:](self, "initWithIdentifier:", v8);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleURL]);
    -[TUCallProvider setBundleURL:](v9, "setBundleURL:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
    -[TUCallProvider setBundleIdentifier:](v9, "setBundleIdentifier:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 handoffIdentifiers]);
    -[TUCallProvider setHandoffIdentifiers:](v9, "setHandoffIdentifiers:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedName]);
    -[TUCallProvider setLocalizedName:](v9, "setLocalizedName:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue([v7 prioritizedTUSenderIdentities]);
    -[TUCallProvider setPrioritizedSenderIdentities:](v9, "setPrioritizedSenderIdentities:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue([v7 ringtoneSoundURL]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 URL]);
    -[TUCallProvider setOriginalRingtoneSoundURL:](v9, "setOriginalRingtoneSoundURL:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue([v7 ringtoneSoundURL]);
    -[TUCallProvider setSandboxExtensionHandle:]( v9,  "setSandboxExtensionHandle:",  [v17 sandboxExtensionHandle]);

    v18 = (void *)objc_claimAutoreleasedReturnValue([v7 iconTemplateImageData]);
    -[TUCallProvider setIconTemplateImageData:](v9, "setIconTemplateImageData:", v18);

    -[TUCallProvider setMaximumCallGroups:](v9, "setMaximumCallGroups:", [v7 maximumCallGroups]);
    -[TUCallProvider setMaximumCallsPerCallGroup:]( v9,  "setMaximumCallsPerCallGroup:",  [v7 maximumCallsPerCallGroup]);
    -[TUCallProvider setSupportsAudioOnly:](v9, "setSupportsAudioOnly:", [v7 supportsAudioOnly]);
    -[TUCallProvider setSupportsAudioAndVideo:](v9, "setSupportsAudioAndVideo:", [v7 supportsVideo]);
    -[TUCallProvider setSupportsEmergency:](v9, "setSupportsEmergency:", [v7 supportsEmergency]);
    -[TUCallProvider setSupportsVoicemail:](v9, "setSupportsVoicemail:", [v7 supportsVoicemail]);
    -[TUCallProvider setSupportsRecents:](v9, "setSupportsRecents:", [v7 includesCallsInRecents]);
    -[TUCallProvider setAudioSessionID:](v9, "setAudioSessionID:", [v7 audioSessionID]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v7 supportedTUHandleTypes]);
    -[TUCallProvider setSupportedHandleTypes:](v9, "setSupportedHandleTypes:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue([v7 emergencyTUHandles]);
    -[TUCallProvider setEmergencyHandles:](v9, "setEmergencyHandles:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue([v7 emergencyTULabeledHandles]);
    -[TUCallProvider setEmergencyLabeledHandles:](v9, "setEmergencyLabeledHandles:", v21);

    -[TUCallProvider setSupportsCurrentPlatform:]( v9,  "setSupportsCurrentPlatform:",  [v7 supportsCurrentPlatform]);
    -[TUCallProvider setSupportsRinging:](v9, "setSupportsRinging:", [v7 supportsRinging]);
    -[TUCallProvider setSupportsDynamicSystemUI:]( v9,  "setSupportsDynamicSystemUI:",  [v7 supportsDynamicSystemUI]);
  }

  return v9;
}

@end