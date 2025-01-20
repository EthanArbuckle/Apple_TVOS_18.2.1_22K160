@interface AKURLBagRequestProvider
- (AKURLBagRequestProvider)initWithAltDSID:(id)a3 urlSwitchData:(id)a4;
- (NSString)altDSID;
- (NSString)urlSwitchData;
- (id)_bagURLForAltDSID:(id)a3;
- (id)newBagURLRequest;
- (void)setAltDSID:(id)a3;
- (void)setUrlSwitchData:(id)a3;
@end

@implementation AKURLBagRequestProvider

- (AKURLBagRequestProvider)initWithAltDSID:(id)a3 urlSwitchData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AKURLBagRequestProvider;
  v8 = -[AKURLBagRequestProvider init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[AKURLBagRequestProvider setAltDSID:](v8, "setAltDSID:", v6);
    -[AKURLBagRequestProvider setUrlSwitchData:](v9, "setUrlSwitchData:", v7);
  }

  return v9;
}

- (id)_bagURLForAltDSID:(id)a3
{
  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"https://gsa.apple.com/grandslam/GsService2/lookup/v2",  a3));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v3));
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"https://gsa.apple.com/grandslam/GsService2/lookup/v2"));
  }

  return v4;
}

- (id)newBagURLRequest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLBagRequestProvider _bagURLForAltDSID:](self, "_bagURLForAltDSID:", self->_altDSID));
  if (self->_urlSwitchData)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:]( &OBJC_CLASS___NSURLComponents,  "componentsWithURL:resolvingAgainstBaseURL:",  v3,  0LL));
    v5 = -[NSURLQueryItem initWithName:value:]( objc_alloc(&OBJC_CLASS___NSURLQueryItem),  "initWithName:value:",  @"idata",  self->_urlSwitchData);
    v10 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    [v4 setQueryItems:v6];

    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 URL]);
    v3 = (void *)v7;
  }

  v8 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v3);
  -[NSMutableURLRequest ak_addClientInfoHeader](v8, "ak_addClientInfoHeader");
  -[NSMutableURLRequest ak_addCountryHeader](v8, "ak_addCountryHeader");
  -[NSMutableURLRequest ak_addDeviceUDIDHeader](v8, "ak_addDeviceUDIDHeader");
  -[NSMutableURLRequest ak_addInternalBuildHeader](v8, "ak_addInternalBuildHeader");
  -[NSMutableURLRequest ak_addSeedBuildHeader](v8, "ak_addSeedBuildHeader");
  -[NSMutableURLRequest ak_addFeatureMaskHeader](v8, "ak_addFeatureMaskHeader");
  -[NSMutableURLRequest ak_addLocaleHeader](v8, "ak_addLocaleHeader");
  -[NSMutableURLRequest ak_addTimeZoneHeaders](v8, "ak_addTimeZoneHeaders");
  -[NSMutableURLRequest ak_addSKUCountryHeader](v8, "ak_addSKUCountryHeader");
  -[NSMutableURLRequest ak_addExperimentModeHeader](v8, "ak_addExperimentModeHeader");

  return v8;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)urlSwitchData
{
  return self->_urlSwitchData;
}

- (void)setUrlSwitchData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end