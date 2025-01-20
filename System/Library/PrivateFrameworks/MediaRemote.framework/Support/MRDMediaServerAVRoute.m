@interface MRDMediaServerAVRoute
- (BOOL)canBeDefaultRoute;
- (BOOL)canBeDefaultSystemRoute;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInputRoute;
- (BOOL)isOutputRoute;
- (BOOL)isPicked;
- (BOOL)isSpeakerRoute;
- (BOOL)matchesUniqueIdentifier:(id)a3;
- (MRDMediaServerAVRoute)initWithDictionary:(id)a3;
- (id)description;
- (id)dictionary;
- (id)extendedInfo;
- (id)modelName;
- (id)name;
- (id)type;
- (id)uniqueIdentifier;
- (unint64_t)hash;
@end

@implementation MRDMediaServerAVRoute

- (MRDMediaServerAVRoute)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MRDMediaServerAVRoute;
  v5 = -[MRDMediaServerAVRoute init](&v9, "init");
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copy];
    routeDescription = v5->_routeDescription;
    v5->_routeDescription = v6;
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_routeDescription,  "objectForKey:",  AVSystemController_RouteDescriptionKey_RouteUID));
  id v4 = v3;
  if (v3) {
    unint64_t v5 = (unint64_t)[v3 hash];
  }
  else {
    unint64_t v5 = 0LL;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_routeDescription,  "objectForKey:",  AVSystemController_RouteDescriptionKey_RouteName));
  v7 = v6;
  if (v6) {
    v5 ^= (unint64_t)[v6 hash];
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_routeDescription,  "objectForKey:",  AVSystemController_RouteDescriptionKey_RouteType));
  objc_super v9 = v8;
  if (v8) {
    v5 ^= (unint64_t)[v8 hash];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MRDMediaServerAVRoute);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    unsigned __int8 v6 = [v4[9] isEqualToDictionary:self->_routeDescription];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p: %@>",  v5,  self,  self->_routeDescription));

  return v6;
}

- (id)uniqueIdentifier
{
  return -[NSDictionary objectForKey:]( self->_routeDescription,  "objectForKey:",  AVSystemController_RouteDescriptionKey_RouteUID);
}

- (id)name
{
  return -[NSDictionary objectForKey:]( self->_routeDescription,  "objectForKey:",  AVSystemController_RouteDescriptionKey_RouteName);
}

- (id)type
{
  return -[NSDictionary objectForKey:]( self->_routeDescription,  "objectForKey:",  AVSystemController_RouteDescriptionKey_RouteType);
}

- (id)modelName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerAVRoute extendedInfo](self, "extendedInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 modelName]);

  return v3;
}

- (BOOL)isInputRoute
{
  return 1;
}

- (BOOL)isOutputRoute
{
  return 1;
}

- (BOOL)isPicked
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_routeDescription,  "objectForKey:",  AVSystemController_RouteDescriptionKey_IsCurrentlyPickedOnPairedDevice));
  if ([v3 BOOLValue])
  {
    BOOL v4 = 1;
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_routeDescription,  "objectForKey:",  AVSystemController_RouteDescriptionKey_RouteCurrentlyPicked));
    if ([v5 BOOLValue])
    {
      BOOL v4 = 1;
    }

    else
    {
      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVOutputContext sharedSystemAudioContext]( &OBJC_CLASS___MRAVOutputContext,  "sharedSystemAudioContext"));
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 outputDevices]);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1000A0250;
      v9[3] = &unk_10039E308;
      v9[4] = self;
      BOOL v4 = [v7 indexOfObjectPassingTest:v9] != (id)0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v4;
}

- (BOOL)isSpeakerRoute
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_routeDescription,  "objectForKey:",  AVSystemController_RouteDescriptionKey_AVAudioRouteName));
  unsigned __int8 v3 = [v2 isEqualToString:@"Speaker"];

  return v3;
}

- (BOOL)canBeDefaultRoute
{
  return 1;
}

- (BOOL)canBeDefaultSystemRoute
{
  return 1;
}

- (id)dictionary
{
  return self->_routeDescription;
}

- (id)extendedInfo
{
  extendedInfo = self->_extendedInfo;
  if (!extendedInfo)
  {
    BOOL v4 = -[MRDAVRouteExtendedInfo initWithRoute:]( objc_alloc(&OBJC_CLASS___MRDAVRouteExtendedInfo),  "initWithRoute:",  self->_routeDescription);
    uint64_t v5 = self->_extendedInfo;
    self->_extendedInfo = v4;

    extendedInfo = self->_extendedInfo;
  }

  return extendedInfo;
}

- (BOOL)matchesUniqueIdentifier:(id)a3
{
  return -[NSDictionary matchesUID:](self->_routeDescription, "matchesUID:", a3);
}

- (void).cxx_destruct
{
}

@end