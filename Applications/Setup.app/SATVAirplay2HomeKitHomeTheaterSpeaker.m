@interface SATVAirplay2HomeKitHomeTheaterSpeaker
- (BOOL)supportsAudioDestination;
- (HMMediaDestination)mediaDestination;
- (NSString)audioDestinationIdentifier;
- (NSString)description;
- (NSString)name;
- (NSString)type;
- (NSString)uniqueIdentifier;
- (SATVAirplay2HomeKitHomeTheaterSpeaker)initWithMediaDestination:(id)a3;
- (id)_accessory;
- (id)_mediaSystem;
- (unint64_t)homePodVariant;
@end

@implementation SATVAirplay2HomeKitHomeTheaterSpeaker

- (SATVAirplay2HomeKitHomeTheaterSpeaker)initWithMediaDestination:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVAirplay2HomeKitHomeTheaterSpeaker;
  v6 = -[SATVAirplay2HomeKitHomeTheaterSpeaker init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaDestination, a3);
  }

  return v7;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitHomeTheaterSpeaker mediaDestination](self, "mediaDestination"));
  id v5 = [v3 appendObject:v4 withName:@"mediaDestination"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitHomeTheaterSpeaker name](self, "name"));
  [v3 appendString:v6 withName:@"name"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitHomeTheaterSpeaker uniqueIdentifier](self, "uniqueIdentifier"));
  id v8 = [v3 appendObject:v7 withName:@"uniqueIdentifier"];

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitHomeTheaterSpeaker type](self, "type"));
  id v10 = [v3 appendObject:v9 withName:@"type"];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return (NSString *)v11;
}

- (NSString)uniqueIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitHomeTheaterSpeaker _mediaSystem](self, "_mediaSystem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);

  if (!v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitHomeTheaterSpeaker _accessory](self, "_accessory"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  return (NSString *)v6;
}

- (NSString)name
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitHomeTheaterSpeaker _mediaSystem](self, "_mediaSystem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);

  if (!v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitHomeTheaterSpeaker _accessory](self, "_accessory"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  }

  return (NSString *)v4;
}

- (NSString)type
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitHomeTheaterSpeaker mediaDestination](self, "mediaDestination"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___HMMediaSystem, v3);
  char isKindOfClass = objc_opt_isKindOfClass(v2, v4);

  v6 = (id *)&PBSHomeTheaterSpeakerTypeHomePod;
  if ((isKindOfClass & 1) != 0) {
    v6 = (id *)&PBSHomeTheaterSpeakerTypeHomePodStereoPair;
  }
  return (NSString *)*v6;
}

- (BOOL)supportsAudioDestination
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitHomeTheaterSpeaker mediaDestination](self, "mediaDestination"));
  unsigned __int8 v3 = [v2 supportsAudioDestination];

  return v3;
}

- (NSString)audioDestinationIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitHomeTheaterSpeaker mediaDestination](self, "mediaDestination"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 audioDestinationIdentifier]);

  return (NSString *)v3;
}

- (unint64_t)homePodVariant
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitHomeTheaterSpeaker _accessory](self, "_accessory"));
  id v3 = [v2 homePodVariant];

  return (unint64_t)v3;
}

- (id)_mediaSystem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitHomeTheaterSpeaker mediaDestination](self, "mediaDestination"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___HMMediaSystem, v3);
  id v5 = v2;
  v6 = v5;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
      v7 = v6;
    }
    else {
      v7 = 0LL;
    }
  }

  else
  {
    v7 = 0LL;
  }

  id v8 = v7;

  return v8;
}

- (id)_accessory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitHomeTheaterSpeaker mediaDestination](self, "mediaDestination"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___HMAccessory, v3);
  id v5 = v2;
  v6 = v5;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
      v7 = v6;
    }
    else {
      v7 = 0LL;
    }
  }

  else
  {
    v7 = 0LL;
  }

  id v8 = v7;

  return v8;
}

- (HMMediaDestination)mediaDestination
{
  return self->_mediaDestination;
}

- (void).cxx_destruct
{
}

@end