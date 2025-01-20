@interface TVNPGroupableRoutingController
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)allowsDestinationSelection;
- (BOOL)allowsRetargeting;
- (BOOL)isLocalRouteAVR;
- (BOOL)multipleSelectionEnabled;
- (BOOL)needsAvailableRoutesUpdate;
- (BOOL)wantsVolumeUpdates;
- (HMMediaDestinationController)homeDestinationController;
- (MPAVEndpointRoutingDataSource)endpointRoutingDataSource;
- (MPAVOutputDeviceRoutingDataSource)outputDeviceRoutingDataSource;
- (MPAVRoutingController)endpointRoutingController;
- (MPAVRoutingController)outputDeviceRoutingController;
- (NSArray)allEndpoints;
- (NSArray)allOutputDevices;
- (NSArray)appleHeadsets;
- (NSArray)availableDestinations;
- (NSArray)availableRoutes;
- (NSArray)availableRoutesAndGroups;
- (NSArray)currentRoutes;
- (NSArray)eligibleOdeonRoutes;
- (NSMutableDictionary)endpointIdentifiersToDestinations;
- (NSMutableDictionary)groupIdentifiersToGroups;
- (NSMutableDictionary)mediaDestinationIdentifiersToRoutes;
- (NSMutableDictionary)outputDeviceIdentifiersToRoutes;
- (NSString)currentEndpointRouteUID;
- (NSString)localRouteIdentifier;
- (NSString)outputContextUID;
- (NSString)pendingSelectedMediaDestination;
- (NSString)placeholderRouteIdentifier;
- (NSString)selectedMediaDestinationIdentifier;
- (NSString)systemOutputRouteName;
- (OS_dispatch_queue)updateQueue;
- (PBSMediaRemoteServiceInterface)pbsMediaRemoteProxy;
- (TVCSHomeManager)homeManager;
- (TVNPGroupableRoutingController)init;
- (TVNPGroupableRoutingController)initWithOutputContextUID:(id)a3 allowsRetargeting:(BOOL)a4;
- (TVNPGroupableRoutingController)initWithOutputContextUID:(id)a3 allowsRetargeting:(BOOL)a4 initalFetchCompletion:(id)a5;
- (TVNPRoutingDestination)currentDestination;
- (id)_endpointRoutesWithForcedLocalRoute:(id)a3;
- (int64_t)numberOfExternalRoutesInLocalDestination;
- (unint64_t)discoveryMode;
- (unint64_t)numberOfUpdates;
- (void)_setNeedsDisplayedRoutesUpdate;
- (void)_updateAllowsDestinationSelection;
- (void)_updateAvailableRoutes;
- (void)_updateWithAvailableEndpoints:(id)a3 outputDevices:(id)a4;
- (void)_updateWithAvailableMediaDestinations:(id)a3;
- (void)accessoryDidUpdateControllable:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pickRoutes:(id)a3 forDestination:(id)a4;
- (void)routingController:(id)a3 pickedRouteDidChange:(id)a4;
- (void)routingControllerAvailableRoutesDidChange:(id)a3;
- (void)selectOdeonDestination:(id)a3;
- (void)setAllowsRetargeting:(BOOL)a3;
- (void)setCurrentDestination:(id)a3;
- (void)setDiscoveryMode:(unint64_t)a3;
- (void)setOutputContextUID:(id)a3;
- (void)setPendingSelectedMediaDestination:(id)a3;
- (void)setSelectedMediaDestinationIdentifier:(id)a3;
- (void)setWantsVolumeUpdates:(BOOL)a3;
- (void)targetDestination:(id)a3;
- (void)unpickRoutes:(id)a3 forDestination:(id)a4;
@end

@implementation TVNPGroupableRoutingController

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v7 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] isEqualToString:@"currentDestination"])
  {
    char v8 = 0;
  }

  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)&OBJC_METACLASS___TVNPGroupableRoutingController;
    char v8 = objc_msgSendSuper2(&v4, "automaticallyNotifiesObserversForKey:", location[0]) & 1;
  }

  int v5 = 1;
  objc_storeStrong(location, 0LL);
  return v8 & 1;
}

- (TVNPGroupableRoutingController)init
{
  objc_super v4 = 0LL;
  objc_super v4 = -[TVNPGroupableRoutingController initWithOutputContextUID:allowsRetargeting:]( self,  "initWithOutputContextUID:allowsRetargeting:");
  v3 = v4;
  objc_storeStrong((id *)&v4, 0LL);
  return v3;
}

- (TVNPGroupableRoutingController)initWithOutputContextUID:(id)a3 allowsRetargeting:(BOOL)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_super v4 = v9;
  v9 = 0LL;
  v9 = -[TVNPGroupableRoutingController initWithOutputContextUID:allowsRetargeting:initalFetchCompletion:]( v4,  "initWithOutputContextUID:allowsRetargeting:initalFetchCompletion:",  location[0],  a4,  0LL);
  id v7 = v9;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  return v7;
}

- (TVNPGroupableRoutingController)initWithOutputContextUID:(id)a3 allowsRetargeting:(BOOL)a4 initalFetchCompletion:(id)a5
{
  id v73 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v71 = a4;
  id v70 = 0LL;
  objc_storeStrong(&v70, a5);
  id v5 = v73;
  id v73 = 0LL;
  v69.receiver = v5;
  v69.super_class = (Class)&OBJC_CLASS___TVNPGroupableRoutingController;
  obj = -[TVNPGroupableRoutingController init](&v69, "init");
  id v73 = obj;
  objc_storeStrong(&v73, obj);
  if (obj)
  {
    v75 = (dispatch_once_t *)&unk_5F8E0;
    id v74 = 0LL;
    objc_storeStrong(&v74, &stru_50AC0);
    if (*v75 != -1) {
      dispatch_once(v75, v74);
    }
    objc_storeStrong(&v74, 0LL);
    *((_BYTE *)v73 + 12) = 1;
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.TVNowPlayingService.TVNPGroupableRoutingController", 0LL);
    id v7 = (void *)*((void *)v73 + 31);
    *((void *)v73 + 31) = v6;

    id v49 = +[PBSSystemServiceConnection sharedConnection](&OBJC_CLASS___PBSSystemServiceConnection, "sharedConnection");
    id v8 = [v49 mediaRemoteServiceProxy];
    v9 = (void *)*((void *)v73 + 14);
    *((void *)v73 + 14) = v8;

    [*((id *)v73 + 14) addObserver:v73 forKeyPath:@"volumeControlTargetDeviceType" options:4 context:off_5F410];
    v10 = +[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance");
    v11 = (void *)*((void *)v73 + 19);
    *((void *)v73 + 19) = v10;

    [*((id *)v73 + 19) reloadHomeConfiguration];
    v48 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v12 = (void *)*((void *)v73 + 20);
    *((void *)v73 + 20) = v48;

    v47 = objc_alloc_init(&OBJC_CLASS___NSArray);
    v13 = (void *)*((void *)v73 + 11);
    *((void *)v73 + 11) = v47;

    v46 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
    v14 = -[NSUUID UUIDString](v46, "UUIDString");
    v15 = (void *)*((void *)v73 + 21);
    *((void *)v73 + 21) = v14;

    v45 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
    v16 = -[NSUUID UUIDString](v45, "UUIDString");
    v17 = (void *)*((void *)v73 + 22);
    *((void *)v73 + 22) = v16;

    [*((id *)v73 + 19) addObserver:v73 forKeyPath:@"localAccessory" options:4 context:off_5F418];
    v44 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v18 = (void *)*((void *)v73 + 25);
    *((void *)v73 + 25) = v44;

    v43 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v19 = (void *)*((void *)v73 + 26);
    *((void *)v73 + 26) = v43;

    v42 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v20 = (void *)*((void *)v73 + 27);
    *((void *)v73 + 27) = v42;

    objc_storeStrong((id *)v73 + 6, 0LL);
    objc_storeStrong((id *)v73 + 2, &__NSArray0__struct);
    v41 = objc_alloc_init(&OBJC_CLASS___NSArray);
    v21 = (void *)*((void *)v73 + 7);
    *((void *)v73 + 7) = v41;

    v40 = objc_alloc_init(&OBJC_CLASS___NSArray);
    v22 = (void *)*((void *)v73 + 3);
    *((void *)v73 + 3) = v40;

    v39 = objc_alloc_init(&OBJC_CLASS___NSArray);
    v23 = (void *)*((void *)v73 + 4);
    *((void *)v73 + 4) = v39;

    v38 = objc_alloc_init(&OBJC_CLASS___MPAVEndpointRoutingDataSource);
    v24 = (void *)*((void *)v73 + 15);
    *((void *)v73 + 15) = v38;

    v37 = -[MPAVRoutingController initWithDataSource:name:]( objc_alloc(&OBJC_CLASS___MPAVRoutingController),  "initWithDataSource:name:",  *((void *)v73 + 15),  @"TVNP-Endpoint");
    v25 = (void *)*((void *)v73 + 17);
    *((void *)v73 + 17) = v37;

    uint64_t SharedAudioPresentationContext = MRAVOutputContextGetSharedAudioPresentationContext([*((id *)v73 + 17) setDelegate:v73]);
    id v68 = (id)MRAVOutputContextGetUniqueIdentifier(SharedAudioPresentationContext);
    v35 = objc_alloc_init(&OBJC_CLASS___MPAVOutputDeviceRoutingDataSource);
    v26 = (void *)*((void *)v73 + 16);
    *((void *)v73 + 16) = v35;

    [*((id *)v73 + 16) setRoutingContextUID:v68];
    v34 = -[MPAVRoutingController initWithDataSource:name:]( objc_alloc(&OBJC_CLASS___MPAVRoutingController),  "initWithDataSource:name:",  *((void *)v73 + 16),  @"TVNP-OutputDevice");
    v27 = (void *)*((void *)v73 + 18);
    *((void *)v73 + 18) = v34;

    [*((id *)v73 + 18) setDelegate:v73];
    id v33 = [v68 copy];
    v28 = (void *)*((void *)v73 + 12);
    *((void *)v73 + 12) = v33;

    id v67 = +[AVAudioSession auxiliarySession](&OBJC_CLASS___AVAudioSession, "auxiliarySession");
    id v66 = 0LL;
    id v64 = 0LL;
    unsigned __int8 v32 = [v67 setCategory:AVAudioSessionCategoryPlayback error:&v64];
    objc_storeStrong(&v66, v64);
    char v65 = v32 & 1;
    if ((v32 & 1) == 0)
    {
      id v63 = (id)qword_5F8E8;
      os_log_type_t v62 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_ERROR))
      {
        sub_1225C((uint64_t)v76, (uint64_t)v66);
        _os_log_error_impl( &dword_0,  (os_log_t)v63,  v62,  "Failed to select playback category on auxiliary context. %{public}@",  v76,  0xCu);
      }

      objc_storeStrong(&v63, 0LL);
    }

    unsigned int v61 = [v67 opaqueSessionID];
    [*((id *)v73 + 16) setTargetSessionID:v61];
    *((_BYTE *)v73 + 9) = v71;
    *((_BYTE *)v73 + 8) = [*((id *)v73 + 12) isEqual:v68] & 1;
    *((void *)v73 + 8) = 2LL;
    [*((id *)v73 + 17) setDiscoveryMode:3];
    [*((id *)v73 + 18) setDiscoveryMode:3];
    objc_initWeak(&from, v73);
    v31 = (void *)*((void *)v73 + 17);
    v53 = _NSConcreteStackBlock;
    int v54 = -1073741824;
    int v55 = 0;
    v56 = sub_1229C;
    v57 = &unk_50AE8;
    id v58 = v70;
    objc_copyWeak(&v59, &from);
    [v31 fetchAvailableRoutesWithCompletionHandler:&v53];
    [v73 _updateAvailableRoutes];
    objc_destroyWeak(&v59);
    objc_storeStrong(&v58, 0LL);
    objc_destroyWeak(&from);
    objc_storeStrong(&v66, 0LL);
    objc_storeStrong(&v67, 0LL);
    objc_storeStrong(&v68, 0LL);
  }

  v30 = (TVNPGroupableRoutingController *)v73;
  objc_storeStrong(&v70, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v73, 0LL);
  return v30;
}

