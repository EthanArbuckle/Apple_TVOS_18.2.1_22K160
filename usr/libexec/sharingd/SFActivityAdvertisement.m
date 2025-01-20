@interface SFActivityAdvertisement
- (id)description;
@end

@implementation SFActivityAdvertisement

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SFActivityAdvertisement device](self, "device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v19 uniqueID]);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SFActivityAdvertisement advertisementPayload](self, "advertisementPayload"));
  uint64_t v6 = SFAdvertisementDescriptionFromPayloadData(v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SFActivityAdvertisement options](self, "options"));
  uint64_t v9 = SFCompactStringFromCollection(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SFActivityAdvertisement device](self, "device"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SFActivityAdvertisement device](self, "device"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 modelIdentifier]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, deviceUniqueID:%@, advertisementPayload:%@, options:%@, deviceName:%@, deviceModelIdentifier:%@>",  v17,  self,  v5,  v7,  v10,  v12,  v14));

  return v15;
}

@end