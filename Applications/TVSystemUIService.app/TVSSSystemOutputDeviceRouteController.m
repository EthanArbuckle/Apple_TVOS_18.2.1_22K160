@interface TVSSSystemOutputDeviceRouteController
- (BOOL)hasExternalPickedRoutes;
- (BOOL)hasMultiplePickedRoutes;
- (BOOL)isSplitRoute;
- (MPAVEndpointRoute)_systemEndpointRoute;
- (MPAVEndpointRoute)systemEndpointRoute;
- (MPAVOutputDeviceRoute)primaryOutputDeviceRoute;
- (MPAVOutputDeviceRoute)secondaryOutputDeviceRoute;
- (MPAVOutputDeviceRoute)systemOutputDeviceRoute;
- (NSArray)selectedOutputDevices;
- (NSString)contentTitle;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)symbolNameForCurrentRoutes;
- (TVSSSystemOutputDeviceRouteController)init;
- (TVSSSystemOutputDeviceRouteController)initWithSystemEndpointRoute:(id)a3;
- (UIImage)contentImage;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_handleRouteDidChangeNotification;
- (void)_setSystemEndpointRoute:(id)a3;
- (void)_updateOutputDevicesWithReason:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation TVSSSystemOutputDeviceRouteController

- (NSString)contentTitle
{
  v7 = self;
  location[1] = (id)a2;
  if (-[TVSSSystemOutputDeviceRouteController isSplitRoute](self, "isSplitRoute"))
  {
    id v8 = TVSSLocString(@"TVSSAudioRoutingSharedTitle");
  }

  else if (-[TVSSSystemOutputDeviceRouteController hasMultiplePickedRoutes](v7, "hasMultiplePickedRoutes"))
  {
    id v8 = TVSSLocString(@"TVSSAudioRoutingMultipleTitle");
  }

  else
  {
    location[0] = -[TVSSSystemOutputDeviceRouteController primaryOutputDeviceRoute](v7, "primaryOutputDeviceRoute");
    char v4 = 0;
    BOOL v3 = 1;
    if (([location[0] isDeviceRoute] & 1) == 0)
    {
      id v5 = [location[0] routeName];
      char v4 = 1;
      BOOL v3 = [v5 length] == 0;
    }

    if ((v4 & 1) != 0) {

    }
    if (v3) {
      id v8 = TVSSLocString(@"TVSSAudioRoutingTitle");
    }
    else {
      id v8 = [location[0] routeName];
    }
    objc_storeStrong(location, 0LL);
  }

  return (NSString *)v8;
}

- (UIImage)contentImage
{
  if (!-[TVSSSystemOutputDeviceRouteController hasExternalPickedRoutes](self, "hasExternalPickedRoutes")) {
    return (UIImage *)  +[UIImage systemImageNamed:]( &OBJC_CLASS___UIImage,  "systemImageNamed:",  @"airplayaudio");
  }
  BOOL v3 = -[TVSSSystemOutputDeviceRouteController symbolNameForCurrentRoutes](self, "symbolNameForCurrentRoutes");
  id v5 = +[UIImage _systemImageNamed:](&OBJC_CLASS___UIImage, "_systemImageNamed:");

  return (UIImage *)v5;
}

- (TVSSSystemOutputDeviceRouteController)init
{
  v6 = self;
  v5[1] = (id)a2;
  v5[0] = +[MPAVRoutingController systemRoute](&OBJC_CLASS___MPAVRoutingController, "systemRoute");
  v2 = v6;
  v6 = 0LL;
  v6 = -[TVSSSystemOutputDeviceRouteController initWithSystemEndpointRoute:](v2, "initWithSystemEndpointRoute:", v5[0]);
  char v4 = v6;
  objc_storeStrong(v5, 0LL);
  objc_storeStrong((id *)&v6, 0LL);
  return v4;
}

