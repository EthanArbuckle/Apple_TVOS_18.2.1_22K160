@interface AFSiriAudioRoute
- (AFSiriAudioRoute)initWithRouteDescription:(id)a3 hearingAidsAnnounceEnabled:(BOOL)a4 builtInSpeakerAnnounceEnabled:(BOOL)a5 ringerSwitchState:(int64_t)a6;
- (BOOL)_isBuiltInSpeakerRoute;
- (BOOL)_isHearingAidsRoute;
- (BOOL)hasAuthenticationCapability;
- (BOOL)isEqualToRoute:(id)a3;
- (BOOL)isRouteCurrentlyPicked;
- (BOOL)isThirdPartyBluetoothHeadset;
- (NSDictionary)avscRouteDescription;
- (NSString)btAddress;
- (NSString)connectedBTProductID;
- (NSString)name;
- (NSString)productID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)routeName;
- (int64_t)_announcementPlatform;
- (int64_t)announcePlatformForRoute;
- (unint64_t)_getRouteCapabilities;
- (unint64_t)availableAnnouncementRequestTypes;
- (unint64_t)hash;
- (void)_initializeInternalState;
- (void)setAnnouncePlatformForRoute:(int64_t)a3;
- (void)setAvailableAnnouncementRequestTypes:(unint64_t)a3;
- (void)setAvscRouteDescription:(id)a3;
- (void)setBtAddress:(id)a3;
- (void)setConnectedBTProductID:(id)a3;
- (void)setName:(id)a3;
- (void)setProductID:(id)a3;
@end

@implementation AFSiriAudioRoute

- (AFSiriAudioRoute)initWithRouteDescription:(id)a3 hearingAidsAnnounceEnabled:(BOOL)a4 builtInSpeakerAnnounceEnabled:(BOOL)a5 ringerSwitchState:(int64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AFSiriAudioRoute;
  v12 = -[AFSiriAudioRoute init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_avscRouteDescription, a3);
    v13->_hearingAidsAnnounceEnabled = a4;
    v13->_builtInSpeakerAnnounceEnabled = a5;
    v13->_ringerSwitchState = a6;
    -[AFSiriAudioRoute _initializeInternalState](v13, "_initializeInternalState");
    v13->_availableAnnouncementRequestTypes = -[AFSiriAudioRoute _getRouteCapabilities](v13, "_getRouteCapabilities");
    v13->_announcePlatformForRoute = -[AFSiriAudioRoute _announcementPlatform](v13, "_announcementPlatform");
  }

  return v13;
}

