@interface PodcastsTranscriptsDomain
+ (BOOL)supportsSecureCoding;
- (PodcastsTranscriptsDomain)init;
- (PodcastsTranscriptsDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (id)status;
- (unint64_t)domain;
@end

@implementation PodcastsTranscriptsDomain

- (unint64_t)domain
{
  return 121LL;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.podcasts-transcripts";
}

- (PodcastsTranscriptsDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PodcastsTranscriptsDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[PodcastsTranscriptsDomain _internal_doInit](v2, "_internal_doInit");
  }
  return v3;
}

- (PodcastsTranscriptsDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PodcastsTranscriptsDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[PodcastsTranscriptsDomain _internal_doInit](v3, "_internal_doInit");
  }
  return v4;
}

- (id)status
{
  v2 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[InputManager sharedInstance](&OBJC_CLASS___InputManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](&OBJC_CLASS___MobileAssetManager, "sharedInstance"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 podcastsTranscriptsAsset]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 billingCountryCodes]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 regionSKUs]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v5 countryCodes]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForInputValue:2]);
  v9 = v8;
  if (v8 && (v10 = (void *)objc_claimAutoreleasedReturnValue([v8 countryCode]), v10, v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 countryCode]);
    unsigned int v12 = [v6 containsObject:v11];

    if (v12) {
      v13 = &off_100038080;
    }
    else {
      v13 = &off_100038098;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v13,  @"OS_ELIGIBILITY_INPUT_COUNTRY_BILLING");
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForInputValue:", 6, v7));
    v15 = v14;
    if (v14
      && (uint64_t v16 = objc_claimAutoreleasedReturnValue([v14 deviceRegionCode])) != 0
      && (v17 = (void *)v16,
          v18 = (void *)objc_claimAutoreleasedReturnValue([v15 deviceRegionCode]),
          unsigned int v19 = [v28 containsObject:v18],
          v18,
          v17,
          v19))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &off_100038080,  @"OS_ELIGIBILITY_INPUT_DEVICE_REGION_CODE");
    }

    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForInputValue:1]);
      v21 = v20;
      if (v20
        && (v22 = (void *)objc_claimAutoreleasedReturnValue([v20 countryCodes]), v22, v22))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue([v21 countryCodes]);
        else {
          uint64_t v24 = 3LL;
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v24));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v25,  @"OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION");
      }

      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v21 status]));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v23,  @"OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION");
      }
    }

    v7 = v28;
  }

  id v26 = -[NSMutableDictionary copy](v2, "copy");

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end