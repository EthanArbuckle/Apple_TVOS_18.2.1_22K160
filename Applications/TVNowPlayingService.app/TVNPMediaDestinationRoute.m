@interface TVNPMediaDestinationRoute
+ (BOOL)_availableStatusForMediaDestination:(id)a3;
+ (id)_imageForMediaDestination:(id)a3;
- (HMMediaDestination)mediaDestination;
- (TVNPMediaDestinationRoute)init;
- (id)description;
- (void)setMediaDestination:(id)a3;
- (void)updateWithMediaDestination:(id)a3 selectionState:(unint64_t)a4;
@end

@implementation TVNPMediaDestinationRoute

- (TVNPMediaDestinationRoute)init
{
  SEL v5 = a2;
  id v6 = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVNPMediaDestinationRoute;
  id v6 = -[TVNPRoute _init](&v4, "_init");
  objc_storeStrong(&v6, v6);
  v3 = (TVNPMediaDestinationRoute *)v6;
  objc_storeStrong(&v6, 0LL);
  return v3;
}

- (id)description
{
  v9 = self;
  SEL v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVNPMediaDestinationRoute;
  id v2 = -[TVNPMediaDestinationRoute description](&v7, "description");
  id v5 = v2;
  v3 = @"yes";
  if (!v9->super._available) {
    v3 = @"no";
  }
  id v6 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: HMMediaDestination: %@ available: %@",  v2,  v9->_mediaDestination,  v3);

  return v6;
}

- (void)updateWithMediaDestination:(id)a3 selectionState:(unint64_t)a4
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVNPMediaDestinationRoute willChangeValueForKey:](v17, "willChangeValueForKey:");
  -[TVNPMediaDestinationRoute willChangeValueForKey:](v17, "willChangeValueForKey:");
  -[TVNPMediaDestinationRoute willChangeValueForKey:](v17, "willChangeValueForKey:");
  -[TVNPMediaDestinationRoute willChangeValueForKey:](v17, "willChangeValueForKey:");
  -[TVNPMediaDestinationRoute willChangeValueForKey:](v17, "willChangeValueForKey:");
  -[TVNPMediaDestinationRoute willChangeValueForKey:](v17, "willChangeValueForKey:");
  objc_super v4 = (NSString *)[location[0] audioDestinationName];
  title = v17->super._title;
  v17->super._title = v4;

  id v6 = (void *)objc_opt_class(v17);
  objc_super v7 = (UIImage *)[v6 _imageForMediaDestination:location[0]];
  deviceImage = v17->super._deviceImage;
  v17->super._deviceImage = v7;

  BOOL v9 = [location[0] audioDestinationType] == (id)2;
  uint64_t v10 = 3LL;
  if (!v9) {
    uint64_t v10 = 2LL;
  }
  v17->super._deviceType = v10;
  v17->super._selectionState = a4;
  objc_storeStrong((id *)&v17->_mediaDestination, location[0]);
  v11 = (NSString *)[location[0] audioDestinationIdentifier];
  routeUID = v17->super._routeUID;
  v17->super._routeUID = v11;

  v13 = (void *)objc_opt_class(v17);
  unsigned __int8 v14 = [v13 _availableStatusForMediaDestination:location[0]];
  v17->super._available = v14 & 1;
  -[TVNPMediaDestinationRoute didChangeValueForKey:](v17, "didChangeValueForKey:", @"title");
  -[TVNPMediaDestinationRoute didChangeValueForKey:](v17, "didChangeValueForKey:", @"deviceType");
  -[TVNPMediaDestinationRoute didChangeValueForKey:](v17, "didChangeValueForKey:", @"selectionState");
  -[TVNPMediaDestinationRoute didChangeValueForKey:](v17, "didChangeValueForKey:", @"routeUID");
  -[TVNPMediaDestinationRoute didChangeValueForKey:](v17, "didChangeValueForKey:", @"mediaDestination");
  -[TVNPMediaDestinationRoute didChangeValueForKey:](v17, "didChangeValueForKey:", @"available");
  objc_storeStrong(location, 0LL);
}