- (void)_initializeInternalState
{
  avscRouteDescription = self->_avscRouteDescription;
  if (avscRouteDescription)
  {
    v4 = avscRouteDescription;
    uint64_t v64 = 0LL;
    v65 = &v64;
    uint64_t v66 = 0x2020000000LL;
    v5 = (id *)qword_100577AB8;
    uint64_t v67 = qword_100577AB8;
    if (!qword_100577AB8)
    {
      v6 = sub_10007CFFC();
      v5 = (id *)dlsym(v6, "AVSystemController_RouteDescriptionKey_IsGenuineAppleAccessory");
      v65[3] = (uint64_t)v5;
      qword_100577AB8 = (uint64_t)v5;
    }

    _Block_object_dispose(&v64, 8);
    if (!v5)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getAVSystemController_RouteDescriptionKey_IsGenuineAppleAccessory(void)"));
      objc_msgSend( v62,  "handleFailureInFunction:file:lineNumber:description:",  v63,  @"AFSiriAudioRoute.m",  36,  @"%s",  dlerror());
      goto LABEL_56;
    }

    id v7 = *v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v4, "objectForKey:", v7));
    self->_isGenuineAppleAccessory = [v8 BOOLValue];

    uint64_t v64 = 0LL;
    v65 = &v64;
    uint64_t v66 = 0x2020000000LL;
    v9 = (id *)qword_100577AC8;
    uint64_t v67 = qword_100577AC8;
    if (!qword_100577AC8)
    {
      v10 = sub_10007CFFC();
      v9 = (id *)dlsym(v10, "AVSystemController_RouteDescriptionKey_RouteCurrentlyPicked");
      v65[3] = (uint64_t)v9;
      qword_100577AC8 = (uint64_t)v9;
    }

    _Block_object_dispose(&v64, 8);
    if (!v9)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getAVSystemController_RouteDescriptionKey_RouteCurrentlyPicked(void)"));
      objc_msgSend( v62,  "handleFailureInFunction:file:lineNumber:description:",  v63,  @"AFSiriAudioRoute.m",  32,  @"%s",  dlerror());
      goto LABEL_56;
    }

    id v11 = *v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v4, "objectForKey:", v11));
    self->_isRouteCurrentlyPicked = [v12 BOOLValue];

    uint64_t v64 = 0LL;
    v65 = &v64;
    uint64_t v66 = 0x2020000000LL;
    v13 = (id *)qword_100577AD0;
    uint64_t v67 = qword_100577AD0;
    if (!qword_100577AD0)
    {
      v14 = sub_10007CFFC();
      v13 = (id *)dlsym(v14, "AVSystemController_RouteDescriptionKey_BTDetails_SupportsDoAP");
      v65[3] = (uint64_t)v13;
      qword_100577AD0 = (uint64_t)v13;
    }

    _Block_object_dispose(&v64, 8);
    if (!v13)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getAVSystemController_RouteDescriptionKey_BTDetails_SupportsDoAP(void)"));
      objc_msgSend( v62,  "handleFailureInFunction:file:lineNumber:description:",  v63,  @"AFSiriAudioRoute.m",  30,  @"%s",  dlerror());
      goto LABEL_56;
    }

    id v15 = *v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v4, "objectForKey:", v15));
    self->_isDoAPCapable = [v16 BOOLValue];

    uint64_t v64 = 0LL;
    v65 = &v64;
    uint64_t v66 = 0x2020000000LL;
    v17 = (id *)qword_100577AD8;
    uint64_t v67 = qword_100577AD8;
    if (!qword_100577AD8)
    {
      v18 = sub_10007CFFC();
      v17 = (id *)dlsym(v18, "AVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActive");
      v65[3] = (uint64_t)v17;
      qword_100577AD8 = (uint64_t)v17;
    }

    _Block_object_dispose(&v64, 8);
    if (!v17)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActive(void)"));
      objc_msgSend( v62,  "handleFailureInFunction:file:lineNumber:description:",  v63,  @"AFSiriAudioRoute.m",  27,  @"%s",  dlerror());
      goto LABEL_56;
    }

    id v19 = *v17;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v4, "objectForKey:", v19));
    self->_isHeadsetInEar = [v20 BOOLValue];

    sub_10007D100();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v4, "objectForKey:", v22));

    if (v23)
    {
      self->_inEarDetectEnabledSpecified = 1;
      sub_10007D100();
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v4, "objectForKey:", v25));
      self->_inEarDetectEnabled = [v26 BOOLValue];
    }

    uint64_t v64 = 0LL;
    v65 = &v64;
    uint64_t v66 = 0x2020000000LL;
    v27 = (id *)qword_100577AE8;
    uint64_t v67 = qword_100577AE8;
    if (!qword_100577AE8)
    {
      v28 = sub_10007CFFC();
      v27 = (id *)dlsym(v28, "AVSystemController_RouteDescriptionKey_BTDetails_ProductID");
      v65[3] = (uint64_t)v27;
      qword_100577AE8 = (uint64_t)v27;
    }

    _Block_object_dispose(&v64, 8);
    if (!v27)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getAVSystemController_RouteDescriptionKey_BTDetails_ProductID(void)"));
      objc_msgSend( v62,  "handleFailureInFunction:file:lineNumber:description:",  v63,  @"AFSiriAudioRoute.m",  33,  @"%s",  dlerror());
      goto LABEL_56;
    }

    id v29 = *v27;
    v30 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v4, "objectForKey:", v29));
    connectedBTProductID = self->_connectedBTProductID;
    self->_connectedBTProductID = v30;

    unsigned int v32 = -[NSString hasPrefix:](self->_connectedBTProductID, "hasPrefix:", @"BTHeadphones");
    v33 = self->_connectedBTProductID;
    if (v32)
    {
      v34 = @"BTHeadphones";
    }

    else
    {
      if (!-[NSString hasPrefix:](self->_connectedBTProductID, "hasPrefix:", @"BTHeadset")) {
        goto LABEL_24;
      }
      v33 = self->_connectedBTProductID;
      v34 = @"BTHeadset";
    }

    v35 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v33, "substringFromIndex:", -[__CFString length](v34, "length")));
    productID = self->_productID;
    self->_productID = v35;