- (TVSSSystemOutputDeviceRouteController)initWithSystemEndpointRoute:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v3 = v11;
  v11 = 0LL;
  v9.receiver = v3;
  v9.super_class = (Class)&OBJC_CLASS___TVSSSystemOutputDeviceRouteController;
  v11 = -[TVSSSystemOutputDeviceRouteController init](&v9, "init");
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    char v4 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v11->_observers;
    v11->_observers = v4;

    objc_storeStrong((id *)&v11->_systemEndpointRoute, location[0]);
    id v8 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v8,  "addObserver:selector:name:object:",  v11,  "_handleRouteDidChangeNotification",  MPAVRouteDidChangeNotification,  v11->_systemEndpointRoute);

    -[TVSSSystemOutputDeviceRouteController _updateOutputDevicesWithReason:]( v11,  "_updateOutputDevicesWithReason:",  @"Initial update");
  }

  v7 = v11;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v11, 0LL);
  return v7;
}

- (void)addObserver:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = objc_alloc_init(&OBJC_CLASS___TVSSSystemOutputDeviceRouteControllerObserverUserInfo);
  if ((objc_opt_respondsToSelector(location[0], "systemOutputDeviceRouteControllerDidUpdate:") & 1) != 0) {
    -[TVSSSystemOutputDeviceRouteControllerObserverUserInfo setRespondsToDidUpdate:](v5, "setRespondsToDidUpdate:", 1LL);
  }
  if ((objc_opt_respondsToSelector(location[0], "systemOutputDeviceRouteControllerDidChangeOutputDevices:") & 1) != 0) {
    -[TVSSSystemOutputDeviceRouteControllerObserverUserInfo setRespondsToDidChangeOutputDevices:]( v5,  "setRespondsToDidChangeOutputDevices:",  1LL);
  }
  id v3 = -[TVSObserverSet addObserver:userInfo:](v7->_observers, "addObserver:userInfo:", location[0], v5, &v5);
  objc_storeStrong(v4, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)removeObserver:(id)a3
{
  char v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSObserverSet removeObserver:](v4->_observers, "removeObserver:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (NSString)symbolNameForCurrentRoutes
{
  id location[2] = self;
  location[1] = (id)a2;
  char v4 = -[TVSSSystemOutputDeviceRouteController selectedOutputDevices](self, "selectedOutputDevices");
  location[0] =  +[MPAVRoutingController _symbolNameForRoutes:]( &OBJC_CLASS___MPAVRoutingController,  "_symbolNameForRoutes:");

  id v3 = location[0];
  objc_storeStrong(location, 0LL);
  return (NSString *)v3;
}

- (void)_handleRouteDidChangeNotification
{
  objc_super v9 = self;
  v8[1] = (id)a2;
  queue = &_dispatch_main_q;
  id v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_1000D03FC;
  v7 = &unk_1001B5A60;
  v8[0] = v9;
  dispatch_async(queue, &v3);

  objc_storeStrong(v8, 0LL);
}

- (void)_setSystemEndpointRoute:(id)a3
{
  int v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_systemEndpointRoute, location[0]);
  objc_storeStrong(location, 0LL);
}

- (MPAVEndpointRoute)_systemEndpointRoute
{
  return self->_systemEndpointRoute;
}