- (void)dealloc
{
  objc_super v4 = self;
  SEL v3 = a2;
  -[TVCSHomeManager removeObserver:forKeyPath:context:]( self->_homeManager,  "removeObserver:forKeyPath:context:",  self,  @"localAccessory",  off_5F418);
  -[PBSMediaRemoteServiceInterface removeObserver:forKeyPath:context:]( v4->_pbsMediaRemoteProxy,  "removeObserver:forKeyPath:context:",  v4,  @"volumeControlTargetDeviceType",  off_5F410);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVNPGroupableRoutingController;
  -[TVNPGroupableRoutingController dealloc](&v2, "dealloc");
}

- (void)setCurrentDestination:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v14->_currentDestination != location[0])
  {
    -[TVNPGroupableRoutingController willChangeValueForKey:](v14, "willChangeValueForKey:");
    -[TVNPRoutingDestination setIsCurrentDestination:](v14->_currentDestination, "setIsCurrentDestination:", 0LL);
    objc_storeStrong((id *)&v14->_currentDestination, location[0]);
    -[TVNPRoutingDestination setIsCurrentDestination:](v14->_currentDestination, "setIsCurrentDestination:", 1LL);
    -[TVNPGroupableRoutingController didChangeValueForKey:](v14, "didChangeValueForKey:", @"currentDestination");
    id v8 = location[0];
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVNPEndpointRoutingDestination);
    char v10 = 0;
    if ((objc_opt_isKindOfClass(v8, v3) & 1) != 0)
    {
      id v11 = [location[0] endpointRoute];
      char v10 = 1;
      id v4 = v11;
    }

    else
    {
      id v4 = 0LL;
    }

    id v12 = v4;
    if ((v10 & 1) != 0) {

    }
    os_log_t oslog = (os_log_t)(id)qword_5F8E8;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_126C0((uint64_t)v15, (uint64_t)v12);
      _os_log_impl(&dword_0, oslog, OS_LOG_TYPE_DEFAULT, "Setting current destination to %@", v15, 0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    if (v14->_multipleSelectionEnabled) {
      -[MPAVOutputDeviceRoutingDataSource setEndpointRoute:]( v14->_outputDeviceRoutingDataSource,  "setEndpointRoute:",  v12);
    }
    id v7 = [v12 routeUID];
    id v5 = (NSString *)[v7 copy];
    currentEndpointRouteUID = v14->_currentEndpointRouteUID;
    v14->_currentEndpointRouteUID = v5;

    -[TVNPGroupableRoutingController _updateWithAvailableEndpoints:outputDevices:]( v14,  "_updateWithAvailableEndpoints:outputDevices:",  v14->_allEndpoints,  v14->_allOutputDevices);
    -[TVNPGroupableRoutingController _updateAvailableRoutes](v14, "_updateAvailableRoutes");
    objc_storeStrong(&v12, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setOutputContextUID:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = [location[0] isEqual:v11->_outputContextUID];
  if ((v3 & 1) == 0)
  {
    uint64_t SharedAudioPresentationContext = MRAVOutputContextGetSharedAudioPresentationContext(v3);
    id v9 = (id)MRAVOutputContextGetUniqueIdentifier(SharedAudioPresentationContext);
    if (location[0]) {
      id v5 = location[0];
    }
    else {
      id v5 = v9;
    }
    id v8 = v5;
    -[MPAVOutputDeviceRoutingDataSource setRoutingContextUID:]( v11->_outputDeviceRoutingDataSource,  "setRoutingContextUID:",  v5);
    dispatch_queue_t v6 = (NSString *)[v8 copy];
    outputContextUID = v11->_outputContextUID;
    v11->_outputContextUID = v6;

    -[TVNPGroupableRoutingController _updateAllowsDestinationSelection](v11, "_updateAllowsDestinationSelection");
    -[TVNPGroupableRoutingController _updateAvailableRoutes](v11, "_updateAvailableRoutes");
    objc_storeStrong(&v8, 0LL);
    objc_storeStrong(&v9, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setAllowsRetargeting:(BOOL)a3
{
  if (self->_allowsRetargeting != a3)
  {
    self->_allowsRetargeting = a3;
    -[TVNPGroupableRoutingController _updateAllowsDestinationSelection](self, "_updateAllowsDestinationSelection");
    -[TVNPGroupableRoutingController _updateAvailableRoutes](self, "_updateAvailableRoutes");
  }

- (void)setWantsVolumeUpdates:(BOOL)a3
{
  if (self->_wantsVolumeUpdates != a3)
  {
    self->_wantsVolumeUpdates = a3;
    -[TVNPGroupableRoutingController _updateAvailableRoutes](self, "_updateAvailableRoutes");
  }

- (void)_updateAllowsDestinationSelection
{
  id v8 = self;
  v7[1] = (id)a2;
  uint64_t SharedAudioPresentationContext = MRAVOutputContextGetSharedAudioPresentationContext(self);
  v7[0] = (id)MRAVOutputContextGetUniqueIdentifier(SharedAudioPresentationContext);
  outputContextUID = v8->_outputContextUID;
  if (outputContextUID) {
    id v3 = outputContextUID;
  }
  else {
    id v3 = (NSString *)v7[0];
  }
  id location = v3;
  -[MPAVOutputDeviceRoutingDataSource setRoutingContextUID:]( v8->_outputDeviceRoutingDataSource,  "setRoutingContextUID:",  v3);
  unsigned __int8 v4 = 0;
  if (v8->_allowsRetargeting) {
    unsigned __int8 v4 = [location isEqual:v7[0]];
  }
  v8->_allowsDestinationSelection = v4 & 1;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v7, 0LL);
}

- (void)pickRoutes:(id)a3 forDestination:(id)a4
{
  v97 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v95 = 0LL;
  objc_storeStrong(&v95, a4);
  id v94 = -[MPAVRoutingController pickedRoutes](v97->_outputDeviceRoutingController, "pickedRoutes");
  id v93 = -[MPAVRoutingController pendingPickedRoutes](v97->_outputDeviceRoutingController, "pendingPickedRoutes");
  BOOL multipleSelectionEnabled = 0;
  if ((-[MPAVRoutingController supportsMultipleSelection]( v97->_outputDeviceRoutingController,  "supportsMultipleSelection") & 1) != 0) {
    BOOL multipleSelectionEnabled = v97->_multipleSelectionEnabled;
  }
  BOOL v92 = multipleSelectionEnabled;
  char v89 = 0;
  char v87 = 0;
  unsigned __int8 v48 = 1;
  if ((unint64_t)[v94 count] <= 1)
  {
    id v90 = [v94 firstObject];
    char v89 = 1;
    unsigned __int8 v48 = 1;
    if (([v90 supportsGrouping] & 1) == 0)
    {
      id v88 = [v93 anyObject];
      char v87 = 1;
      unsigned __int8 v48 = [v88 supportsGrouping];
    }
  }

  if ((v87 & 1) != 0) {

  }
  if ((v89 & 1) != 0) {
  char v91 = v48 & 1;
  }
  v45 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v86 = -[NSMutableArray initWithCapacity:](v45, "initWithCapacity:", [location[0] count]);
  memset(__b, 0, sizeof(__b));
  id v46 = location[0];
  id v47 = [v46 countByEnumeratingWithState:__b objects:v105 count:16];
  if (v47)
  {
    uint64_t v42 = *(void *)__b[2];
    uint64_t v43 = 0LL;
    id v44 = v47;
    while (1)
    {
      uint64_t v41 = v43;
      if (*(void *)__b[2] != v42) {
        objc_enumerationMutation(v46);
      }
      id v85 = *(id *)(__b[1] + 8 * v43);
      id v40 = v85;
      uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVNPOutputDeviceRoute);
      if ((objc_opt_isKindOfClass(v40, v4) & 1) != 0)
      {
        id v83 = v85;
        id v39 = [v83 outputDeviceRoute];

        if (v39)
        {
          id v37 = v86;
          id v38 = [v83 outputDeviceRoute];
          objc_msgSend(v37, "addObject:");
        }

        else
        {
          os_log_t oslog = (os_log_t)(id)qword_5F8E8;
          os_log_type_t type = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            log = oslog;
            os_log_type_t v36 = type;
            sub_126C0((uint64_t)v104, (uint64_t)v83);
            _os_log_error_impl( &dword_0,  log,  v36,  "TVNPOutputDeviceRoute picked with no MPAVOutputDeviceRoute %@",  v104,  0xCu);
          }

          objc_storeStrong((id *)&oslog, 0LL);
        }

        objc_storeStrong(&v83, 0LL);
      }

      else
      {
        os_log_t v80 = (os_log_t)(id)qword_5F8E8;
        os_log_type_t v79 = OS_LOG_TYPE_FAULT;
        if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
        {
          v34 = v80;
          sub_126C0((uint64_t)v103, (uint64_t)v85);
          _os_log_fault_impl(&dword_0, v34, v79, "Unexpected route in pickRoutes: %@", v103, 0xCu);
        }

        objc_storeStrong((id *)&v80, 0LL);
      }

      ++v43;
      if (v41 + 1 >= (unint64_t)v44)
      {
        uint64_t v43 = 0LL;
        id v44 = [v46 countByEnumeratingWithState:__b objects:v105 count:16];
        if (!v44) {
          break;
        }
      }
    }
  }

  id v78 = [v86 firstObject];
  id v77 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  memset(v75, 0, sizeof(v75));
  id v32 = v86;
  id v33 = [v32 countByEnumeratingWithState:v75 objects:v102 count:16];
  if (v33)
  {
    uint64_t v29 = *(void *)v75[2];
    uint64_t v30 = 0LL;
    id v31 = v33;
    while (1)
    {
      uint64_t v28 = v30;
      if (*(void *)v75[2] != v29) {
        objc_enumerationMutation(v32);
      }
      id v76 = *(id *)(v75[1] + 8 * v30);
      if ([v76 isClusterRoute])
      {
        memset(v73, 0, sizeof(v73));
        id v26 = [v76 clusterComposition];
        id v27 = [v26 countByEnumeratingWithState:v73 objects:v101 count:16];
        if (v27)
        {
          uint64_t v23 = *(void *)v73[2];
          uint64_t v24 = 0LL;
          id v25 = v27;
          while (1)
          {
            uint64_t v22 = v24;
            if (*(void *)v73[2] != v23) {
              objc_enumerationMutation(v26);
            }
            id v74 = *(id *)(v73[1] + 8 * v24);
            id v20 = v77;
            id v21 = [v74 uid];
            objc_msgSend(v20, "addObject:");

            ++v24;
            if (v22 + 1 >= (unint64_t)v25)
            {
              uint64_t v24 = 0LL;
              id v25 = [v26 countByEnumeratingWithState:v73 objects:v101 count:16];
              if (!v25) {
                break;
              }
            }
          }
        }
      }

      else
      {
        id v18 = v77;
        id v19 = [v76 routeUID];
        objc_msgSend(v18, "addObject:");
      }

      ++v30;
      if (v28 + 1 >= (unint64_t)v31)
      {
        uint64_t v30 = 0LL;
        id v31 = [v32 countByEnumeratingWithState:v75 objects:v102 count:16];
        if (!v31) {
          break;
        }
      }
    }
  }

  v13 = -[TVNPGroupableRoutingController homeManager](v97, "homeManager");
  id v72 = -[TVCSHomeManager localAccessory](v13, "localAccessory");

  id v15 = [v72 room];
  id v14 = [v15 hmRoom];
  id v71 = [v14 accessories];

  id v16 = v71;
  id v64 = _NSConcreteStackBlock;
  int v65 = -1073741824;
  int v66 = 0;
  id v67 = sub_137A0;
  id v68 = &unk_50B10;
  id v69 = v77;
  BOOL v70 = [v16 indexOfObjectPassingTest:&v64] != (id)0x7FFFFFFFFFFFFFFFLL;
  char v61 = 0;
  char v59 = 0;
  BOOL v17 = 0;
  if (v72)
  {
    BOOL v17 = 0;
    if (v70)
    {
      id v62 = [v94 firstObject];
      char v61 = 1;
      BOOL v17 = 0;
      if ([v62 isDeviceRoute])
      {
        id v60 = [v94 firstObject];
        char v59 = 1;
        BOOL v17 = 0;
      }
    }
  }

  if ((v59 & 1) != 0) {

  }
  if ((v61 & 1) != 0) {
  BOOL v63 = v17;
  }
  os_log_t v58 = (os_log_t)(id)qword_5F8E8;
  os_log_type_t v57 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    sub_1386C((uint64_t)v100, v91 & 1, v92, v70, v63);
    _os_log_impl( &dword_0,  v58,  v57,  "ShouldUseGrouping: %d CanUseGrouping: %d RouteIsInRoom: %d AlwaysPickRatherThanAdd: %d",  v100,  0x1Au);
  }

  objc_storeStrong((id *)&v58, 0LL);
  if (([v78 supportsGrouping] & 1) != 0 && v92 && (v91 & 1) != 0 && !v63)
  {
    os_log_t v56 = (os_log_t)(id)qword_5F8E8;
    os_log_type_t v55 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      char v10 = v56;
      os_log_type_t v11 = v55;
      id v9 = v86;
      id v12 = -[MPAVOutputDeviceRoutingDataSource endpointRoute](v97->_outputDeviceRoutingDataSource, "endpointRoute");
      id v54 = v12;
      sub_138DC((uint64_t)v99, (uint64_t)v9, (uint64_t)v54);
      _os_log_impl(&dword_0, v10, v11, "Add Picked Route: %{public}@ to Endpoint: %{public}@", v99, 0x16u);

      objc_storeStrong(&v54, 0LL);
    }

    objc_storeStrong((id *)&v56, 0LL);
    -[MPAVRoutingController selectRoutes:operation:completion:]( v97->_outputDeviceRoutingController,  "selectRoutes:operation:completion:",  v86,  1LL,  &stru_50B50);
  }

  else
  {
    os_log_t v53 = (os_log_t)(id)qword_5F8E8;
    os_log_type_t v52 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v6 = v53;
      os_log_type_t v7 = v52;
      id v5 = v86;
      id v8 = -[MPAVOutputDeviceRoutingDataSource endpointRoute](v97->_outputDeviceRoutingDataSource, "endpointRoute");
      id v51 = v8;
      sub_138DC((uint64_t)v98, (uint64_t)v5, (uint64_t)v51);
      _os_log_impl(&dword_0, v6, v7, "Set Picked Route: %{public}@ for Endpoint: %{public}@", v98, 0x16u);

      objc_storeStrong(&v51, 0LL);
    }

    objc_storeStrong((id *)&v53, 0LL);
    -[MPAVRoutingController selectRoutes:operation:completion:]( v97->_outputDeviceRoutingController,  "selectRoutes:operation:completion:",  v86,  0LL,  &stru_50B70);
  }

  -[TVNPGroupableRoutingController _updateWithAvailableEndpoints:outputDevices:]( v97,  "_updateWithAvailableEndpoints:outputDevices:",  v97->_allEndpoints,  v97->_allOutputDevices);
  objc_storeStrong(&v69, 0LL);
  objc_storeStrong(&v71, 0LL);
  objc_storeStrong(&v72, 0LL);
  objc_storeStrong(&v77, 0LL);
  objc_storeStrong(&v78, 0LL);
  objc_storeStrong(&v86, 0LL);
  objc_storeStrong(&v93, 0LL);
  objc_storeStrong(&v94, 0LL);
  objc_storeStrong(&v95, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)unpickRoutes:(id)a3 forDestination:(id)a4
{
  uint64_t v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v21 = 0LL;
  objc_storeStrong(&v21, a4);
  id v20 = -[MPAVRoutingController pickedRoutes](v23->_outputDeviceRoutingController, "pickedRoutes");
  BOOL multipleSelectionEnabled = 0;
  if ((-[MPAVRoutingController supportsMultipleSelection]( v23->_outputDeviceRoutingController,  "supportsMultipleSelection") & 1) != 0) {
    BOOL multipleSelectionEnabled = v23->_multipleSelectionEnabled;
  }
  BOOL v19 = multipleSelectionEnabled;
  char v16 = 0;
  unsigned __int8 v7 = 1;
  if ((unint64_t)[v20 count] <= 1)
  {
    id v17 = [v20 firstObject];
    char v16 = 1;
    unsigned __int8 v7 = [v17 supportsGrouping];
  }

  if ((v16 & 1) != 0) {

  }
  char v18 = v7 & 1;
  id v15 = [location[0] firstObject];
  id v14 = [location[0] valueForKey:@"outputDeviceRoute"];
  id v13 = [v14 firstObject];
  if (([v13 supportsGrouping] & 1) != 0
    && [v15 selectionState]
    && v19
    && (v18 & 1) != 0)
  {
    os_log_t oslog = (os_log_t)(id)qword_5F8E8;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      os_log_type_t v5 = type;
      id v6 = -[MPAVOutputDeviceRoutingDataSource endpointRoute](v23->_outputDeviceRoutingDataSource, "endpointRoute");
      id v10 = v6;
      sub_138DC((uint64_t)v24, (uint64_t)v14, (uint64_t)v10);
      _os_log_impl(&dword_0, log, v5, "Remove Picked Route: %{public}@ from Endpoint: %{public}@", v24, 0x16u);

      objc_storeStrong(&v10, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    -[MPAVRoutingController selectRoutes:operation:completion:]( v23->_outputDeviceRoutingController,  "selectRoutes:operation:completion:",  v14,  2LL,  &stru_50B90);
  }

  -[TVNPGroupableRoutingController _updateWithAvailableEndpoints:outputDevices:]( v23,  "_updateWithAvailableEndpoints:outputDevices:",  v23->_allEndpoints,  v23->_allOutputDevices);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)selectOdeonDestination:(id)a3
{
  uint64_t v24 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ((_os_feature_enabled_impl("Home", "cce7c4ecef404121ae8971") & 1) != 0)
  {
    id v3 = -[HMMediaDestinationController destination](v24->_homeDestinationController, "destination");
    BOOL v12 = v3 == location[0];

    if (!v12)
    {
      id v10 = v24;
      os_log_type_t v11 = (NSString *)[location[0] audioDestinationIdentifier];
      char v21 = 0;
      if (v11)
      {
        id v9 = v11;
      }

      else
      {
        uint64_t v22 = -[TVNPGroupableRoutingController localRouteIdentifier](v24, "localRouteIdentifier");
        char v21 = 1;
        id v9 = v22;
      }

      -[TVNPGroupableRoutingController setPendingSelectedMediaDestination:]( v10,  "setPendingSelectedMediaDestination:",  v9);
      if ((v21 & 1) != 0) {

      }
      id v6 = v24;
      id v8 = -[TVNPGroupableRoutingController homeDestinationController](v24, "homeDestinationController");
      id v7 = -[HMMediaDestinationController availableDestinations](v8, "availableDestinations");
      -[TVNPGroupableRoutingController _updateWithAvailableMediaDestinations:]( v6,  "_updateWithAvailableMediaDestinations:");

      objc_initWeak(&v20, v24);
      os_log_type_t v5 = +[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance");
      id v4 = location[0];
      id v13 = _NSConcreteStackBlock;
      int v14 = -1073741824;
      int v15 = 0;
      char v16 = sub_14230;
      id v17 = &unk_50BB8;
      char v18 = v24;
      id v19 = location[0];
      -[TVCSHomeManager updateLocalAccessoryAudioDestination:forceUpdateWithUnavailableDestination:completionHandler:]( v5,  "updateLocalAccessoryAudioDestination:forceUpdateWithUnavailableDestination:completionHandler:",  v4,  0LL,  &v13);

      objc_storeStrong(&v19, 0LL);
      objc_storeStrong((id *)&v18, 0LL);
      objc_destroyWeak(&v20);
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)setDiscoveryMode:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      -[MPAVRoutingController setDiscoveryMode:](self->_outputDeviceRoutingController, "setDiscoveryMode:");
      -[MPAVRoutingController setDiscoveryMode:](self->_endpointRoutingController, "setDiscoveryMode:", 1LL);
    }

    else
    {
      -[MPAVRoutingController setDiscoveryMode:](self->_outputDeviceRoutingController, "setDiscoveryMode:");
      -[MPAVRoutingController setDiscoveryMode:](self->_endpointRoutingController, "setDiscoveryMode:", 3LL);
    }
  }

  else
  {
    -[MPAVRoutingController setDiscoveryMode:](self->_outputDeviceRoutingController, "setDiscoveryMode:");
    -[MPAVRoutingController setDiscoveryMode:](self->_endpointRoutingController, "setDiscoveryMode:", 0LL);
  }

  self->_discoveryMode = a3;
}

- (void)targetDestination:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = location[0];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVNPEndpointRoutingDestination);
  char v7 = 0;
  if ((objc_opt_isKindOfClass(v5, v3) & 1) != 0)
  {
    id v8 = [location[0] endpointRoute];
    char v7 = 1;
    id v4 = v8;
  }

  else
  {
    id v4 = 0LL;
  }

  id v9 = v4;
  if ((v7 & 1) != 0) {

  }
  os_log_t oslog = (os_log_t)(id)qword_5F8E8;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1225C((uint64_t)v11, (uint64_t)v9);
    _os_log_impl(&dword_0, oslog, OS_LOG_TYPE_DEFAULT, "Retarget to Endpoint: %{public}@", v11, 0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  +[MPAVRoutingController setActiveRoute:completion:]( &OBJC_CLASS___MPAVRoutingController,  "setActiveRoute:completion:",  v9,  0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)isLocalRouteAVR
{
  return -[PBSMediaRemoteServiceInterface volumeControlTargetDeviceType]( self->_pbsMediaRemoteProxy,  "volumeControlTargetDeviceType",  a2,  self) == (char *)&dword_0 + 2;
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVNPGroupableRoutingController _setNeedsDisplayedRoutesUpdate](v4, "_setNeedsDisplayedRoutesUpdate");
  objc_storeStrong(location, 0LL);
}

- (void)routingController:(id)a3 pickedRouteDidChange:(id)a4
{
  char v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVNPGroupableRoutingController _setNeedsDisplayedRoutesUpdate](v7, "_setNeedsDisplayedRoutesUpdate");
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_setNeedsDisplayedRoutesUpdate
{
  BOOL v12 = self;
  location[1] = (id)a2;
  self->_needsAvailableRoutesUpdate = 1;
  ++v12->_numberOfUpdates;
  objc_initWeak(location, v12);
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  char v7 = sub_14960;
  id v8 = &unk_50BE0;
  objc_copyWeak(&v9, location);
  id v10 = objc_retainBlock(&v4);
  if (v12->_numberOfUpdates > 0xF)
  {
    dispatch_time_t when = dispatch_time(0LL, 2000000000LL);
    uint64_t v3 = &_dispatch_main_q;
    dispatch_after(when, v3, v10);
  }

  else
  {
    (*((void (**)(void))v10 + 2))();
  }

  objc_storeStrong(&v10, 0LL);
  objc_destroyWeak(&v9);
  objc_destroyWeak(location);
}

- (void)_updateAvailableRoutes
{
  id v38 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  os_log_type_t v36 = dispatch_group_create();
  v30[0] = 0LL;
  v30[1] = v30;
  int v31 = 838860800;
  int v32 = 48;
  id v33 = sub_14CF4;
  v34 = sub_14D48;
  id v35 = 0LL;
  dispatch_group_enter(v36);
  v24[0] = 0LL;
  v24[1] = v24;
  int v25 = 838860800;
  int v26 = 48;
  id v27 = sub_14CF4;
  uint64_t v28 = sub_14D48;
  id v29 = 0LL;
  dispatch_group_enter(v36);
  uint64_t v23 = v38->_endpointRoutingController;
  uint64_t v22 = v38->_outputDeviceRoutingController;
  queue = (dispatch_queue_s *)v38->_updateQueue;
  id v13 = _NSConcreteStackBlock;
  int v14 = -1073741824;
  int v15 = 0;
  char v16 = sub_14D74;
  id v17 = &unk_50C58;
  char v18 = v23;
  v20[1] = v30;
  objc_copyWeak(&v21, location);
  id v19 = v36;
  v20[0] = v22;
  v20[2] = v24;
  dispatch_async(queue, &v13);
  group = v36;
  id v4 = &_dispatch_main_q;
  int v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_15030;
  id v9 = &unk_50C80;
  objc_copyWeak(&v12, location);
  id v10 = v30;
  os_log_type_t v11 = v24;
  dispatch_group_notify(group, v4, &v5);

  objc_destroyWeak(&v12);
  objc_storeStrong(v20, 0LL);
  objc_storeStrong((id *)&v19, 0LL);
  objc_destroyWeak(&v21);
  objc_storeStrong((id *)&v18, 0LL);
  objc_storeStrong((id *)&v22, 0LL);
  objc_storeStrong((id *)&v23, 0LL);
  _Block_object_dispose(v24, 8);
  objc_storeStrong(&v29, 0LL);
  _Block_object_dispose(v30, 8);
  objc_storeStrong(&v35, 0LL);
  objc_storeStrong((id *)&v36, 0LL);
  objc_destroyWeak(location);
}

- (id)_endpointRoutesWithForcedLocalRoute:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v26 = 0LL;
  char v25 = 0;
  id v24 = 0LL;
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  id v19 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
  if (v19)
  {
    uint64_t v15 = *(void *)__b[2];
    uint64_t v16 = 0LL;
    id v17 = v19;
    while (1)
    {
      uint64_t v14 = v16;
      if (*(void *)__b[2] != v15) {
        objc_enumerationMutation(obj);
      }
      id v23 = *(id *)(__b[1] + 8 * v16);
      id v12 = [v23 routeUID];
      id v28 = (id)MRMediaRemoteCopyDeviceUID();
      id v11 = v28;
      unsigned __int8 v13 = objc_msgSend(v12, "containsString:");

      if ((v13 & 1) != 0) {
        objc_storeStrong(&v24, v23);
      }
      ++v16;
      if (v14 + 1 >= (unint64_t)v17)
      {
        uint64_t v16 = 0LL;
        id v17 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
        if (!v17) {
          goto LABEL_11;
        }
      }
    }

    char v25 = 1;
    int v21 = 2;
  }

  else
  {
LABEL_11:
    int v21 = 0;
  }

  if ((v25 & 1) != 0 || !v24)
  {
    id v5 = [location[0] copy];
    id v6 = v26;
    id v26 = v5;
  }

  else
  {
    id v20 = [location[0] mutableCopy];
    [v20 removeObject:v24];
    id v9 = v20;
    id v10 = +[MPAVRoutingController systemRoute](&OBJC_CLASS___MPAVRoutingController, "systemRoute");
    objc_msgSend(v9, "insertObject:atIndex:");

    id v3 = [v20 copy];
    id v4 = v26;
    id v26 = v3;

    objc_storeStrong(&v20, 0LL);
  }

  id v8 = v26;
  int v21 = 1;
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

- (void)_updateWithAvailableEndpoints:(id)a3 outputDevices:(id)a4
{
  v270 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v268 = 0LL;
  objc_storeStrong(&v268, a4);
  if (![v268 count] || objc_msgSend(location[0], "count"))
  {
    id v4 = (NSArray *)[location[0] copy];
    allEndpoints = v270->_allEndpoints;
    v270->_allEndpoints = v4;

    id v6 = (NSArray *)[v268 copy];
    allOutputDevices = v270->_allOutputDevices;
    v270->_allOutputDevices = v6;

    id v266 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v265 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v264 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    memset(__b, 0, sizeof(__b));
    id v135 = location[0];
    id v136 = [v135 countByEnumeratingWithState:__b objects:v291 count:16];
    if (v136)
    {
      uint64_t v132 = *(void *)__b[2];
      uint64_t v133 = 0LL;
      id v134 = v136;
      while (1)
      {
        uint64_t v131 = v133;
        if (*(void *)__b[2] != v132) {
          objc_enumerationMutation(v135);
        }
        id v263 = *(id *)(__b[1] + 8 * v133);
        id v125 = v265;
        id v128 = [v263 routeName];
        id v127 = [v263 routeUID];
        v126 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%@)",  v128,  v127);
        objc_msgSend(v125, "addObject:");

        endpointIdentifiersToDestinations = v270->_endpointIdentifiersToDestinations;
        id v130 = [v263 routeUID];
        id v261 = -[NSMutableDictionary objectForKey:](endpointIdentifiersToDestinations, "objectForKey:");

        if (!v261)
        {
          if ([v263 endpoint])
          {
            id v8 = -[TVNPEndpointRoutingDestination initWithEndpointRoute:]( objc_alloc(&OBJC_CLASS___TVNPEndpointRoutingDestination),  "initWithEndpointRoute:",  v263);
            id v9 = v261;
            id v261 = v8;
          }

          else
          {
            id v259 = (id)qword_5F8E8;
            os_log_type_t type = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled((os_log_t)v259, OS_LOG_TYPE_ERROR))
            {
              log = (os_log_s *)v259;
              os_log_type_t v124 = type;
              sub_18574((uint64_t)v290, (uint64_t)v263, (uint64_t)v263);
              _os_log_error_impl( &dword_0,  log,  v124,  "Can't create destination, no MRAVEndpointRef. {endpointRoute_ptr=%p, endpointRoute=%{public}@}",  v290,  0x16u);
            }

            objc_storeStrong(&v259, 0LL);
          }
        }

        if (v261)
        {
          [v261 refreshPropertiesWithRoute:v263];
          [v266 addObject:v261];
        }

        else
        {
          id v257 = (id)qword_5F8E8;
          os_log_type_t v256 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v257, OS_LOG_TYPE_ERROR))
          {
            v122 = (os_log_s *)v257;
            sub_18574((uint64_t)v289, (uint64_t)v263, (uint64_t)v263);
            _os_log_error_impl( &dword_0,  v122,  v256,  "No destination for endpoint route. {endpointRoute_ptr=%p, endpointRoute=%{public}@}",  v289,  0x16u);
          }

          objc_storeStrong(&v257, 0LL);
        }

        objc_storeStrong(&v261, 0LL);
        ++v133;
        if (v131 + 1 >= (unint64_t)v134)
        {
          uint64_t v133 = 0LL;
          id v134 = [v135 countByEnumeratingWithState:__b objects:v291 count:16];
          if (!v134) {
            break;
          }
        }
      }
    }

    -[NSMutableDictionary removeAllObjects](v270->_endpointIdentifiersToDestinations, "removeAllObjects");
    id v255 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v254 = 0LL;
    memset(v252, 0, sizeof(v252));
    id v120 = v266;
    id v121 = [v120 countByEnumeratingWithState:v252 objects:v288 count:16];
    if (v121)
    {
      uint64_t v117 = *(void *)v252[2];
      uint64_t v118 = 0LL;
      id v119 = v121;
      while (1)
      {
        uint64_t v116 = v118;
        if (*(void *)v252[2] != v117) {
          objc_enumerationMutation(v120);
        }
        id v253 = *(id *)(v252[1] + 8 * v118);
        id v111 = v264;
        id v114 = [v253 destinationName];
        id v113 = [v253 uniqueIdentifier];
        v112 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%@)",  v114,  v113);
        objc_msgSend(v111, "addObject:");

        id v115 = v253;
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___TVNPEndpointRoutingDestination);
        char v249 = 0;
        if ((objc_opt_isKindOfClass(v115, v10) & 1) != 0)
        {
          id v250 = [v253 endpointRoute];
          char v249 = 1;
          id v11 = v250;
        }

        else
        {
          id v11 = 0LL;
        }

        id v251 = v11;
        if ((v249 & 1) != 0) {

        }
        if (v251)
        {
          v109 = v270->_endpointIdentifiersToDestinations;
          id v108 = v253;
          id v110 = [v251 routeUID];
          -[NSMutableDictionary setObject:forKey:](v109, "setObject:forKey:", v108);

          [v255 addObject:v251];
        }

        objc_storeStrong(&v251, 0LL);
        ++v118;
        if (v116 + 1 >= (unint64_t)v119)
        {
          uint64_t v118 = 0LL;
          id v119 = [v120 countByEnumeratingWithState:v252 objects:v288 count:16];
          if (!v119) {
            break;
          }
        }
      }
    }

    currentEndpointRouteUID = v270->_currentEndpointRouteUID;
    char v246 = 0;
    char v244 = 0;
    if (currentEndpointRouteUID)
    {
      id v12 = currentEndpointRouteUID;
    }

    else
    {
      id v247 = -[MPAVOutputDeviceRoutingDataSource endpointRoute](v270->_outputDeviceRoutingDataSource, "endpointRoute");
      char v246 = 1;
      id v245 = [v247 routeUID];
      char v244 = 1;
      id v12 = (NSString *)v245;
    }

    id v248 = v12;
    if ((v244 & 1) != 0) {

    }
    if ((v246 & 1) != 0) {
    id v106 = -[NSMutableDictionary objectForKey:](v270->_endpointIdentifiersToDestinations, "objectForKey:", v248);
    }
    if (v106) {
      id v13 = v106;
    }
    else {
      id v13 = v254;
    }
    id v243 = v13;

    char v240 = 0;
    BOOL v105 = 0;
    if (([v243 isLocal] & 1) == 0)
    {
      v241 = +[PBSAirPlaySettings sharedInstance](&OBJC_CLASS___PBSAirPlaySettings, "sharedInstance");
      char v240 = 1;
      BOOL v105 = -[PBSAirPlaySettings securityType](v241, "securityType") == (char *)&dword_0 + 1;
    }

    if ((v240 & 1) != 0) {

    }
    BOOL v242 = v105;
    id v239 = -[MPAVRoutingController pickedRoutes](v270->_outputDeviceRoutingController, "pickedRoutes");
    id v238 = -[MPAVRoutingController pendingPickedRoutes](v270->_outputDeviceRoutingController, "pendingPickedRoutes");
    id v237 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v236 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v235 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v234 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v233 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v232 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v231 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v230 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    int64_t v229 = 0LL;
    memset(v227, 0, sizeof(v227));
    id v103 = v268;
    id v104 = [v103 countByEnumeratingWithState:v227 objects:v287 count:16];
    if (v104)
    {
      uint64_t v100 = *(void *)v227[2];
      uint64_t v101 = 0LL;
      id v102 = v104;
      while (1)
      {
        uint64_t v99 = v101;
        if (*(void *)v227[2] != v100) {
          objc_enumerationMutation(v103);
        }
        id v228 = *(id *)(v227[1] + 8 * v101);
        id v95 = v233;
        id v98 = [v228 routeName];
        id v97 = [v228 routeUID];
        v96 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ (%@)", v98, v97);
        objc_msgSend(v95, "addObject:");

        if ((!v242 || ([v228 isDeviceRoute] & 1) == 0)
          && ([v228 isSetTopBoxRoute] & 1) == 0
          && ([v228 isTVStickRoute] & 1) == 0
          && [v228 routeSubtype] != &dword_10)
        {
          id v226 = [v228 routeUID];
          char v223 = 0;
          if (v226)
          {
            id v224 = -[NSMutableDictionary objectForKey:](v270->_outputDeviceIdentifiersToRoutes, "objectForKey:", v226);
            char v223 = 1;
            id v14 = v224;
          }

          else
          {
            id v14 = 0LL;
          }

          id v225 = v14;
          if ((v223 & 1) != 0) {

          }
          char v221 = 0;
          BOOL v94 = 0;
          if (!v225)
          {
            id v222 = [v228 routeName];
            char v221 = 1;
            BOOL v94 = ([v222 isEqual:@"Dock Connector"] & 1) == 0;
          }

          if ((v221 & 1) != 0) {

          }
          if (v94)
          {
            uint64_t v15 = objc_alloc_init(&OBJC_CLASS___TVNPOutputDeviceRoute);
            id v16 = v225;
            id v225 = v15;
          }

          if (v225)
          {
            id v220 = 0LL;
            id v219 = [v228 logicalLeaderOutputDevice];
            memset(v217, 0, sizeof(v217));
            id v92 = v255;
            id v93 = [v92 countByEnumeratingWithState:v217 objects:v286 count:16];
            if (v93)
            {
              uint64_t v89 = *(void *)v217[2];
              uint64_t v90 = 0LL;
              id v91 = v93;
              while (1)
              {
                uint64_t v88 = v90;
                if (*(void *)v217[2] != v89) {
                  objc_enumerationMutation(v92);
                }
                id v218 = *(id *)(v217[1] + 8 * v90);
                id v216 = [v218 endpoint];
                id v215 = (id)MRAVEndpointCopyOutputDevices(v216);
                id v271 = (id)MRAVOutputDeviceCopyUniqueIdentifier(v219);
                id v214 = v271;
                id v87 = v215;
                v207 = _NSConcreteStackBlock;
                int v208 = -1073741824;
                int v209 = 0;
                v210 = sub_185C4;
                v211 = &unk_50CA8;
                id v212 = v214;
                id v213 = [v87 indexOfObjectPassingTest:&v207];
                if (v213 == (id)0x7FFFFFFFFFFFFFFFLL)
                {
                  int v267 = 0;
                }

                else
                {
                  id v85 = v270->_endpointIdentifiersToDestinations;
                  id v86 = [v218 routeUID];
                  id v17 = -[NSMutableDictionary objectForKey:](v85, "objectForKey:");
                  id v18 = v220;
                  id v220 = v17;

                  int v267 = 8;
                }

                objc_storeStrong(&v212, 0LL);
                objc_storeStrong(&v214, 0LL);
                objc_storeStrong(&v215, 0LL);
                if (v267) {
                  break;
                }
                ++v90;
                if (v88 + 1 >= (unint64_t)v91)
                {
                  uint64_t v90 = 0LL;
                  id v91 = [v92 countByEnumeratingWithState:v217 objects:v286 count:16];
                  if (!v91) {
                    goto LABEL_81;
                  }
                }
              }
            }

            else
            {
LABEL_81:
              int v267 = 0;
            }

            id v206 = 0LL;
            if ([v238 containsObject:v228])
            {
              if ([v225 selectionState])
              {
                else {
                  id v206 = [v225 selectionState];
                }
              }

              else
              {
                id v206 = &dword_0 + 1;
              }
            }

            else if ([v239 containsObject:v228])
            {
              id v206 = &dword_0 + 2;
              [v237 addObject:v225];
            }

            if (([v220 isLocal] & 1) != 0
              && ([v228 isPicked] & 1) != 0
              && ([v228 isDeviceRoute] & 1) == 0)
            {
              ++v229;
            }

            if ([v228 routeSubtype] == (char *)&dword_8 + 2)
            {
              v205 = 0LL;
              if ([v220 isCurrentDestination])
              {
                if (-[PBSMediaRemoteServiceInterface volumeControlTargetDeviceType]( v270->_pbsMediaRemoteProxy,  "volumeControlTargetDeviceType") == (char *)&dword_0 + 2)
                {
                  v84 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v270));
                  id v19 =  -[NSBundle localizedStringForKey:value:table:]( v84,  "localizedStringForKey:value:table:",  @"ReceiverSpeakersTitle",  0LL,  @"Localizable");
                  id v20 = v205;
                  v205 = v19;
                }

                else
                {
                  id v83 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v270));
                  int v21 =  -[NSBundle localizedStringForKey:value:table:]( v83,  "localizedStringForKey:value:table:",  @"TVSpeakersTitle",  0LL,  @"Localizable");
                  uint64_t v22 = v205;
                  v205 = v21;
                }
              }

              else
              {
                v82 = +[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice");
                id v23 = -[UIDevice name](v82, "name");
                id v24 = v205;
                v205 = v23;
              }

              [v225 setOverrideTitle:v205];
              objc_storeStrong((id *)&v205, 0LL);
            }

            else
            {
              [v225 setOverrideTitle:0];
            }

            [v225 updateWithOutputDevice:v228 selectionState:v206 destination:v220 wantsVolumeUpdates:v270->_wantsVolumeUpdates];
            if (([v225 noiseControlSupported] & 1) != 0
              || ([v225 spatialAudioSupported] & 1) != 0)
            {
              [v235 addObject:v225];
            }

            [v236 addObject:v225];
            if (([v228 isDeviceRoute] & 1) == 0)
            {
              id v204 = [v225 groupUID];
              if (([v228 isGroupLeader] & 1) != 0 && v204)
              {
                [v230 setObject:v225 forKey:v204];
              }

              else if (v204)
              {
                id v203 = [v231 objectForKey:v204];
                if (!v203)
                {
                  id v25 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
                  id v26 = v203;
                  id v203 = v25;

                  [v231 setObject:v203 forKey:v204];
                }

                [v203 addObject:v225];
                objc_storeStrong(&v203, 0LL);
              }

              objc_storeStrong(&v204, 0LL);
            }

            objc_storeStrong(&v220, 0LL);
          }

          else
          {
            id v80 = [v228 routeName];
            unsigned __int8 v81 = [v80 isEqual:@"Dock Connector"];

            if ((v81 & 1) == 0)
            {
              id v202 = (id)qword_5F8E8;
              os_log_type_t v201 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled((os_log_t)v202, OS_LOG_TYPE_ERROR))
              {
                os_log_type_t v79 = (os_log_s *)v202;
                sub_18680((uint64_t)v285, (uint64_t)v226, (uint64_t)v228, (uint64_t)v228);
                _os_log_error_impl( &dword_0,  v79,  v201,  "No route for output device. {routeUID=%{public}@, outputDevice_ptr=%p, outputDevice=%{public}@}",  v285,  0x20u);
              }

              objc_storeStrong(&v202, 0LL);
            }
          }

          objc_storeStrong(&v225, 0LL);
          objc_storeStrong(&v226, 0LL);
        }

        ++v101;
        if (v99 + 1 >= (unint64_t)v102)
        {
          uint64_t v101 = 0LL;
          id v102 = [v103 countByEnumeratingWithState:v227 objects:v287 count:16];
          if (!v102) {
            break;
          }
        }
      }
    }

    id v76 = v231;
    v194 = _NSConcreteStackBlock;
    int v195 = -1073741824;
    int v196 = 0;
    v197 = sub_186E8;
    v198 = &unk_50CD0;
    id v199 = v230;
    id v200 = v231;
    [v76 enumerateKeysAndObjectsUsingBlock:&v194];
    -[NSMutableDictionary removeAllObjects](v270->_outputDeviceIdentifiersToRoutes, "removeAllObjects");
    memset(v192, 0, sizeof(v192));
    id v77 = v236;
    id v78 = [v77 countByEnumeratingWithState:v192 objects:v284 count:16];
    if (v78)
    {
      uint64_t v73 = *(void *)v192[2];
      uint64_t v74 = 0LL;
      id v75 = v78;
      while (1)
      {
        uint64_t v72 = v74;
        if (*(void *)v192[2] != v73) {
          objc_enumerationMutation(v77);
        }
        id v193 = *(id *)(v192[1] + 8 * v74);
        id v67 = v232;
        id v70 = [v193 title];
        id v69 = [v193 routeUID];
        id v68 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ (%@)", v70, v69);
        objc_msgSend(v67, "addObject:");

        id v71 = [v193 outputDeviceRoute];
        id v191 = [v71 routeUID];

        if (v191)
        {
          -[NSMutableDictionary setObject:forKey:]( v270->_outputDeviceIdentifiersToRoutes,  "setObject:forKey:",  v193,  v191);
          id v190 = [v193 groupUID];
          id v189 = [v230 objectForKey:v190];
          id v65 = v231;
          id v66 = [v193 groupUID];
          id v188 = objc_msgSend(v65, "objectForKey:");

          if (v189 && [v188 count] && v190 && v189 == v193)
          {
            v187 = (TVNPGroupedRoute *) -[NSMutableDictionary objectForKey:]( v270->_groupIdentifiersToGroups,  "objectForKey:",  v190);
            if (!v187)
            {
              id v27 = objc_alloc_init(&OBJC_CLASS___TVNPGroupedRoute);
              id v28 = v187;
              v187 = v27;
            }

            -[TVNPGroupedRoute updateWithGroupLeader:members:](v187, "updateWithGroupLeader:members:", v189, v188);
            [v234 addObject:v187];
            objc_storeStrong((id *)&v187, 0LL);
          }

          else
          {
            char v185 = 0;
            unsigned __int8 v64 = 1;
            if (v190)
            {
              unsigned __int8 v64 = 1;
              if ([v188 count])
              {
                id v186 = [v193 outputDeviceRoute];
                char v185 = 1;
                unsigned __int8 v64 = [v186 isDeviceRoute];
              }
            }

            if ((v185 & 1) != 0) {

            }
            if ((v64 & 1) != 0) {
              [v234 addObject:v193];
            }
          }

          objc_storeStrong(&v188, 0LL);
          objc_storeStrong(&v189, 0LL);
          objc_storeStrong(&v190, 0LL);
        }

        objc_storeStrong(&v191, 0LL);
        ++v74;
        if (v72 + 1 >= (unint64_t)v75)
        {
          uint64_t v74 = 0LL;
          id v75 = [v77 countByEnumeratingWithState:v192 objects:v284 count:16];
          if (!v75) {
            break;
          }
        }
      }
    }

    -[NSMutableDictionary removeAllObjects](v270->_groupIdentifiersToGroups, "removeAllObjects");
    memset(v183, 0, sizeof(v183));
    id v62 = v234;
    id v63 = [v62 countByEnumeratingWithState:v183 objects:v283 count:16];
    if (v63)
    {
      uint64_t v59 = *(void *)v183[2];
      uint64_t v60 = 0LL;
      id v61 = v63;
      while (1)
      {
        uint64_t v58 = v60;
        if (*(void *)v183[2] != v59) {
          objc_enumerationMutation(v62);
        }
        id v184 = *(id *)(v183[1] + 8 * v60);
        id v57 = v184;
        uint64_t v29 = objc_opt_class(&OBJC_CLASS___TVNPGroupedRoute);
        if ((objc_opt_isKindOfClass(v57, v29) & 1) != 0)
        {
          groupIdentifiersToGroups = v270->_groupIdentifiersToGroups;
          id v54 = v184;
          id v56 = [v184 groupUID];
          -[NSMutableDictionary setObject:forKey:](groupIdentifiersToGroups, "setObject:forKey:", v54);
        }

        ++v60;
        if (v58 + 1 >= (unint64_t)v61)
        {
          uint64_t v60 = 0LL;
          id v61 = [v62 countByEnumeratingWithState:v183 objects:v283 count:16];
          if (!v61) {
            break;
          }
        }
      }
    }

    id v182 =  +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:");
    id v181 =  +[NSSortDescriptor sortDescriptorWithKey:ascending:comparator:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:comparator:",  0LL,  1LL,  &stru_50D10);
    id v180 =  +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  @"title",  1LL,  "localizedCompare:");
    id v179 =  +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  @"routeUID",  1LL,  "localizedCompare:");
    id v47 = v236;
    v282[0] = v182;
    v282[1] = v181;
    v282[2] = v180;
    v282[3] = v179;
    unsigned __int8 v48 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v282);
    objc_msgSend(v47, "sortUsingDescriptors:");

    id v49 = v234;
    v281[0] = v182;
    v281[1] = v181;
    v281[2] = v180;
    v281[3] = v179;
    v50 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v281, 4LL);
    objc_msgSend(v49, "sortUsingDescriptors:");

    id v178 =  +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  @"destinationName",  1LL,  "localizedCompare:");
    id v177 =  +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  @"uniqueIdentifier",  1LL,  "localizedCompare:");
    id v176 =  +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  @"local",  0LL,  "compare:");
    id v51 = v266;
    v280[0] = v176;
    v280[1] = v178;
    v280[2] = v177;
    os_log_type_t v52 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v280, 3LL);
    objc_msgSend(v51, "sortUsingDescriptors:");

    id v175 = -[MPAVOutputDeviceRoutingDataSource endpointRoute](v270->_outputDeviceRoutingDataSource, "endpointRoute");
    char v174 = [v175 canModifyGroupMembership] & 1;
    BOOL multipleSelectionEnabled = 0;
    BOOL v173 = multipleSelectionEnabled;
    BOOL v172 = v243 == v254;
    if (!v270->_multipleSelectionEnabled || !v173 || (char v46 = 1, (v174 & 1) == 0)) {
      char v46 = v172;
    }
    char v171 = v46 & 1;
    id v170 = (id)qword_5F8E8;
    os_log_type_t v169 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v170, OS_LOG_TYPE_INFO))
    {
      sub_18B5C( (uint64_t)v279,  v171 & 1,  v270->_multipleSelectionEnabled,  v173,  v174 & 1,  v172,  (uint64_t)v175,  (uint64_t)v175);
      _os_log_impl( &dword_0,  (os_log_t)v170,  v169,  "Should show routes. {shouldShowRoutes=%{BOOL}d, multipleSelectionEnabled=%{BOOL}d, controllerCanGroup=%{BOOL}d, canModifyGroupMembership=%{BOOL}d, currentDestinationIsLocalDestination=%{BOOL}d, endpointRoute_ptr=%p, endpoint Route=%{public}@}",  v279,  0x34u);
    }

    objc_storeStrong(&v170, 0LL);
    id v168 =  +[MPAVRoutingController systemRouteWithContextUID:]( &OBJC_CLASS___MPAVRoutingController,  "systemRouteWithContextUID:",  0LL);
    id v45 = [v168 routeName];
    id v167 = [v45 copy];

    id v166 = (id)qword_5F8E8;
    os_log_type_t v165 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v166, OS_LOG_TYPE_DEFAULT))
    {
      sub_126C0((uint64_t)v278, (uint64_t)v167);
      _os_log_impl(&dword_0, (os_log_t)v166, v165, "System output route: %@", v278, 0xCu);
    }

    objc_storeStrong(&v166, 0LL);
    id v164 = (id)qword_5F8E8;
    os_log_type_t v163 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v164, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = (os_log_s *)v164;
      os_log_type_t v43 = v163;
      id v44 = objc_msgSend(v265, "componentsJoinedByString:", @", ");
      id v162 = v44;
      sub_1225C((uint64_t)v277, (uint64_t)v162);
      _os_log_impl(&dword_0, v42, v43, "Available endpoints from MediaRemote [%{public}@]", v277, 0xCu);

      objc_storeStrong(&v162, 0LL);
    }

    objc_storeStrong(&v164, 0LL);
    id v161 = (id)qword_5F8E8;
    os_log_type_t v160 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v161, OS_LOG_TYPE_DEFAULT))
    {
      id v39 = (os_log_s *)v161;
      os_log_type_t v40 = v160;
      id v41 = objc_msgSend(v264, "componentsJoinedByString:", @", ");
      id v159 = v41;
      sub_1225C((uint64_t)v276, (uint64_t)v159);
      _os_log_impl(&dword_0, v39, v40, "Available endpoints after filtering [%{public}@]", v276, 0xCu);

      objc_storeStrong(&v159, 0LL);
    }

    objc_storeStrong(&v161, 0LL);
    id v158 = (id)qword_5F8E8;
    os_log_type_t v157 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v158, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v36 = (os_log_s *)v158;
      os_log_type_t v37 = v157;
      id v38 = objc_msgSend(v233, "componentsJoinedByString:", @", ");
      id v156 = v38;
      sub_1225C((uint64_t)v275, (uint64_t)v156);
      _os_log_impl(&dword_0, v36, v37, "Available output routes from MediaRemote [%{public}@]", v275, 0xCu);

      objc_storeStrong(&v156, 0LL);
    }

    objc_storeStrong(&v158, 0LL);
    id v155 = (id)qword_5F8E8;
    os_log_type_t v154 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v155, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = (os_log_s *)v155;
      os_log_type_t v34 = v154;
      id v35 = objc_msgSend(v232, "componentsJoinedByString:", @", ");
      id v153 = v35;
      sub_1225C((uint64_t)v274, (uint64_t)v153);
      _os_log_impl(&dword_0, v33, v34, "Available output routes after filtering [%{public}@]", v274, 0xCu);

      objc_storeStrong(&v153, 0LL);
    }

    objc_storeStrong(&v155, 0LL);
    -[TVNPGroupableRoutingController willChangeValueForKey:]( v270,  "willChangeValueForKey:",  @"availableDestinations");
    -[TVNPGroupableRoutingController willChangeValueForKey:](v270, "willChangeValueForKey:", @"availableRoutes");
    -[TVNPGroupableRoutingController willChangeValueForKey:]( v270,  "willChangeValueForKey:",  @"availableRoutesAndGroups");
    -[TVNPGroupableRoutingController willChangeValueForKey:](v270, "willChangeValueForKey:", @"appleHeadsets");
    -[TVNPGroupableRoutingController willChangeValueForKey:](v270, "willChangeValueForKey:", @"currentRoutes");
    -[TVNPGroupableRoutingController willChangeValueForKey:]( v270,  "willChangeValueForKey:",  @"currentDestination");
    -[TVNPGroupableRoutingController willChangeValueForKey:]( v270,  "willChangeValueForKey:",  @"systemOutputRouteName");
    -[TVNPGroupableRoutingController willChangeValueForKey:]( v270,  "willChangeValueForKey:",  @"numberOfExternalRoutesInLocalDestination");
    BOOL allowsDestinationSelection = v270->_allowsDestinationSelection;
    char v151 = 0;
    char v149 = 0;
    if (allowsDestinationSelection)
    {
      id v152 = [v266 copy];
      char v151 = 1;
      objc_storeStrong((id *)&v270->_availableDestinations, v152);
    }

    else if (v243)
    {
      id v273 = v243;
      id v150 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v273, 1LL);
      char v149 = 1;
      objc_storeStrong((id *)&v270->_availableDestinations, v150);
    }

    else
    {
      objc_storeStrong((id *)&v270->_availableDestinations, &__NSArray0__struct);
    }

    if ((v149 & 1) != 0) {

    }
    if ((v151 & 1) != 0) {
    char v147 = 0;
    }
    if ((v171 & 1) != 0)
    {
      id v148 = [v236 copy];
      char v147 = 1;
      objc_storeStrong((id *)&v270->_availableRoutes, v148);
    }

    else
    {
      objc_storeStrong((id *)&v270->_availableRoutes, &__NSArray0__struct);
    }

    if ((v147 & 1) != 0) {

    }
    objc_storeStrong((id *)&v270->_appleHeadsets, v235);
    char v145 = 0;
    if ((v171 & 1) != 0)
    {
      id v146 = [v234 copy];
      char v145 = 1;
      objc_storeStrong((id *)&v270->_availableRoutesAndGroups, v146);
    }

    else
    {
      objc_storeStrong((id *)&v270->_availableRoutesAndGroups, &__NSArray0__struct);
    }

    if ((v145 & 1) != 0) {

    }
    char v143 = 0;
    if ((v171 & 1) != 0)
    {
      id v144 = [v237 copy];
      char v143 = 1;
      objc_storeStrong((id *)&v270->_currentRoutes, v144);
    }

    else
    {
      objc_storeStrong((id *)&v270->_currentRoutes, &__NSArray0__struct);
    }

    if ((v143 & 1) != 0) {

    }
    objc_storeStrong((id *)&v270->_systemOutputRouteName, v167);
    v270->_numberOfExternalRoutesInLocalDestination = v229;
    if (v270->_currentDestination != v243)
    {
      -[TVNPRoutingDestination setIsCurrentDestination:](v270->_currentDestination, "setIsCurrentDestination:", 0LL);
      objc_storeStrong((id *)&v270->_currentDestination, v243);
      -[TVNPRoutingDestination setIsCurrentDestination:](v270->_currentDestination, "setIsCurrentDestination:", 1LL);
    }

    if (v270->_multipleSelectionEnabled)
    {
      outputDeviceRoutingDataSource = v270->_outputDeviceRoutingDataSource;
      id v32 = -[TVNPRoutingDestination endpointRoute](v270->_currentDestination, "endpointRoute");
      -[MPAVOutputDeviceRoutingDataSource setEndpointRoute:](outputDeviceRoutingDataSource, "setEndpointRoute:");
    }

    -[TVNPGroupableRoutingController didChangeValueForKey:]( v270,  "didChangeValueForKey:",  @"availableDestinations");
    -[TVNPGroupableRoutingController didChangeValueForKey:](v270, "didChangeValueForKey:", @"availableRoutes");
    -[TVNPGroupableRoutingController didChangeValueForKey:]( v270,  "didChangeValueForKey:",  @"availableRoutesAndGroups");
    -[TVNPGroupableRoutingController didChangeValueForKey:](v270, "didChangeValueForKey:", @"appleHeadsets");
    -[TVNPGroupableRoutingController didChangeValueForKey:](v270, "didChangeValueForKey:", @"currentRoutes");
    -[TVNPGroupableRoutingController didChangeValueForKey:](v270, "didChangeValueForKey:", @"currentDestination");
    -[TVNPGroupableRoutingController didChangeValueForKey:]( v270,  "didChangeValueForKey:",  @"systemOutputRouteName");
    -[TVNPGroupableRoutingController didChangeValueForKey:]( v270,  "didChangeValueForKey:",  @"numberOfExternalRoutesInLocalDestination");
    id v142 = [location[0] count];
    int64_t v141 = -[NSArray count](v270->_availableDestinations, "count");
    id v140 = [v268 count];
    int64_t v139 = -[NSArray count](v270->_availableRoutes, "count");
    os_log_t oslog = (os_log_t)(id)qword_5F8E8;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_18C18( (uint64_t)v272,  (uint64_t)v142,  v141,  (uint64_t)v140,  v139,  v171 & 1,  v270->_allowsDestinationSelection,  (uint64_t)v175,  (uint64_t)v175);
      _os_log_impl( &dword_0,  oslog,  OS_LOG_TYPE_DEFAULT,  "Update Routing DataSource. {availableDestinations_input=%ld, availableDestinations_output=%ld, availableRoutes_i nput=%ld, availableRoutes_output=%ld, shouldShowRoutes=%{BOOL}d, allowsDestinationSelection=%{BOOL}d, endpointRo ute_ptr=%p, endpointRoute=%{public}@}",  v272,  0x4Au);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    objc_storeStrong(&v167, 0LL);
    objc_storeStrong(&v168, 0LL);
    objc_storeStrong(&v175, 0LL);
    objc_storeStrong(&v176, 0LL);
    objc_storeStrong(&v177, 0LL);
    objc_storeStrong(&v178, 0LL);
    objc_storeStrong(&v179, 0LL);
    objc_storeStrong(&v180, 0LL);
    objc_storeStrong(&v181, 0LL);
    objc_storeStrong(&v182, 0LL);
    objc_storeStrong(&v200, 0LL);
    objc_storeStrong(&v199, 0LL);
    objc_storeStrong(&v230, 0LL);
    objc_storeStrong(&v231, 0LL);
    objc_storeStrong(&v232, 0LL);
    objc_storeStrong(&v233, 0LL);
    objc_storeStrong(&v234, 0LL);
    objc_storeStrong(&v235, 0LL);
    objc_storeStrong(&v236, 0LL);
    objc_storeStrong(&v237, 0LL);
    objc_storeStrong(&v238, 0LL);
    objc_storeStrong(&v239, 0LL);
    objc_storeStrong(&v243, 0LL);
    objc_storeStrong(&v248, 0LL);
    objc_storeStrong(&v254, 0LL);
    objc_storeStrong(&v255, 0LL);
    objc_storeStrong(&v264, 0LL);
    objc_storeStrong(&v265, 0LL);
    objc_storeStrong(&v266, 0LL);
    int v267 = 0;
  }

  else
  {
    int v267 = 1;
  }

  objc_storeStrong(&v268, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateWithAvailableMediaDestinations:(id)a3
{
  BOOL v105 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v103 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v102 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v101 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v100 = -[HMMediaDestinationController destination](v105->_homeDestinationController, "destination");
  id v99 =  -[NSMutableDictionary objectForKey:]( v105->_mediaDestinationIdentifiersToRoutes,  "objectForKey:",  v105->_localRouteIdentifier);
  if (!v99)
  {
    id v99 = -[TVNPRoute _init](objc_alloc(&OBJC_CLASS___TVNPRoute), "_init");

    [v99 setRouteUID:v105->_localRouteIdentifier];
    id v70 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"tv.and.hifispeaker.fill");
    objc_msgSend(v99, "setDeviceImage:");

    [v99 setDeviceType:1];
    [v99 setLocal:1];
    [v99 setAvailable:1];
    if (-[PBSMediaRemoteServiceInterface volumeControlTargetDeviceType]( v105->_pbsMediaRemoteProxy,  "volumeControlTargetDeviceType") == (char *)&dword_0 + 2)
    {
      id v69 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v105));
      id v68 =  -[NSBundle localizedStringForKey:value:table:]( v69,  "localizedStringForKey:value:table:",  @"ReceiverSpeakersTitle",  0LL,  @"Localizable");
      objc_msgSend(v99, "setTitle:");
    }

    else
    {
      id v67 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v105));
      id v66 =  -[NSBundle localizedStringForKey:value:table:]( v67,  "localizedStringForKey:value:table:",  @"TVSpeakersTitle",  0LL,  @"Localizable");
      objc_msgSend(v99, "setTitle:");
    }
  }

  if (-[NSString isEqualToString:]( v105->_pendingSelectedMediaDestination,  "isEqualToString:",  v105->_localRouteIdentifier))
  {
    [v99 setSelectionState:1];
  }

  else
  {
    id v64 = -[HMMediaDestinationController destination](v105->_homeDestinationController, "destination");
    BOOL v65 = 1;
    if (!v64) {
      BOOL v65 = v105->_pendingSelectedMediaDestination != 0LL;
    }

    if (v65) {
      [v99 setSelectionState:0];
    }
    else {
      [v99 setSelectionState:2];
    }
  }

  [v103 addObject:v99];
  id v98 =  +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences");
  id v97 = objc_msgSend(v98, "pbs_buddySelectedHomeTheaterSpeakerIdentifier");
  if (v97)
  {
    id v96 =  -[NSMutableDictionary objectForKey:]( v105->_mediaDestinationIdentifiersToRoutes,  "objectForKey:",  v105->_placeholderRouteIdentifier);
    if (!v96)
    {
      id v95 = objc_msgSend(v98, "pbs_buddySelectedHomeTheaterSpeakerType");
      id v62 = objc_msgSend(v98, "pbs_buddySelectedHomeTheaterHomePodVariant");
      id v63 = (char *)[v62 unsignedIntegerValue];

      id v94 = v63;
      char v93 = [v95 isEqualToString:PBSHomeTheaterSpeakerTypeHomePodStereoPair] & 1;
      if (v63 == (_BYTE *)&dword_0 + 2)
      {
        id v3 = @"homepod.mini.2.fill";
        if ((v93 & 1) == 0) {
          id v3 = @"homepod.mini.fill";
        }
      }

      else
      {
        id v3 = @"homepod.2.fill";
        if ((v93 & 1) == 0) {
          id v3 = @"homepod.fill";
        }
      }

      id v92 = v3;
      id v4 = -[TVNPRoute _init](objc_alloc(&OBJC_CLASS___TVNPRoute), "_init");
      id v5 = v96;
      id v96 = v4;

      [v96 setRouteUID:v105->_placeholderRouteIdentifier];
      id v59 = +[UIImage _systemImageNamed:](&OBJC_CLASS___UIImage, "_systemImageNamed:", v92);
      objc_msgSend(v96, "setDeviceImage:");

      if ((v93 & 1) != 0) {
        uint64_t v6 = 3LL;
      }
      else {
        uint64_t v6 = 2LL;
      }
      [v96 setDeviceType:v6];
      [v96 setLocal:0];
      id v60 = v96;
      id v61 = objc_msgSend(v98, "pbs_buddySelectedRoomName");
      objc_msgSend(v60, "setTitle:");

      [v96 setSelectionState:1];
      [v96 setAvailable:1];
      objc_storeStrong((id *)&v92, 0LL);
      objc_storeStrong(&v95, 0LL);
    }

    [v103 addObject:v96];
    objc_storeStrong(&v96, 0LL);
  }

  else
  {
    memset(__b, 0, sizeof(__b));
    id v57 = location[0];
    id v58 = [v57 countByEnumeratingWithState:__b objects:v110 count:16];
    if (v58)
    {
      uint64_t v54 = *(void *)__b[2];
      uint64_t v55 = 0LL;
      id v56 = v58;
      while (1)
      {
        uint64_t v53 = v55;
        if (*(void *)__b[2] != v54) {
          objc_enumerationMutation(v57);
        }
        id v91 = *(id *)(__b[1] + 8 * v55);
        id v47 = v102;
        id v50 = [v91 audioDestinationName];
        id v49 = [v91 audioDestinationIdentifier];
        unsigned __int8 v48 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ (%@)", v50, v49);
        objc_msgSend(v47, "addObject:");

        mediaDestinationIdentifiersToRoutes = v105->_mediaDestinationIdentifiersToRoutes;
        id v52 = [v91 audioDestinationIdentifier];
        id v89 = -[NSMutableDictionary objectForKey:](mediaDestinationIdentifiersToRoutes, "objectForKey:");

        if (!v89)
        {
          int v7 = objc_alloc_init(&OBJC_CLASS___TVNPMediaDestinationRoute);
          id v8 = v89;
          id v89 = v7;
        }

        if (v89)
        {
          id v42 = [v100 audioDestinationIdentifier];
          id v41 = [v91 audioDestinationIdentifier];
          unsigned __int8 v43 = objc_msgSend(v42, "isEqualToString:");

          char v88 = v43 & 1;
          id v44 = [v91 audioDestinationIdentifier];
          id v45 =  -[TVNPGroupableRoutingController pendingSelectedMediaDestination]( v105,  "pendingSelectedMediaDestination");
          unsigned __int8 v9 = objc_msgSend(v44, "isEqualToString:");
          char v85 = 0;
          unsigned __int8 v46 = 1;
          if ((v9 & 1) == 0)
          {
            id v86 = [v91 audioDestinationIdentifier];
            char v85 = 1;
            unsigned __int8 v46 = [v86 isEqualToString:v97];
          }

          if ((v85 & 1) != 0) {

          }
          char v87 = v46 & 1;
          if ((v46 & 1) != 0)
          {
            os_log_type_t v40 = &dword_0 + 1;
          }

          else
          {
            BOOL v39 = 0;
            if ((v88 & 1) != 0) {
              BOOL v39 = v105->_pendingSelectedMediaDestination == 0LL;
            }
            uint64_t v10 = 2LL;
            if (!v39) {
              uint64_t v10 = 0LL;
            }
            os_log_type_t v40 = (void *)v10;
          }

          v84[1] = v40;
          [v89 updateWithMediaDestination:v91 selectionState:v40];
          [v103 addObject:v89];
        }

        id v38 = v91;
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___HMAccessory);
        if ((objc_opt_isKindOfClass(v38, v11) & 1) != 0)
        {
          v84[0] = v91;
          [v84[0] setDelegate:v105];
          objc_storeStrong(v84, 0LL);
        }

        else
        {
          id v37 = v91;
          uint64_t v12 = objc_opt_class(&OBJC_CLASS___HMMediaSystem);
          if ((objc_opt_isKindOfClass(v37, v12) & 1) != 0)
          {
            id v83 = v91;
            memset(v81, 0, sizeof(v81));
            id v35 = [v83 components];
            id v36 = [v35 countByEnumeratingWithState:v81 objects:v109 count:16];
            if (v36)
            {
              uint64_t v32 = *(void *)v81[2];
              uint64_t v33 = 0LL;
              id v34 = v36;
              while (1)
              {
                uint64_t v31 = v33;
                if (*(void *)v81[2] != v32) {
                  objc_enumerationMutation(v35);
                }
                id v82 = *(id *)(v81[1] + 8 * v33);
                id v30 = [v82 mediaProfile];
                id v80 = [v30 accessory];

                [v80 setDelegate:v105];
                objc_storeStrong(&v80, 0LL);
                ++v33;
                if (v31 + 1 >= (unint64_t)v34)
                {
                  uint64_t v33 = 0LL;
                  id v34 = [v35 countByEnumeratingWithState:v81 objects:v109 count:16];
                  if (!v34) {
                    break;
                  }
                }
              }
            }

            objc_storeStrong(&v83, 0LL);
          }
        }

        objc_storeStrong(&v89, 0LL);
        ++v55;
        if (v53 + 1 >= (unint64_t)v56)
        {
          uint64_t v55 = 0LL;
          id v56 = [v57 countByEnumeratingWithState:__b objects:v110 count:16];
          if (!v56) {
            break;
          }
        }
      }
    }
  }

  -[NSMutableDictionary removeAllObjects](v105->_mediaDestinationIdentifiersToRoutes, "removeAllObjects");
  memset(v78, 0, sizeof(v78));
  id v28 = v103;
  id v29 = [v28 countByEnumeratingWithState:v78 objects:v108 count:16];
  if (v29)
  {
    uint64_t v25 = *(void *)v78[2];
    uint64_t v26 = 0LL;
    id v27 = v29;
    while (1)
    {
      uint64_t v24 = v26;
      if (*(void *)v78[2] != v25) {
        objc_enumerationMutation(v28);
      }
      id v79 = *(id *)(v78[1] + 8 * v26);
      id v20 = v101;
      id v23 = [v79 title];
      id v22 = [v79 routeUID];
      int v21 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ (%@)", v23, v22);
      objc_msgSend(v20, "addObject:");

      id v77 = [v79 routeUID];
      if (v77) {
        -[NSMutableDictionary setObject:forKey:]( v105->_mediaDestinationIdentifiersToRoutes,  "setObject:forKey:",  v79,  v77);
      }
      objc_storeStrong(&v77, 0LL);
      ++v26;
      if (v24 + 1 >= (unint64_t)v27)
      {
        uint64_t v26 = 0LL;
        id v27 = [v28 countByEnumeratingWithState:v78 objects:v108 count:16];
        if (!v27) {
          break;
        }
      }
    }
  }

  os_log_t oslog = (os_log_t)(id)qword_5F8E8;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    os_log_type_t v18 = type;
    id v19 = objc_msgSend(v102, "componentsJoinedByString:", @", ");
    id v74 = v19;
    sub_1225C((uint64_t)v107, (uint64_t)v74);
    _os_log_impl(&dword_0, log, v18, "Available Odeon destinations from HomeKit [%{public}@]", v107, 0xCu);

    objc_storeStrong(&v74, 0LL);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  os_log_t v73 = (os_log_t)(id)qword_5F8E8;
  os_log_type_t v72 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v73;
    os_log_type_t v15 = v72;
    id v16 = objc_msgSend(v101, "componentsJoinedByString:", @", ");
    id v71 = v16;
    sub_1225C((uint64_t)v106, (uint64_t)v71);
    _os_log_impl(&dword_0, v14, v15, "Available Odeon destinations after filtering [%{public}@]", v106, 0xCu);

    objc_storeStrong(&v71, 0LL);
  }

  objc_storeStrong((id *)&v73, 0LL);
  -[TVNPGroupableRoutingController willChangeValueForKey:](v105, "willChangeValueForKey:", @"eligibleOdeonRoutes");
  id v13 = [v103 copy];
  if (v13) {
    objc_storeStrong((id *)&v105->_eligibleOdeonRoutes, v13);
  }
  else {
    objc_storeStrong((id *)&v105->_eligibleOdeonRoutes, &__NSArray0__struct);
  }

  -[TVNPGroupableRoutingController didChangeValueForKey:](v105, "didChangeValueForKey:", @"eligibleOdeonRoutes");
  objc_storeStrong(&v97, 0LL);
  objc_storeStrong(&v98, 0LL);
  objc_storeStrong(&v99, 0LL);
  objc_storeStrong(&v100, 0LL);
  objc_storeStrong(&v101, 0LL);
  objc_storeStrong(&v102, 0LL);
  objc_storeStrong(&v103, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v30 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v28 = 0LL;
  objc_storeStrong(&v28, a4);
  id v27 = 0LL;
  objc_storeStrong(&v27, a5);
  uint64_t v26 = a6;
  if (a6 == off_5F418)
  {
    if ((_os_feature_enabled_impl("Home", "cce7c4ecef404121ae8971") & 1) != 0)
    {
      os_log_type_t v15 = -[TVNPGroupableRoutingController homeManager](v30, "homeManager");
      id v14 = -[TVCSHomeManager localAccessory](v15, "localAccessory");
      id v13 = [v14 hmAccessory];
      id v25 = [v13 audioDestinationController];

      if (v30->_homeDestinationController != v25)
      {
        objc_storeStrong((id *)&v30->_homeDestinationController, v25);
        id v24 = (id)qword_5F8E8;
        os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
        {
          sub_126C0((uint64_t)v32, (uint64_t)v25);
          _os_log_impl( &dword_0,  (os_log_t)v24,  v23,  "Updating Odeon destinations with destination controller %@",  v32,  0xCu);
        }

        objc_storeStrong(&v24, 0LL);
      }

      id v22 = -[HMMediaDestinationController destination](v30->_homeDestinationController, "destination");
      selectedMediaDestinationIdentifier = v30->_selectedMediaDestinationIdentifier;
      id v11 = [v22 audioDestinationIdentifier];
      unsigned __int8 v12 = -[NSString isEqualToString:](selectedMediaDestinationIdentifier, "isEqualToString:");

      if ((v12 & 1) == 0)
      {
        id v21 = (id)qword_5F8E8;
        os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
        {
          sub_126C0((uint64_t)v31, (uint64_t)v22);
          _os_log_impl( &dword_0,  (os_log_t)v21,  v20,  "HMMediaDestinationController did update destination %@",  v31,  0xCu);
        }

        objc_storeStrong(&v21, 0LL);
        objc_storeStrong((id *)&v30->_pendingSelectedMediaDestination, 0LL);
        uint64_t v6 = (NSString *)[v22 audioDestinationIdentifier];
        int v7 = v30->_selectedMediaDestinationIdentifier;
        v30->_selectedMediaDestinationIdentifier = v6;
      }

      id v8 = v30;
      id v9 =  -[HMMediaDestinationController availableDestinations]( v30->_homeDestinationController,  "availableDestinations");
      -[TVNPGroupableRoutingController _updateWithAvailableMediaDestinations:]( v8,  "_updateWithAvailableMediaDestinations:");

      objc_storeStrong(&v22, 0LL);
      objc_storeStrong(&v25, 0LL);
    }
  }

  else if (v26 == off_5F410)
  {
    -[TVNPGroupableRoutingController _updateWithAvailableEndpoints:outputDevices:]( v30,  "_updateWithAvailableEndpoints:outputDevices:",  v30->_allEndpoints,  v30->_allOutputDevices);
  }

  else
  {
    v19.receiver = v30;
    v19.super_class = (Class)&OBJC_CLASS___TVNPGroupableRoutingController;
    -[TVNPGroupableRoutingController observeValueForKeyPath:ofObject:change:context:]( &v19,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v28,  v27,  v26);
  }

  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)accessoryDidUpdateControllable:(id)a3
{
  uint64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = (id)qword_5F8E8;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = location[0];
    id v7 = [location[0] settings];
    else {
      id v3 = @"no";
    }
    sub_1A3E0((uint64_t)v11, (uint64_t)v6, (uint64_t)v3);
    _os_log_impl(&dword_0, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "%@ did update isControllable: %@", v11, 0x16u);
  }

  objc_storeStrong(&v8, 0LL);
  id v4 = v10;
  id v5 = -[HMMediaDestinationController availableDestinations](v10->_homeDestinationController, "availableDestinations");
  -[TVNPGroupableRoutingController _updateWithAvailableMediaDestinations:](v4, "_updateWithAvailableMediaDestinations:");

  objc_storeStrong(location, 0LL);
}