LABEL_24:
    uint64_t v64 = 0LL;
    v65 = &v64;
    uint64_t v66 = 0x2020000000LL;
    v37 = (void *)qword_100577AF0;
    uint64_t v67 = qword_100577AF0;
    if (!qword_100577AF0)
    {
      v38 = sub_10007CFFC();
      v37 = dlsym(v38, "AVSystemController_RouteDescriptionKey_RouteUID");
      v65[3] = (uint64_t)v37;
      qword_100577AF0 = (uint64_t)v37;
    }

    _Block_object_dispose(&v64, 8);
    if (!v37)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getAVSystemController_RouteDescriptionKey_RouteUID(void)"));
      objc_msgSend( v62,  "handleFailureInFunction:file:lineNumber:description:",  v63,  @"AFSiriAudioRoute.m",  34,  @"%s",  dlerror());
      goto LABEL_56;
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v4, "objectForKey:", *v37));
    v40 = (void *)objc_claimAutoreleasedReturnValue([v39 componentsSeparatedByString:@"-"]);
    v41 = (NSString *)objc_claimAutoreleasedReturnValue([v40 objectAtIndex:0]);
    btAddress = self->_btAddress;
    self->_btAddress = v41;

    if ((AFBTProductIDSupportsAnnounce(self->_productID) & 1) != 0 || (LOBYTE(v43) = self->_isDoAPCapable, (_BYTE)v43)) {
      int v43 = AFBTAnnounceCallsUnsupportedOnProductID(self->_productID) ^ 1;
    }
    self->_headsetSupportsAnnounceCalls = v43;
    self->_headsetSupportsIED = AFBTProductIDSupportsIED(self->_productID);
    self->_headsetSupportsFauxIED = AFBTProductIDSupportsFauxIED(self->_productID);
    uint64_t v64 = 0LL;
    v65 = &v64;
    uint64_t v66 = 0x2020000000LL;
    v44 = (id *)qword_100577AF8;
    uint64_t v67 = qword_100577AF8;
    if (!qword_100577AF8)
    {
      v45 = sub_10007CFFC();
      v44 = (id *)dlsym(v45, "AVSystemController_RouteDescriptionKey_BTDetails_IsBTManaged");
      v65[3] = (uint64_t)v44;
      qword_100577AF8 = (uint64_t)v44;
    }

    _Block_object_dispose(&v64, 8);
    if (!v44)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManaged(void)"));
      objc_msgSend( v62,  "handleFailureInFunction:file:lineNumber:description:",  v63,  @"AFSiriAudioRoute.m",  31,  @"%s",  dlerror());
      goto LABEL_56;
    }

    id v46 = *v44;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v4, "objectForKey:", v46));
    self->_isTipiRoute = [v47 BOOLValue];

    uint64_t v64 = 0LL;
    v65 = &v64;
    uint64_t v66 = 0x2020000000LL;
    v49 = (id *)qword_100577B00;
    uint64_t v67 = qword_100577B00;
    if (!qword_100577B00)
    {
      v50 = sub_10007CFFC();
      v49 = (id *)dlsym(v50, "AVSystemController_RouteDescriptionKey_OtherDevicesConnected");
      v65[3] = (uint64_t)v49;
      qword_100577B00 = (uint64_t)v49;
    }

    _Block_object_dispose(&v64, 8);
    if (!v49)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getAVSystemController_RouteDescriptionKey_OtherDevicesConnected(void)"));
      objc_msgSend( v62,  "handleFailureInFunction:file:lineNumber:description:",  v63,  @"AFSiriAudioRoute.m",  29,  @"%s",  dlerror());
      goto LABEL_56;
    }

    id v51 = *v49;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v4, "objectForKey:", v51));
    self->_BOOL isOtherDeviceConnected = [v52 count] != 0;

    if (self->_isTipiRoute)
    {
      char v53 = 0;
      uint64_t v54 = 76LL;
    }

    else
    {
      BOOL isOtherDeviceConnected = self->_isOtherDeviceConnected;
      self->_isInTriangleMode = isOtherDeviceConnected;
      if (!isOtherDeviceConnected)
      {
LABEL_42:
        uint64_t v64 = 0LL;
        v65 = &v64;
        uint64_t v66 = 0x2020000000LL;
        v56 = (id *)qword_100577B08;
        uint64_t v67 = qword_100577B08;
        if (!qword_100577B08)
        {
          v57 = sub_10007CFFC();
          v56 = (id *)dlsym(v57, "AVSystemController_RouteDescriptionKey_AVAudioRouteName");
          v65[3] = (uint64_t)v56;
          qword_100577B08 = (uint64_t)v56;
        }

        _Block_object_dispose(&v64, 8);
        if (v56)
        {
          id v58 = *v56;
          v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v4, "objectForKey:", v58));
          v60 = (NSString *)[v59 copy];
          avAudioRouteName = self->_avAudioRouteName;
          self->_avAudioRouteName = v60;

          self->_isBuiltInSpeakerRoute = -[AFSiriAudioRoute _isBuiltInSpeakerRoute](self, "_isBuiltInSpeakerRoute");
          self->_isHearingAidsRoute = -[AFSiriAudioRoute _isHearingAidsRoute](self, "_isHearingAidsRoute");

          return;
        }

        v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getAVSystemController_RouteDescriptionKey_AVAudioRouteName(void)"));
        objc_msgSend( v62,  "handleFailureInFunction:file:lineNumber:description:",  v63,  @"AFSiriAudioRoute.m",  35,  @"%s",  dlerror());