+ (BOOL)_availableStatusForMediaDestination:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v25 = 1;
  id v17 = location[0];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___HMMediaSystem);
  if ((objc_opt_isKindOfClass(v17, v3) & 1) != 0)
  {
    id v24 = location[0];
    memset(__b, 0, sizeof(__b));
    id obj = [v24 components];
    id v16 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
    if (v16)
    {
      uint64_t v12 = *(void *)__b[2];
      uint64_t v13 = 0LL;
      id v14 = v16;
      while (1)
      {
        uint64_t v11 = v13;
        if (*(void *)__b[2] != v12) {
          objc_enumerationMutation(obj);
        }
        id v23 = *(id *)(__b[1] + 8 * v13);
        id v9 = [v23 mediaProfile];
        id v21 = [v9 accessory];

        char v19 = 0;
        unsigned __int8 v10 = 0;
        if ((v25 & 1) != 0)
        {
          id v20 = [v21 settings];
          char v19 = 1;
          unsigned __int8 v10 = [v20 isControllable];
        }

        char v25 = v10 & 1;
        if ((v19 & 1) != 0) {

        }
        objc_storeStrong(&v21, 0LL);
        ++v13;
        if (v11 + 1 >= (unint64_t)v14)
        {
          uint64_t v13 = 0LL;
          id v14 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
          if (!v14) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&v24, 0LL);
  }

  else
  {
    id v8 = location[0];
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___HMAccessory);
    if ((objc_opt_isKindOfClass(v8, v4) & 1) != 0)
    {
      id v18 = location[0];
      id v7 = [v18 settings];
      char v25 = [v7 isControllable] & 1;

      objc_storeStrong(&v18, 0LL);
    }
  }

  char v6 = v25;
  objc_storeStrong(location, 0LL);
  return v6 & 1;
}

+ (id)_imageForMediaDestination:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = location[0];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___HMAccessory);
  if ((objc_opt_isKindOfClass(v14, v3) & 1) != 0)
  {
    id v25 = location[0];
    id v24 = [v25 homePodVariant];
    if (v24 == (id)1 || v24 == (id)3)
    {
      id v27 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"homepod.fill");
      int v23 = 1;
    }

    else if (v24 == (id)2)
    {
      id v27 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"homepodmini.fill");
      int v23 = 1;
    }

    else
    {
      id v22 = (id)TVCSHomeLog();
      char v21 = 17;
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_FAULT))
      {
        log = (os_log_s *)v22;
        os_log_type_t type = v21;
        sub_100005DD0(v20);
        _os_log_fault_impl( (void *)&_mh_execute_header,  log,  type,  "Icon requested for unknown HomePod variant",  v20,  2u);
      }

      objc_storeStrong(&v22, 0LL);
      id v27 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"homepod.fill");
      int v23 = 1;
    }

    objc_storeStrong(&v25, 0LL);
  }

  else
  {
    id v11 = location[0];
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___HMMediaSystem);
    if ((objc_opt_isKindOfClass(v11, v4) & 1) != 0)
    {
      id v10 = [location[0] components];
      id v9 = [v10 firstObject];
      id v8 = [v9 mediaProfile];
      id v19 = [v8 accessory];

      id v18 = [v19 homePodVariant];
      if (v18 == (id)1 || v18 == (id)3)
      {
        id v27 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"homepod.2.fill");
        int v23 = 1;
      }

      else if (v18 == (id)2)
      {
        id v27 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"homepodmini.2.fill");
        int v23 = 1;
      }

      else
      {
        os_log_t oslog = (os_log_t)(id)TVCSHomeLog();
        os_log_type_t v16 = OS_LOG_TYPE_FAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
        {
          char v6 = oslog;
          os_log_type_t v7 = v16;
          sub_100005DD0(v15);
          _os_log_fault_impl((void *)&_mh_execute_header, v6, v7, "Icon requested for unknown HomePod variant", v15, 2u);
        }

        objc_storeStrong((id *)&oslog, 0LL);
        id v27 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"homepod.2.fill");
        int v23 = 1;
      }

      objc_storeStrong(&v19, 0LL);
    }

    else
    {
      id v27 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"homepod.2.fill");
      int v23 = 1;
    }
  }

  objc_storeStrong(location, 0LL);
  return v27;
}

- (HMMediaDestination)mediaDestination
{
  return self->_mediaDestination;
}

- (void)setMediaDestination:(id)a3
{
}

- (void).cxx_destruct
{
}

@end