- (BOOL)allowsDestinationSelection
{
  return self->_allowsDestinationSelection;
}

- (NSArray)availableDestinations
{
  return self->_availableDestinations;
}

- (NSArray)availableRoutes
{
  return self->_availableRoutes;
}

- (NSArray)appleHeadsets
{
  return self->_appleHeadsets;
}

- (NSArray)availableRoutesAndGroups
{
  return self->_availableRoutesAndGroups;
}

- (TVNPRoutingDestination)currentDestination
{
  return self->_currentDestination;
}

- (NSArray)currentRoutes
{
  return self->_currentRoutes;
}

- (unint64_t)discoveryMode
{
  return self->_discoveryMode;
}

- (int64_t)numberOfExternalRoutesInLocalDestination
{
  return self->_numberOfExternalRoutesInLocalDestination;
}

- (HMMediaDestinationController)homeDestinationController
{
  return self->_homeDestinationController;
}

- (NSArray)eligibleOdeonRoutes
{
  return self->_eligibleOdeonRoutes;
}

- (NSString)outputContextUID
{
  return self->_outputContextUID;
}

- (BOOL)allowsRetargeting
{
  return self->_allowsRetargeting;
}

- (BOOL)wantsVolumeUpdates
{
  return self->_wantsVolumeUpdates;
}

