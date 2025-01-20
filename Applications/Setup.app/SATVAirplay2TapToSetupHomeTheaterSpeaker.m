@interface SATVAirplay2TapToSetupHomeTheaterSpeaker
- (BOOL)supportsAudioDestination;
- (NSString)audioDestinationIdentifier;
- (NSString)type;
- (SATVAirplay2TapToSetupHomeTheaterSpeaker)initWithHomeTheaterSpeaker:(id)a3;
- (id)_homeTheaterSpeaker;
- (unint64_t)homePodVariant;
@end

@implementation SATVAirplay2TapToSetupHomeTheaterSpeaker

- (SATVAirplay2TapToSetupHomeTheaterSpeaker)initWithHomeTheaterSpeaker:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVAirplay2TapToSetupHomeTheaterSpeaker;
  return -[SATVAirplay2TapToSetupDataSourceObject initWithHomeKitObject:](&v4, "initWithHomeKitObject:", a3);
}

- (NSString)type
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2TapToSetupHomeTheaterSpeaker _homeTheaterSpeaker](self, "_homeTheaterSpeaker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 type]);

  return (NSString *)v3;
}

- (BOOL)supportsAudioDestination
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2TapToSetupHomeTheaterSpeaker _homeTheaterSpeaker](self, "_homeTheaterSpeaker"));
  unsigned __int8 v3 = [v2 supportsAudioDestination];

  return v3;
}

- (NSString)audioDestinationIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2TapToSetupHomeTheaterSpeaker _homeTheaterSpeaker](self, "_homeTheaterSpeaker"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 audioDestinationIdentifier]);

  return (NSString *)v3;
}

- (unint64_t)homePodVariant
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2TapToSetupHomeTheaterSpeaker _homeTheaterSpeaker](self, "_homeTheaterSpeaker"));
  id v3 = [v2 homePodVariant];

  return (unint64_t)v3;
}

- (id)_homeTheaterSpeaker
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2TapToSetupDataSourceObject homeKitObject](self, "homeKitObject"));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVSKTapToSetupHomeKitHomeTheaterSpeaker);
  id v4 = v2;
  v5 = v4;
  if (v3)
  {
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0) {
      v6 = v5;
    }
    else {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  id v7 = v6;

  return v7;
}

@end