LABEL_56:

        __break(1u);
        return;
      }

      char v53 = 1;
      uint64_t v54 = 78LL;
    }

    *((_BYTE *)&self->super.isa + v54) = v53;
    goto LABEL_42;
  }

- (unint64_t)_getRouteCapabilities
{
  if (self->_isRouteCurrentlyPicked && self->_isDoAPCapable && (self->_isHeadsetInEar || !self->_headsetSupportsIED)) {
    goto LABEL_13;
  }
  if ((+[AFFeatureFlags isAccessibleAnnounceEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isAccessibleAnnounceEnabled") & 1) == 0)
  {
    BOOL isRouteCurrentlyPicked = self->_isRouteCurrentlyPicked;
    goto LABEL_15;
  }

  BOOL isRouteCurrentlyPicked = self->_isRouteCurrentlyPicked;
  if (!self->_hearingAidsAnnounceEnabled) {
    goto LABEL_27;
  }
  if (!self->_isRouteCurrentlyPicked) {
    goto LABEL_17;
  }
  if (!self->_isHearingAidsRoute)
  {
LABEL_27:
    if (self->_builtInSpeakerAnnounceEnabled)
    {
      if (self->_isRouteCurrentlyPicked)
      {
        if (self->_isBuiltInSpeakerRoute && self->_ringerSwitchState == 1) {
          goto LABEL_13;
        }
LABEL_16:
        unint64_t result = 0LL;
        goto LABEL_18;
      }

- (BOOL)isThirdPartyBluetoothHeadset
{
  if (-[NSString isEqualToString:](self->_avAudioRouteName, "isEqualToString:", @"HeadsetBT")
    || (BOOL v3 = -[NSString isEqualToString:](self->_avAudioRouteName, "isEqualToString:", @"HeadphonesBT")))
  {
    LOBYTE(v3) = !self->_isGenuineAppleAccessory;
  }

  return v3;
}

- (BOOL)_isBuiltInSpeakerRoute
{
  if (-[NSString isEqualToString:](self->_avAudioRouteName, "isEqualToString:", @"Speaker")) {
    return 1;
  }
  else {
    return -[NSString isEqualToString:](self->_avAudioRouteName, "isEqualToString:", @"BestSpeaker");
  }
}

- (BOOL)_isHearingAidsRoute
{
  return -[NSString isEqualToString:](self->_avAudioRouteName, "isEqualToString:", @"BluetoothLEOutput");
}

- (int64_t)_announcementPlatform
{
  if (-[AFSiriAudioRoute _isHearingAidsRoute](self, "_isHearingAidsRoute")) {
    return 3LL;
  }
  if (-[AFSiriAudioRoute _isBuiltInSpeakerRoute](self, "_isBuiltInSpeakerRoute")) {
    return 4LL;
  }
  return 1LL;
}

- (BOOL)isRouteCurrentlyPicked
{
  return self->_isRouteCurrentlyPicked;
}

- (id)routeName
{
  return self->_avAudioRouteName;
}

- (BOOL)hasAuthenticationCapability
{
  return self->_isRouteCurrentlyPicked
      && self->_isHeadsetInEar
      && self->_headsetSupportsIED
      && !self->_headsetSupportsFauxIED
      && self->_inEarDetectEnabledSpecified
      && self->_inEarDetectEnabled
      && self->_isGenuineAppleAccessory;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_productID, "hash");
  unint64_t v4 = -[NSString hash](self->_btAddress, "hash") ^ v3;
  unint64_t v5 = v4 ^ -[NSString hash](self->_name, "hash");
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[AFSiriAudioRoute availableAnnouncementRequestTypes](self, "availableAnnouncementRequestTypes")));
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[AFSiriAudioRoute hasAuthenticationCapability](self, "hasAuthenticationCapability")));
  unint64_t v9 = v7 ^ (unint64_t)[v8 hash];

  return v9;
}

- (BOOL)isEqualToRoute:(id)a3
{
  unint64_t v5 = (AFSiriAudioRoute *)a3;
  v6 = v5;
  if (self == v5)
  {
    LOBYTE(v12) = 1;
    goto LABEL_22;
  }

  productID = self->_productID;
  v8 = productID;
  if (!productID)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[AFSiriAudioRoute productID](v5, "productID"));
    if (!v9) {
      goto LABEL_10;
    }
    NSUInteger v3 = (void *)v9;
    v8 = self->_productID;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AFSiriAudioRoute productID](v6, "productID"));
  unsigned int v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v10);

  if (productID)
  {
    if (!v11) {
      goto LABEL_21;
    }
  }

  else
  {

    if ((v11 & 1) == 0) {
      goto LABEL_21;
    }
  }