- (id)succinctDescription
{
  id v3 = -[TVSSSystemOutputDeviceRouteController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v13 = self;
  v12[1] = (id)a2;
  v12[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v3 = v12[0];
  int v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_1000D061C;
  objc_super v9 = &unk_1001B61C0;
  id v10 = v12[0];
  v11 = v13;
  objc_msgSend(v3, "appendBodySectionWithName:multilinePrefix:block:", &stru_1001BDAC8);
  id v4 = v12[0];
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(v12, 0LL);
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSSystemOutputDeviceRouteController descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v14 = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", v16);
  -[BSDescriptionBuilder setActiveMultilinePrefix:](v14, "setActiveMultilinePrefix:", location[0]);
  id v5 = v14;
  id v4 = location[0];
  int v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = sub_1000D08F8;
  v11 = &unk_1001B61C0;
  v12 = v14;
  v13 = v16;
  -[BSDescriptionBuilder appendBodySectionWithName:multilinePrefix:block:]( v5,  "appendBodySectionWithName:multilinePrefix:block:",  &stru_1001BDAC8,  v4);
  int v6 = v14;
  objc_storeStrong((id *)&v13, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong((id *)&v14, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (NSString)description
{
  return (NSString *)-[TVSSSystemOutputDeviceRouteController succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSSystemOutputDeviceRouteController descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (void)_updateOutputDevicesWithReason:(id)a3
{
  id v100 = self;
  SEL aSelector = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  BSDispatchQueueAssertMain();
  os_log_t oslog = (os_log_t)RouteControllerLog();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100016200( (uint64_t)v112,  (uint64_t)"-[TVSSSystemOutputDeviceRouteController _updateOutputDevicesWithReason:]",  (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, oslog, type, "%s: Starting update for reason: %{public}@", v112, 0x16u);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  id v42 = [*((id *)v100 + 3) endpointObject];
  id v95 = [v42 outputDevices];

  if (v95)
  {
    char v91 = 0;
    char v90 = *((_BYTE *)v100 + 16) & 1;
    uint64_t v85 = 0LL;
    v86 = &v85;
    int v87 = 0x20000000;
    int v88 = 32;
    char v89 = 0;
    v79 = _NSConcreteStackBlock;
    int v80 = -1073741824;
    int v81 = 0;
    v82 = sub_1000D1BFC;
    v83 = &unk_1001BA220;
    v84 = &v85;
    [v95 enumerateObjectsUsingBlock:&v79];
    if ((v86[3] & 1) != (*((_BYTE *)v100 + 17) & 1))
    {
      *((_BYTE *)v100 + 17) = v86[3] & 1;
      char v91 = 1;
    }

    BOOL v78 = (unint64_t)[v95 count] > 1;
    if (v78 != (*((_BYTE *)v100 + 18) & 1))
    {
      *((_BYTE *)v100 + 18) = v78;
      char v91 = 1;
    }

    if ([*((id *)v100 + 3) isSplitRoute])
    {
      if ([v95 count] != (id)2)
      {
        id v77 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"A split route should have two output devices");
        os_log_t v76 = &_os_log_default;
        os_log_type_t v75 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          v40 = NSStringFromSelector(aSelector);
          id v74 = v40;
          aClass = (objc_class *)objc_opt_class(v100);
          v39 = NSStringFromClass(aClass);
          id v73 = v39;
          sub_10000583C( (uint64_t)v110,  (uint64_t)v74,  (uint64_t)v73,  (uint64_t)v100,  (uint64_t)@"TVSSSystemOutputDeviceRouteController.m",  212,  (uint64_t)v77);
          _os_log_error_impl( (void *)&_mh_execute_header,  v76,  v75,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v110,  0x3Au);

          objc_storeStrong(&v73, 0LL);
          objc_storeStrong(&v74, 0LL);
        }

        objc_storeStrong((id *)&v76, 0LL);
        _bs_set_crash_log_message([v77 UTF8String]);
        __break(0);
        JUMPOUT(0x1000D104CLL);
      }

      if ((*((_BYTE *)v100 + 16) & 1) == 0)
      {
        *((_BYTE *)v100 + 16) = 1;
        char v91 = 1;
      }

      os_log_t v72 = (os_log_t)RouteControllerLog();
      os_log_type_t v71 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        sub_100074CCC( (uint64_t)v109,  (uint64_t)"-[TVSSSystemOutputDeviceRouteController _updateOutputDevicesWithReason:]",  v90 & 1);
        _os_log_impl( (void *)&_mh_execute_header,  v72,  v71,  "%s: System route is a split route. wasPreviouslySplitRoute=%{BOOL}d",  v109,  0x12u);
      }

      objc_storeStrong((id *)&v72, 0LL);
      v38 = objc_alloc(&OBJC_CLASS___MPAVOutputDeviceRoute);
      v37 = -[MPAVOutputDeviceRoute initWithOutputDevices:](v38, "initWithOutputDevices:", v95);
      id v3 = (void *)*((void *)v100 + 4);
      *((void *)v100 + 4) = v37;

      id v70 = (id)MRAVOutputDeviceCopyUniqueIdentifier([*((id *)v100 + 5) logicalLeaderOutputDevice]);
      id v36 = [v95 objectAtIndexedSubscript:0];
      id v69 = (id)MRAVOutputDeviceCopyUniqueIdentifier(v36);

      v35 = objc_alloc(&OBJC_CLASS___MPAVOutputDeviceRoute);
      id v34 = [v95 objectAtIndexedSubscript:0];
      id v108 = v34;
      v32 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v108, 1LL);
      v33 = -[MPAVOutputDeviceRoute initWithOutputDevices:](v35, "initWithOutputDevices:");
      id v4 = (void *)*((void *)v100 + 5);
      *((void *)v100 + 5) = v33;

      if (([v69 isEqualToString:v70] & 1) == 0)
      {
        os_log_t v68 = (os_log_t)RouteControllerLog();
        os_log_type_t v67 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          sub_100016194( (uint64_t)v107,  (uint64_t)"-[TVSSSystemOutputDeviceRouteController _updateOutputDevicesWithReason:]",  (uint64_t)v70,  (uint64_t)v69);
          _os_log_impl( (void *)&_mh_execute_header,  v68,  v67,  "%s: Primary route output device has changed. oldPrimaryOutputDeviceIdentifier=%{public}@, newPrimaryOutputDe viceIdentifier=%{public}@",  v107,  0x20u);
        }

        objc_storeStrong((id *)&v68, 0LL);
        char v91 = 1;
      }

      id v66 = (id)MRAVOutputDeviceCopyUniqueIdentifier([*((id *)v100 + 6) logicalLeaderOutputDevice]);
      id v31 = [v95 objectAtIndexedSubscript:1];
      id v65 = (id)MRAVOutputDeviceCopyUniqueIdentifier(v31);

      v30 = objc_alloc(&OBJC_CLASS___MPAVOutputDeviceRoute);
      id v29 = [v95 objectAtIndexedSubscript:1];
      id v106 = v29;
      v27 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v106, 1LL);
      v28 = -[MPAVOutputDeviceRoute initWithOutputDevices:](v30, "initWithOutputDevices:");
      id v5 = (void *)*((void *)v100 + 6);
      *((void *)v100 + 6) = v28;

      if (([v65 isEqualToString:v66] & 1) == 0)
      {
        os_log_t v64 = (os_log_t)RouteControllerLog();
        os_log_type_t v63 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          sub_100016194( (uint64_t)v105,  (uint64_t)"-[TVSSSystemOutputDeviceRouteController _updateOutputDevicesWithReason:]",  (uint64_t)v70,  (uint64_t)v69);
          _os_log_impl( (void *)&_mh_execute_header,  v64,  v63,  "%s: Secondary route output device has changed. oldPrimaryOutputDeviceIdentifier=%{public}@, newPrimaryOutput DeviceIdentifier=%{public}@",  v105,  0x20u);
        }

        objc_storeStrong((id *)&v64, 0LL);
        char v91 = 1;
      }

      objc_storeStrong(&v65, 0LL);
      objc_storeStrong(&v66, 0LL);
      objc_storeStrong(&v69, 0LL);
      objc_storeStrong(&v70, 0LL);
    }

    else
    {
      *((_BYTE *)v100 + 16) = 0;
      id v26 = [*((id *)v100 + 4) outputDevices];
      char v91 = ([v26 isEqualToArray:v95] ^ 1) & 1;

      v25 = objc_alloc(&OBJC_CLASS___MPAVOutputDeviceRoute);
      v24 = -[MPAVOutputDeviceRoute initWithOutputDevices:](v25, "initWithOutputDevices:", v95);
      int v6 = (void *)*((void *)v100 + 4);
      *((void *)v100 + 4) = v24;

      objc_storeStrong((id *)v100 + 5, *((id *)v100 + 4));
      objc_storeStrong((id *)v100 + 6, 0LL);
      os_log_t v62 = (os_log_t)RouteControllerLog();
      os_log_type_t v61 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        sub_1000D1C88( (uint64_t)v104,  (uint64_t)"-[TVSSSystemOutputDeviceRouteController _updateOutputDevicesWithReason:]",  v90 & 1,  v91 & 1);
        _os_log_impl( (void *)&_mh_execute_header,  v62,  v61,  "%s: System route is not a split route. wasPreviouslySplitRoute=%{BOOL}d, didChangeOutputDevices=%{BOOL}d",  v104,  0x18u);
      }

      objc_storeStrong((id *)&v62, 0LL);
    }

    id v60 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    memset(__b, 0, sizeof(__b));
    id obj = v95;
    id v23 = [obj countByEnumeratingWithState:__b objects:v103 count:16];
    if (v23)
    {
      uint64_t v19 = *(void *)__b[2];
      uint64_t v20 = 0LL;
      id v21 = v23;
      while (1)
      {
        uint64_t v18 = v20;
        if (*(void *)__b[2] != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v59 = *(void *)(__b[1] + 8 * v20);
        id v16 = v60;
        v17 = objc_alloc(&OBJC_CLASS___MPAVOutputDeviceRoute);
        uint64_t v102 = v59;
        v14 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v102, 1LL);
        v15 = -[MPAVOutputDeviceRoute initWithOutputDevices:](v17, "initWithOutputDevices:");
        [v16 addObject:v15];

        ++v20;
        if (v18 + 1 >= (unint64_t)v21)
        {
          uint64_t v20 = 0LL;
          id v21 = [obj countByEnumeratingWithState:__b objects:v103 count:16];
          if (!v21) {
            break;
          }
        }
      }
    }

    id v13 = [v60 copy];
    int v7 = (void *)*((void *)v100 + 7);
    *((void *)v100 + 7) = v13;

    if ((v91 & 1) != 0)
    {
      v12 = (void *)*((void *)v100 + 1);
      v52 = _NSConcreteStackBlock;
      int v53 = -1073741824;
      int v54 = 0;
      v55 = sub_1000D1CF4;
      v56 = &unk_1001BA248;
      id v57 = v100;
      [v12 enumerateObserversUsingBlock:&v52];
      objc_storeStrong(&v57, 0LL);
    }

    v11 = (void *)*((void *)v100 + 1);
    v46 = _NSConcreteStackBlock;
    int v47 = -1073741824;
    int v48 = 0;
    v49 = sub_1000D1EB0;
    v50 = &unk_1001BA248;
    id v51 = v100;
    [v11 enumerateObserversUsingBlock:&v46];
    os_log_t v45 = (os_log_t)RouteControllerLog();
    os_log_type_t v44 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = location;
      int v10 = v91 & 1;
      id v8 = [v100 succinctDescription];
      id v43 = v8;
      sub_1000BA788( (uint64_t)v101,  (uint64_t)"-[TVSSSystemOutputDeviceRouteController _updateOutputDevicesWithReason:]",  (uint64_t)v9,  v10,  (uint64_t)v43);
      _os_log_impl( (void *)&_mh_execute_header,  v45,  v44,  "%s: Finished update for reason: %{public}@. didChangeOutputDevices=%{BOOL}d, updatedState=%@",  v101,  0x26u);

      objc_storeStrong(&v43, 0LL);
    }

    objc_storeStrong((id *)&v45, 0LL);
    objc_storeStrong(&v51, 0LL);
    objc_storeStrong(&v60, 0LL);
    _Block_object_dispose(&v85, 8);
    int v92 = 0;
  }

  else
  {
    os_log_t v94 = (os_log_t)RouteControllerLog();
    os_log_type_t v93 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
    {
      sub_100014A50((uint64_t)v111, (uint64_t)"-[TVSSSystemOutputDeviceRouteController _updateOutputDevicesWithReason:]");
      _os_log_error_impl( (void *)&_mh_execute_header,  v94,  v93,  "%s: Nil output devices array returned from the system route endpoint. This is unexpected. Will bail from update",  v111,  0xCu);
    }

    objc_storeStrong((id *)&v94, 0LL);
    int v92 = 1;
  }

  objc_storeStrong(&v95, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (MPAVEndpointRoute)systemEndpointRoute
{
  return self->_systemEndpointRoute;
}

- (MPAVOutputDeviceRoute)systemOutputDeviceRoute
{
  return self->_systemOutputDeviceRoute;
}

- (MPAVOutputDeviceRoute)primaryOutputDeviceRoute
{
  return self->_primaryOutputDeviceRoute;
}

- (MPAVOutputDeviceRoute)secondaryOutputDeviceRoute
{
  return self->_secondaryOutputDeviceRoute;
}

- (NSArray)selectedOutputDevices
{
  return self->_selectedOutputDevices;
}

- (BOOL)isSplitRoute
{
  return self->_isSplitRoute;
}

- (BOOL)hasExternalPickedRoutes
{
  return self->_hasExternalPickedRoutes;
}

- (BOOL)hasMultiplePickedRoutes
{
  return self->_hasMultiplePickedRoutes;
}

- (void).cxx_destruct
{
}

@end