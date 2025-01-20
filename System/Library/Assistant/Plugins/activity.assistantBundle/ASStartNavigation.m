@interface ASStartNavigation
- (ASStartNavigation)startNavigationWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation ASStartNavigation

- (void)performWithCompletion:(id)a3
{
}

- (ASStartNavigation)startNavigationWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASStartNavigation destination](self, "destination"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mapItem]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASStartNavigation origin](self, "origin"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mapItem]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASStartNavigation directionsType](self, "directionsType"));
  if ([v9 isEqualToString:SALocalSearchDirectionsTypeWalkingValue])
  {
    v10 = &MKLaunchOptionsDirectionsModeWalking;
  }

  else
  {
    unsigned __int8 v11 = [v9 isEqualToString:SALocalSearchDirectionsTypeByPublicTransitValue];
    v12 = MKLaunchOptionsDirectionsModeTransit;
    if ((v11 & 1) != 0) {
      goto LABEL_9;
    }
    if (![v9 isEqualToString:MKLaunchOptionsDirectionsModeTransit])
    {
      v13 = (os_log_s *)AFSiriLogContextService;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "__MKDirectionsModeForString";
        __int16 v27 = 2112;
        v28 = v9;
        _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Unsupported directions type %@, defaulting to driving",  buf,  0x16u);
      }
    }

    v10 = &MKLaunchOptionsDirectionsModeDriving;
  }

  v12 = *v10;
LABEL_9:
  v14 = v12;

  if (!v6)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid ace command %@, no destination",  self));
    v18 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
    {
      sub_7934((uint64_t)v15, v18);
      if (!v4) {
        goto LABEL_18;
      }
    }

    else if (!v4)
    {
      goto LABEL_18;
    }

    id v17 = [[SACommandFailed alloc] initWithReason:v15];
    goto LABEL_17;
  }

  if (!v8) {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem mapItemForCurrentLocation](&OBJC_CLASS___MKMapItem, "mapItemForCurrentLocation"));
  }
  v24[0] = v8;
  v24[1] = v6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
  v22 = MKLaunchOptionsDirectionsModeKey;
  v23 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
  +[MKMapItem openMapsWithItems:launchOptions:](&OBJC_CLASS___MKMapItem, "openMapsWithItems:launchOptions:", v15, v16);

  if (v4)
  {
    id v17 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
LABEL_17:
    v19 = v17;
    v20 = (void *)objc_claimAutoreleasedReturnValue([v17 dictionary]);
    v4[2](v4, v20);
  }

@end