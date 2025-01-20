@interface SAUIAppPunchOut
- (id)_convertedPunchout;
@end

@implementation SAUIAppPunchOut

- (id)_convertedPunchout
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SFPunchout);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIAppPunchOut punchOutName](self, "punchOutName"));
  [v3 setName:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIAppPunchOut punchOutUri](self, "punchOutUri"));
  v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  [v3 setUrls:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIAppPunchOut bundleId](self, "bundleId"));
  if (v7)
  {
    [v3 setBundleIdentifier:v7];
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[SiriUIUtilities defaultBrowserBundleIdentifier]( &OBJC_CLASS___SiriUIUtilities,  "defaultBrowserBundleIdentifier"));
    [v3 setBundleIdentifier:v8];
  }

  return v3;
}

@end