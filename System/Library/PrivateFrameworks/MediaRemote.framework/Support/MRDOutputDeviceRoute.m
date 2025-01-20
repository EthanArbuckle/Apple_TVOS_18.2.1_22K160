@interface MRDOutputDeviceRoute
- (BOOL)canBeDefaultRoute;
- (BOOL)canBeDefaultSystemRoute;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInputRoute;
- (BOOL)isOutputRoute;
- (BOOL)isPicked;
- (BOOL)isSpeakerRoute;
- (BOOL)matchesUniqueIdentifier:(id)a3;
- (MRAVOutputDevice)outputDevice;
- (MRDOutputDeviceRoute)initWithOutputDevice:(id)a3;
- (id)MACAddress;
- (id)description;
- (id)dictionary;
- (id)extendedInfo;
- (id)modelName;
- (id)name;
- (id)type;
- (id)uniqueIdentifier;
- (unint64_t)hash;
@end

@implementation MRDOutputDeviceRoute

- (MRDOutputDeviceRoute)initWithOutputDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MRDOutputDeviceRoute;
  v6 = -[MRDOutputDeviceRoute init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_outputDevice, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)-[MRAVOutputDevice hash](self->_outputDevice, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MRDAVOutputDeviceRoute);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 avOutputDevice]);
    unsigned __int8 v7 = [v6 isEqual:self->_outputDevice];
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p outputDevice = %@>",  v5,  self,  self->_outputDevice));

  return v6;
}

- (id)uniqueIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice primaryID](self->_outputDevice, "primaryID"));
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice uid](self->_outputDevice, "uid"));
  }
  v6 = v5;

  return v6;
}

- (id)MACAddress
{
  return -[MRAVOutputDevice MACAddress](self->_outputDevice, "MACAddress");
}

- (id)name
{
  return -[MRAVOutputDevice name](self->_outputDevice, "name");
}

- (id)type
{
  v3 = (void *)MRAVOutputDeviceTypeCopyDescription(-[MRAVOutputDevice deviceType](self->_outputDevice, "deviceType"));
  id v4 = (void *)MRAVOutputDeviceSubtypeCopyDescription(-[MRAVOutputDevice deviceSubtype](self->_outputDevice, "deviceSubtype"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v3, v4));

  return v5;
}

- (id)modelName
{
  return -[MRAVOutputDevice modelID](self->_outputDevice, "modelID");
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
  id v3 = -[objc_class sharedAudioPresentationOutputContext](off_1003F7F18(), "sharedAudioPresentationOutputContext");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 outputDevices]);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        outputDevice = self->_outputDevice;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)i), "ID", (void)v15));
        LOBYTE(outputDevice) = -[MRAVOutputDevice containsUID:](outputDevice, "containsUID:", v12);

        if ((outputDevice & 1) != 0)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)isSpeakerRoute
{
  id v3 = -[objc_class sharedLocalDevice](off_1003F7F20(), "sharedLocalDevice");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 ID]);
  BOOL v6 = -[MRDOutputDeviceRoute matchesUniqueIdentifier:](self, "matchesUniqueIdentifier:", v5)
    || -[MRAVOutputDevice deviceType](self->_outputDevice, "deviceType") == 4;

  return v6;
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
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOutputDeviceRoute uniqueIdentifier](self, "uniqueIdentifier"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOutputDeviceRoute uniqueIdentifier](self, "uniqueIdentifier"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, @"RouteUID");
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOutputDeviceRoute name](self, "name"));

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOutputDeviceRoute name](self, "name"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v7, @"RouteName");
  }

  v20[0] = @"model";
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MRDOutputDeviceRoute modelName](self, "modelName"));
  uint64_t v9 = (void *)v8;
  if (v8) {
    v10 = (const __CFString *)v8;
  }
  else {
    v10 = &stru_1003AE680;
  }
  v20[1] = @"deviceID";
  v21[0] = v10;
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[MRDOutputDeviceRoute uniqueIdentifier](self, "uniqueIdentifier"));
  v12 = (void *)v11;
  if (v11) {
    BOOL v13 = (const __CFString *)v11;
  }
  else {
    BOOL v13 = &stru_1003AE680;
  }
  v21[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v14,  @"AirPlayPortExtendedInfo");

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MRAVOutputDevice requiresAuthorization](self->_outputDevice, "requiresAuthorization")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v15,  @"RouteRequiresAirPlayPIN");

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MRAVOutputDevice requiresAuthorization](self->_outputDevice, "requiresAuthorization")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v16, @"PortHasPassword");

  signed int v17 = -[MRAVOutputDevice deviceType](self->_outputDevice, "deviceType");
  if (v17 <= 5)
  {
    uint64_t v18 = (uint64_t)*(&off_1003A3040 + v17);
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", *(&off_1003A3010 + v17), @"RouteType");
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v18, @"AVAudioRouteName");
  }

  return v3;
}

- (id)extendedInfo
{
  id v3 = objc_alloc(&OBJC_CLASS___MRDAVRouteExtendedInfo);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOutputDeviceRoute dictionary](self, "dictionary"));
  id v5 = -[MRDAVRouteExtendedInfo initWithRoute:](v3, "initWithRoute:", v4);

  return v5;
}

- (BOOL)matchesUniqueIdentifier:(id)a3
{
  return -[MRAVOutputDevice containsUID:](self->_outputDevice, "containsUID:", a3);
}

- (MRAVOutputDevice)outputDevice
{
  return self->_outputDevice;
}

- (void).cxx_destruct
{
}

@end