- (NSString)systemOutputRouteName
{
  return self->_systemOutputRouteName;
}

- (PBSMediaRemoteServiceInterface)pbsMediaRemoteProxy
{
  return self->_pbsMediaRemoteProxy;
}

- (MPAVEndpointRoutingDataSource)endpointRoutingDataSource
{
  return self->_endpointRoutingDataSource;
}

- (MPAVOutputDeviceRoutingDataSource)outputDeviceRoutingDataSource
{
  return self->_outputDeviceRoutingDataSource;
}

- (MPAVRoutingController)endpointRoutingController
{
  return self->_endpointRoutingController;
}

- (MPAVRoutingController)outputDeviceRoutingController
{
  return self->_outputDeviceRoutingController;
}

- (TVCSHomeManager)homeManager
{
  return self->_homeManager;
}

- (NSMutableDictionary)mediaDestinationIdentifiersToRoutes
{
  return self->_mediaDestinationIdentifiersToRoutes;
}

- (NSString)localRouteIdentifier
{
  return self->_localRouteIdentifier;
}

- (NSString)placeholderRouteIdentifier
{
  return self->_placeholderRouteIdentifier;
}

- (NSString)pendingSelectedMediaDestination
{
  return self->_pendingSelectedMediaDestination;
}

- (void)setPendingSelectedMediaDestination:(id)a3
{
}

- (NSString)selectedMediaDestinationIdentifier
{
  return self->_selectedMediaDestinationIdentifier;
}

- (void)setSelectedMediaDestinationIdentifier:(id)a3
{
}

- (NSMutableDictionary)outputDeviceIdentifiersToRoutes
{
  return self->_outputDeviceIdentifiersToRoutes;
}

- (NSMutableDictionary)endpointIdentifiersToDestinations
{
  return self->_endpointIdentifiersToDestinations;
}

- (NSMutableDictionary)groupIdentifiersToGroups
{
  return self->_groupIdentifiersToGroups;
}

- (NSArray)allOutputDevices
{
  return self->_allOutputDevices;
}

- (NSArray)allEndpoints
{
  return self->_allEndpoints;
}

- (NSString)currentEndpointRouteUID
{
  return self->_currentEndpointRouteUID;
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (unint64_t)numberOfUpdates
{
  return self->_numberOfUpdates;
}

- (BOOL)needsAvailableRoutesUpdate
{
  return self->_needsAvailableRoutesUpdate;
}

- (BOOL)multipleSelectionEnabled
{
  return self->_multipleSelectionEnabled;
}

- (void).cxx_destruct
{
}

@end