- (id)copyWithZone:(_NSZone *)a3
{
  return -[AFSiriAudioRoute initWithRouteDescription:hearingAidsAnnounceEnabled:builtInSpeakerAnnounceEnabled:ringerSwitchState:]( objc_alloc(&OBJC_CLASS___AFSiriAudioRoute),  "initWithRouteDescription:hearingAidsAnnounceEnabled:builtInSpeakerAnnounceEnabled:ringerSwitchState:",  self->_avscRouteDescription,  self->_hearingAidsAnnounceEnabled,  self->_builtInSpeakerAnnounceEnabled,  self->_ringerSwitchState);
}

- (NSString)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
}

- (NSString)btAddress
{
  return self->_btAddress;
}

- (void)setBtAddress:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)connectedBTProductID
{
  return self->_connectedBTProductID;
}

- (void)setConnectedBTProductID:(id)a3
{
}

- (unint64_t)availableAnnouncementRequestTypes
{
  return self->_availableAnnouncementRequestTypes;
}

- (void)setAvailableAnnouncementRequestTypes:(unint64_t)a3
{
  self->_id availableAnnouncementRequestTypes = a3;
}

- (NSDictionary)avscRouteDescription
{
  return self->_avscRouteDescription;
}

- (void)setAvscRouteDescription:(id)a3
{
}

- (int64_t)announcePlatformForRoute
{
  return self->_announcePlatformForRoute;
}

- (void)setAnnouncePlatformForRoute:(int64_t)a3
{
  self->_id announcePlatformForRoute = a3;
}

- (void).cxx_destruct
{
}

@end