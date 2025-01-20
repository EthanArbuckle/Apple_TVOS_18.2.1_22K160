@interface TVSettingsLocationItem
+ (id)allowedSystemServices;
+ (id)appSystemServices;
- (NSArray)allowedAccessTypes;
- (NSDictionary)info;
- (NSString)explanatoryText;
- (NSString)identifier;
- (NSString)title;
- (TVImageProxy)image;
- (TVSettingsLocationItem)init;
- (TVSettingsLocationItem)initWithInfo:(id)a3 identifier:(id)a4;
- (unint64_t)accessType;
- (unint64_t)type;
- (void)setAccessType:(unint64_t)a3;
- (void)setAllowedAccessTypes:(id)a3;
- (void)setExplanatoryText:(id)a3;
- (void)setImage:(id)a3;
- (void)setInfo:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation TVSettingsLocationItem

+ (id)allowedSystemServices
{
  if (qword_1001E18A0 != -1) {
    dispatch_once(&qword_1001E18A0, &stru_100191CA8);
  }
  return (id)qword_1001E1898;
}

+ (id)appSystemServices
{
  if (qword_1001E18B0 != -1) {
    dispatch_once(&qword_1001E18B0, &stru_100191CC8);
  }
  return (id)qword_1001E18A8;
}

- (TVSettingsLocationItem)init
{
  return -[TVSettingsLocationItem initWithInfo:identifier:](self, "initWithInfo:identifier:", 0LL, 0LL);
}

- (TVSettingsLocationItem)initWithInfo:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsLocationItem;
  v8 = -[TVSettingsLocationItem init](&v12, "init");
  if (v8)
  {
    v9 = (NSString *)[v7 copy];
    identifier = v8->_identifier;
    v8->_identifier = v9;

    -[TVSettingsLocationItem setInfo:](v8, "setInfo:", v6);
  }

  return v8;
}

- (void)setInfo:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BundleId"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BundlePath"]);
  if (-[NSString isEqual:]( self->_identifier,  "isEqual:",  @"/System/Library/LocationBundles/TimeZone.bundle"))
  {
    id v7 = @"LocationServicesTimeZoneTitle";
LABEL_13:
    uint64_t v8 = TSKLocString(v7);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(v8);
    unint64_t v10 = -1LL;
    goto LABEL_14;
  }

  if (-[NSString isEqual:]( self->_identifier,  "isEqual:",  @"/System/Library/PrivateFrameworks/AssistantServices.framework"))
  {
    id v7 = @"LocationServicesSiriTitle";
    goto LABEL_13;
  }

  if (-[NSString isEqual:]( self->_identifier,  "isEqual:",  @"/System/Library/PrivateFrameworks/MobileWiFi.framework"))
  {
    id v7 = @"LocationServicesMobileWiFiTitle_WIFI";
    goto LABEL_13;
  }

  if (-[NSString isEqual:]( self->_identifier,  "isEqual:",  @"/System/Library/PrivateFrameworks/CoreParsec.framework"))
  {
    id v7 = @"LocationServicesCoreParsecTitle";
    goto LABEL_13;
  }

  if (-[NSString isEqual:]( self->_identifier,  "isEqual:",  @"/System/Library/LocationBundles/IdleScreenLocation.bundle"))
  {
    id v7 = @"LocationServicesIdleScreenLocationTitle";
    goto LABEL_13;
  }

  if (-[NSString isEqual:]( self->_identifier,  "isEqual:",  @"/System/Library/LocationBundles/Routine.bundle"))
  {
    id v7 = @"LocationServicesRoutineTitle";
    goto LABEL_13;
  }

  if (v5
    || (id v29 = [(id)objc_opt_class(self) allowedSystemServices],
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29),
        unsigned int v31 = [v30 containsObject:self->_identifier],
        v30,
        v31))
  {
    id v32 = +[CLLocationManager primaryEntityClassForLocationDictionary:]( &OBJC_CLASS___CLLocationManager,  "primaryEntityClassForLocationDictionary:",  v4);
    unint64_t v10 = (unint64_t)v32 - 1;
    if (v32 == (id)1)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
      v34 = (void *)objc_claimAutoreleasedReturnValue([v33 appInfos]);
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:v5]);
      v9 = (NSString *)objc_claimAutoreleasedReturnValue([v35 localizedName]);

      if (-[NSString length](v9, "length"))
      {
        unint64_t v10 = 0LL;
      }

      else
      {
        v39 = v5;

        unint64_t v10 = 0LL;
        v9 = v39;
      }
    }

    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BundlePath"]);
      v37 = -[NSBundle initWithPath:](objc_alloc(&OBJC_CLASS___NSBundle), "initWithPath:", v36);
      v9 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSBundle objectForInfoDictionaryKey:]( v37,  "objectForInfoDictionaryKey:",  _kCFBundleDisplayNameKey));
      if (!-[NSString length](v9, "length"))
      {
        uint64_t v38 = objc_claimAutoreleasedReturnValue([v36 lastPathComponent]);

        v9 = (NSString *)v38;
      }
    }

- (void)setAccessType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = qword_10012A288[a3 - 1];
  }
  +[CLLocationManager setEntityAuthorization:forLocationDictionary:]( &OBJC_CLASS___CLLocationManager,  "setEntityAuthorization:forLocationDictionary:",  v4,  self->_info);
  if (-[NSString isEqual:]( self->_identifier,  "isEqual:",  @"/System/Library/LocationBundles/TimeZone.bundle"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsLocationServicesFacade sharedInstance]( &OBJC_CLASS___TVSettingsLocationServicesFacade,  "sharedInstance"));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v5 pineBoardItem]);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 info]);
    +[CLLocationManager setEntityAuthorization:forLocationDictionary:]( &OBJC_CLASS___CLLocationManager,  "setEntityAuthorization:forLocationDictionary:",  v4,  v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsAppearanceFacade sharedInstance]( &OBJC_CLASS___TVSettingsAppearanceFacade,  "sharedInstance"));
    [v7 invalidateSystemAppearance];
  }

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)explanatoryText
{
  return self->_explanatoryText;
}

- (void)setExplanatoryText:(id)a3
{
}

- (TVImageProxy)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)accessType
{
  return self->_accessType;
}

- (NSArray)allowedAccessTypes
{
  return self->_allowedAccessTypes;
}

- (void)setAllowedAccessTypes:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void).cxx_destruct
{
}

@end