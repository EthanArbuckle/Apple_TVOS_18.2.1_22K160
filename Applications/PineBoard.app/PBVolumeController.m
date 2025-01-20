@interface PBVolumeController
+ (id)_systemAudioVolumeDataSource;
+ (id)_systemVolumeAudioCategories;
- ($95A7711724258D2DBCF2C7E5A2AF8B2C)currentVolumeStateForOutputContext:(unint64_t)a3;
- (BOOL)airPlayActiveForOutputContext:(unint64_t)a3;
- (BOOL)airPlayActiveForRoutingController:(id)a3;
- (BOOL)bluetoothActiveForOutputContext:(unint64_t)a3;
- (BOOL)bluetoothActiveForRoutingController:(id)a3;
- (BOOL)isReady;
- (BOOL)odeonActiveForOutputContext:(unint64_t)a3;
- (BOOL)odeonActiveForRoutingController:(id)a3;
- (BOOL)systemAudioVolumeNotificationsEnabled;
- (BOOL)systemAudioVolumeSupported;
- (BOOL)systemMusicVolumeNotificationsEnabled;
- (BOOL)systemMusicVolumeSupported;
- (BOOL)updatingVolumeValues;
- (BOOL)volumeSupportedForOutputContext:(unint64_t)a3;
- (MPAVRoutingController)systemAudioRoutingController;
- (MPAVRoutingController)systemMusicRoutingController;
- (MPVolumeController)systemAudioVolumeController;
- (MPVolumeController)systemMusicVolumeController;
- (NSNumber)systemAudioVolume;
- (NSNumber)systemAudioVolume_unmuted;
- (NSNumber)systemMusicVolume;
- (NSNumber)systemMusicVolume_unmuted;
- (NSSet)systemAudioRoutes;
- (NSSet)systemMusicRoutes;
- (PBBulletinService)bulletinService;
- (PBDistributedAssertion)suppressVolumeHUDAssertion;
- (PBSBulletin)volumeBulletin;
- (PBVolumeController)init;
- (PBVolumeController)initWithDelegate:(id)a3;
- (PBVolumeController)initWithDelegate:(id)a3 distributedAssertion:(id)a4;
- (PBVolumeControllerDelegate)delegate;
- (float)odeonVolumeStepForCurrentVolume:(float)a3 isIncrementing:(BOOL)a4;
- (void)_initMediaPlayer;
- (void)_presentVolumeBulletinForRoutes:(id)a3 volumeLevel:(float)a4;
- (void)_setNeedsVolumeUpdateWithReason:(id)a3 silenceVolumeHUD:(BOOL)a4;
- (void)_updateVolumeWithReason:(id)a3 silenceVolumeHUD:(BOOL)a4;
- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5;
- (void)decreaseVolumeForOutputContext:(unint64_t)a3;
- (void)increaseVolumeForOutputContext:(unint64_t)a3;
- (void)routingController:(id)a3 pickedRoutesDidChange:(id)a4;
- (void)setBulletinService:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setVolumeBulletin:(id)a3;
- (void)setVolumeMuted:(BOOL)a3 forOutputContext:(unint64_t)a4;
- (void)setVolumeNotificationsEnabled:(BOOL)a3 forOutputContext:(unint64_t)a4;
- (void)volumeController:(id)a3 mutedStateDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4 silenceVolumeHUD:(BOOL)a5;
@end

@implementation PBVolumeController

- (PBVolumeController)init
{
  return 0LL;
}

- (PBVolumeController)initWithDelegate:(id)a3
{
  uint64_t v4 = PBSAssertionDomainSuppressVolumeHUD;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[PBDistributedAssertion distributedAssertionForDomain:]( &OBJC_CLASS___PBDistributedAssertion,  "distributedAssertionForDomain:",  v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 requireFocusedProcess]);
  v8 = -[PBVolumeController initWithDelegate:distributedAssertion:]( self,  "initWithDelegate:distributedAssertion:",  v5,  v7);

  return v8;
}

- (PBVolumeController)initWithDelegate:(id)a3 distributedAssertion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBVolumeController;
  v8 = -[PBVolumeController init](&v16, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v9->_isReady = 0;
    objc_initWeak(&location, v9);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100061460;
    v13[3] = &unk_1003D0890;
    objc_copyWeak(&v14, &location);
    dispatch_async(v11, v13);

    objc_storeStrong((id *)&v9->_suppressVolumeHUDAssertion, a4);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v9;
}

+ (id)_systemVolumeAudioCategories
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  int v3 = MGGetBoolAnswer(@"s8TgWYc7BjtSNbtuycqauw");
  int v4 = _os_feature_enabled_impl("TelephonyUtilities", "Laguna");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  if (v3 && v4)
  {
    v9[0] = @"Audio/Video";
    v9[1] = @"PhoneCall";
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));

    id v5 = (void *)v6;
  }

  -[NSMutableSet addObjectsFromArray:](v2, "addObjectsFromArray:", v5);

  id v7 = -[NSMutableSet copy](v2, "copy");
  return v7;
}

+ (id)_systemAudioVolumeDataSource
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _systemVolumeAudioCategories]);
  if ([v2 count]) {
    id v3 = [[MPVolumeControllerSystemDataSource alloc] initWithVolumeAudioCategories:v2];
  }
  else {
    id v3 = objc_alloc_init(&OBJC_CLASS___MPVolumeControllerSystemDataSource);
  }
  int v4 = v3;

  return v4;
}

- (void)_initMediaPlayer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[MPAVRoutingController systemRouteWithContextUID:]( &OBJC_CLASS___MPAVRoutingController,  "systemRouteWithContextUID:",  0LL));
  id v4 = [[MPVolumeControllerRouteDataSource alloc] initWithGroupRoute:v3 outputDeviceRoute:0];
  id v5 = -[MPVolumeController initWithDataSource:]( objc_alloc(&OBJC_CLASS___MPVolumeController),  "initWithDataSource:",  v4);
  systemMusicVolumeController = self->_systemMusicVolumeController;
  self->_systemMusicVolumeController = v5;

  -[MPVolumeController setDelegate:](self->_systemMusicVolumeController, "setDelegate:", self);
  id v7 = [(id)objc_opt_class(self) _systemAudioVolumeDataSource];
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[MPVolumeController initWithDataSource:]( objc_alloc(&OBJC_CLASS___MPVolumeController),  "initWithDataSource:",  v8);
  systemAudioVolumeController = self->_systemAudioVolumeController;
  self->_systemAudioVolumeController = v9;

  -[MPVolumeController setDelegate:](self->_systemAudioVolumeController, "setDelegate:", self);
  id v11 = objc_alloc_init(&OBJC_CLASS___MPAVOutputDeviceRoutingDataSource);
  if (MRAVOutputContextGetSharedAudioPresentationContext()) {
    [v11 setRoutingContextUID:MRAVOutputContextGetUniqueIdentifier()];
  }
  v12 = -[MPAVRoutingController initWithDataSource:name:]( objc_alloc(&OBJC_CLASS___MPAVRoutingController),  "initWithDataSource:name:",  v11,  @"com.apple.PineBoard.PBExternalControlSystem.systemMusic");
  systemMusicRoutingController = self->_systemMusicRoutingController;
  self->_systemMusicRoutingController = v12;

  -[MPAVRoutingController setDelegate:](self->_systemMusicRoutingController, "setDelegate:", self);
  id v14 = objc_alloc_init(&OBJC_CLASS___MPAVOutputDeviceRoutingDataSource);
  if (MRAVOutputContextGetSharedSystemAudioContext()) {
    [v14 setRoutingContextUID:MRAVOutputContextGetUniqueIdentifier()];
  }
  v15 = -[MPAVRoutingController initWithDataSource:name:]( objc_alloc(&OBJC_CLASS___MPAVRoutingController),  "initWithDataSource:name:",  v14,  @"com.apple.PineBoard.PBExternalControlSystem.systemAudio");
  systemAudioRoutingController = self->_systemAudioRoutingController;
  self->_systemAudioRoutingController = v15;

  -[MPAVRoutingController setDelegate:](self->_systemAudioRoutingController, "setDelegate:", self);
  v17 = self->_systemMusicVolumeController;
  if (v17)
  {
    v17 = self->_systemAudioVolumeController;
    if (v17)
    {
      v17 = self->_systemMusicRoutingController;
      if (v17) {
        LOBYTE(v17) = self->_systemAudioRoutingController != 0LL;
      }
    }
  }

  self->_isReady = (char)v17;
  id v18 = sub_100082DE4();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "MediaPlayer is now ready for volume control",  v20,  2u);
  }
}

- (void)increaseVolumeForOutputContext:(unint64_t)a3
{
  id v5 = sub_100082DE4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v43 = 134217984;
    unint64_t v44 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Increase volume for output context: %lu",  (uint8_t *)&v43,  0xCu);
  }

  if (a3 == 1)
  {
    if (!-[PBVolumeController isReady](self, "isReady")) {
      return;
    }
    -[MPVolumeController volumeValue](self->_systemMusicVolumeController, "volumeValue");
    float v13 = v12;
    if (-[PBVolumeController odeonActiveForRoutingController:]( self,  "odeonActiveForRoutingController:",  self->_systemMusicRoutingController))
    {
      *(float *)&double v14 = v13;
      -[PBVolumeController odeonVolumeStepForCurrentVolume:isIncrementing:]( self,  "odeonVolumeStepForCurrentVolume:isIncrementing:",  1LL,  v14);
      float v16 = v15;
    }

    else
    {
      float v16 = 0.0625;
    }

    -[NSNumber floatValue](self->_systemMusicVolume_unmuted, "floatValue");
    float v27 = v26;
    unsigned int v28 = -[MPVolumeController isMuted](self->_systemMusicVolumeController, "isMuted");
    unsigned int v29 = v28;
    float v30 = v13 + v16;
    if (v28) {
      float v31 = v27;
    }
    else {
      float v31 = v30;
    }
    id v32 = sub_100082DE4();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    double v34 = v13;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      int v43 = 134218496;
      unint64_t v44 = *(void *)&v34;
      __int16 v45 = 2048;
      double v46 = v31;
      __int16 v47 = 1024;
      unsigned int v48 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Increase volume (System Music) from %f to %f (was muted:%{BOOL}d)",  (uint8_t *)&v43,  0x1Cu);
    }

    double v35 = fabs(v34 + -1.0);
    if (v35 >= 0.00000011920929) {
      char v38 = 1;
    }
    else {
      char v38 = v29;
    }
    if ((v38 & 1) != 0)
    {
      systemMusicVolumeController = self->_systemMusicVolumeController;
      *(float *)&double v35 = v31;
      goto LABEL_37;
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[PBVolumeHUDManager sharedInstance](&OBJC_CLASS___PBVolumeHUDManager, "sharedInstance"));
    systemMusicRoutingController = self->_systemMusicRoutingController;
    goto LABEL_40;
  }

  if (!a3 && -[PBVolumeController isReady](self, "isReady"))
  {
    -[MPVolumeController volumeValue](self->_systemAudioVolumeController, "volumeValue");
    float v8 = v7;
    if (-[PBVolumeController odeonActiveForRoutingController:]( self,  "odeonActiveForRoutingController:",  self->_systemAudioRoutingController))
    {
      *(float *)&double v9 = v8;
      -[PBVolumeController odeonVolumeStepForCurrentVolume:isIncrementing:]( self,  "odeonVolumeStepForCurrentVolume:isIncrementing:",  1LL,  v9);
      float v11 = v10;
    }

    else
    {
      float v11 = 0.0625;
    }

    -[NSNumber floatValue](self->_systemAudioVolume_unmuted, "floatValue");
    float v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemAudioVolumeController](self, "systemAudioVolumeController"));
    unsigned int v20 = [v19 isMuted];

    float v21 = v8 + v11;
    if (v20) {
      float v22 = v18;
    }
    else {
      float v22 = v21;
    }
    id v23 = sub_100082DE4();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    double v25 = v8;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v43 = 134218496;
      unint64_t v44 = *(void *)&v25;
      __int16 v45 = 2048;
      double v46 = v22;
      __int16 v47 = 1024;
      unsigned int v48 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Increase volume (System Audio) from %f to %f (was muted:%{BOOL}d)",  (uint8_t *)&v43,  0x1Cu);
    }

    double v35 = fabs(v25 + -1.0);
    if (v35 >= 0.00000011920929) {
      char v36 = 1;
    }
    else {
      char v36 = v20;
    }
    if ((v36 & 1) != 0)
    {
      systemMusicVolumeController = self->_systemAudioVolumeController;
      *(float *)&double v35 = v22;
LABEL_37:
      -[MPVolumeController setVolumeValue:](systemMusicVolumeController, "setVolumeValue:", v35);
      return;
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[PBVolumeHUDManager sharedInstance](&OBJC_CLASS___PBVolumeHUDManager, "sharedInstance"));
    systemMusicRoutingController = self->_systemAudioRoutingController;
LABEL_40:
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MPAVRoutingController pickedRoutes](systemMusicRoutingController, "pickedRoutes"));
    v42 = (void *)objc_claimAutoreleasedReturnValue( +[MPAVRoutingController _symbolImageForRoutes:]( &OBJC_CLASS___MPAVRoutingController,  "_symbolImageForRoutes:",  v41));
    [v39 showVolumeHUDWithImage:v42 level:&off_1003FD7B8];
  }

- (void)decreaseVolumeForOutputContext:(unint64_t)a3
{
  if (a3 == 1)
  {
    if (!-[PBVolumeController isReady](self, "isReady")) {
      return;
    }
    -[MPVolumeController volumeValue](self->_systemMusicVolumeController, "volumeValue");
    float v10 = v9;
    if (-[PBVolumeController odeonActiveForRoutingController:]( self,  "odeonActiveForRoutingController:",  self->_systemMusicRoutingController))
    {
      *(float *)&double v11 = v10;
      -[PBVolumeController odeonVolumeStepForCurrentVolume:isIncrementing:]( self,  "odeonVolumeStepForCurrentVolume:isIncrementing:",  0LL,  v11);
      float v13 = v12;
    }

    else
    {
      float v13 = 0.0625;
    }

    -[NSNumber floatValue](self->_systemMusicVolume_unmuted, "floatValue");
    float v26 = v25;
    float v27 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemMusicVolumeController](self, "systemMusicVolumeController"));
    unsigned int v28 = [v27 isMuted];

    float v29 = fmaxf(v10 - v13, 0.0);
    if (v28) {
      float v19 = v26;
    }
    else {
      float v19 = v29;
    }
    id v30 = sub_100082DE4();
    float v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 134218496;
      double v38 = v10;
      __int16 v39 = 2048;
      double v40 = v19;
      __int16 v41 = 1024;
      unsigned int v42 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Decrease volume (System Music) from %f to %f (was muted:%{BOOL}d)",  (uint8_t *)&v37,  0x1Cu);
    }

    if (fabsf(v10) >= 0.00000011921) {
      char v32 = 1;
    }
    else {
      char v32 = v28;
    }
    if ((v32 & 1) != 0)
    {
      systemMusicVolumeController = self->_systemMusicVolumeController;
      goto LABEL_31;
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[PBVolumeHUDManager sharedInstance](&OBJC_CLASS___PBVolumeHUDManager, "sharedInstance"));
    systemMusicRoutingController = self->_systemMusicRoutingController;
    goto LABEL_34;
  }

  if (!a3 && -[PBVolumeController isReady](self, "isReady"))
  {
    -[MPVolumeController volumeValue](self->_systemAudioVolumeController, "volumeValue");
    float v5 = v4;
    if (-[PBVolumeController odeonActiveForRoutingController:]( self,  "odeonActiveForRoutingController:",  self->_systemAudioRoutingController))
    {
      *(float *)&double v6 = v5;
      -[PBVolumeController odeonVolumeStepForCurrentVolume:isIncrementing:]( self,  "odeonVolumeStepForCurrentVolume:isIncrementing:",  0LL,  v6);
      float v8 = v7;
    }

    else
    {
      float v8 = 0.0625;
    }

    -[NSNumber floatValue](self->_systemMusicVolume_unmuted, "floatValue");
    float v15 = v14;
    float v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemAudioVolumeController](self, "systemAudioVolumeController"));
    unsigned int v17 = [v16 isMuted];

    float v18 = fmaxf(v5 - v8, 0.0);
    if (v17) {
      float v19 = v15;
    }
    else {
      float v19 = v18;
    }
    id v20 = sub_100082DE4();
    float v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 134218496;
      double v38 = v5;
      __int16 v39 = 2048;
      double v40 = v19;
      __int16 v41 = 1024;
      unsigned int v42 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Decrease volume (System Audio) from %f to %f (was muted:%{BOOL}d)",  (uint8_t *)&v37,  0x1Cu);
    }

    if (fabsf(v5) >= 0.00000011921) {
      char v23 = 1;
    }
    else {
      char v23 = v17;
    }
    if ((v23 & 1) != 0)
    {
      systemMusicVolumeController = self->_systemAudioVolumeController;
LABEL_31:
      *(float *)&double v22 = v19;
      -[MPVolumeController setVolumeValue:](systemMusicVolumeController, "setVolumeValue:", v22);
      return;
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[PBVolumeHUDManager sharedInstance](&OBJC_CLASS___PBVolumeHUDManager, "sharedInstance"));
    systemMusicRoutingController = self->_systemAudioRoutingController;
LABEL_34:
    double v35 = (void *)objc_claimAutoreleasedReturnValue(-[MPAVRoutingController pickedRoutes](systemMusicRoutingController, "pickedRoutes"));
    char v36 = (void *)objc_claimAutoreleasedReturnValue( +[MPAVRoutingController _symbolImageForRoutes:]( &OBJC_CLASS___MPAVRoutingController,  "_symbolImageForRoutes:",  v35));
    [v33 showVolumeHUDWithImage:v36 level:&off_1003FD7D0];
  }

- (void)setVolumeMuted:(BOOL)a3 forOutputContext:(unint64_t)a4
{
  BOOL v4 = a3;
  if (a4 == 1)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemMusicVolumeController](self, "systemMusicVolumeController"));
    unsigned int v21 = [v20 isMuted];

    id v22 = sub_100082DE4();
    char v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_10027572C();
    }

    if (v21 == v4)
    {
      id v33 = sub_100082DE4();
      float v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_1002756B4();
      }
      goto LABEL_30;
    }

    float v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemMusicVolume](self, "systemMusicVolume"));
    id v24 = sub_100082DE4();
    float v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        float v26 = @"mut";
      }
      else {
        float v26 = @"unmut";
      }
      -[os_log_s floatValue](v10, "floatValue");
      double v28 = v27;
      -[NSNumber floatValue](self->_systemMusicVolume_unmuted, "floatValue");
      int v38 = 138543874;
      __int16 v39 = v26;
      __int16 v40 = 2048;
      double v41 = v28;
      __int16 v42 = 2048;
      double v43 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}@ing System Music (current vol: %f saved vol: %f)",  (uint8_t *)&v38,  0x20u);
    }

    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemMusicVolumeController](self, "systemMusicVolumeController"));
    [v30 setMuted:v4];

    if (v4)
    {
      float v31 = v10;
      systemMusicVolume_unmuted = self->_systemMusicVolume_unmuted;
      self->_systemMusicVolume_unmuted = v31;
    }

    else
    {
      char v36 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemMusicVolumeController](self, "systemMusicVolumeController"));
      int v37 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemMusicVolume_unmuted](self, "systemMusicVolume_unmuted"));
      [v37 floatValue];
      objc_msgSend(v36, "setVolumeValue:");

      systemMusicVolume_unmuted = self->_systemMusicVolume_unmuted;
      self->_systemMusicVolume_unmuted = (NSNumber *)&off_1003FECD0;
    }
  }

  else
  {
    if (a4) {
      return;
    }
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemAudioVolumeController](self, "systemAudioVolumeController"));
    unsigned int v7 = [v6 isMuted];

    id v8 = sub_100082DE4();
    float v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100275618();
    }

    if (v7 == v4)
    {
      id v32 = sub_100082DE4();
      float v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_1002755A0();
      }
      goto LABEL_30;
    }

    float v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemAudioVolume](self, "systemAudioVolume"));
    id v11 = sub_100082DE4();
    float v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        float v13 = @"mut";
      }
      else {
        float v13 = @"unmut";
      }
      -[os_log_s floatValue](v10, "floatValue");
      double v15 = v14;
      -[NSNumber floatValue](self->_systemAudioVolume_unmuted, "floatValue");
      int v38 = 138543874;
      __int16 v39 = v13;
      __int16 v40 = 2048;
      double v41 = v15;
      __int16 v42 = 2048;
      double v43 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ing System Audio (current vol: %f saved vol: %f)",  (uint8_t *)&v38,  0x20u);
    }

    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemAudioVolumeController](self, "systemAudioVolumeController"));
    [v17 setMuted:v4];

    if (v4)
    {
      float v18 = v10;
      systemMusicVolume_unmuted = self->_systemAudioVolume_unmuted;
      self->_systemAudioVolume_unmuted = v18;
    }

    else
    {
      double v34 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemAudioVolumeController](self, "systemAudioVolumeController"));
      double v35 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemAudioVolume_unmuted](self, "systemAudioVolume_unmuted"));
      [v35 floatValue];
      objc_msgSend(v34, "setVolumeValue:");

      systemMusicVolume_unmuted = self->_systemAudioVolume_unmuted;
      self->_systemAudioVolume_unmuted = (NSNumber *)&off_1003FECD0;
    }
  }

LABEL_30:
}

- ($95A7711724258D2DBCF2C7E5A2AF8B2C)currentVolumeStateForOutputContext:(unint64_t)a3
{
  id v5 = sub_100082DE4();
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 134217984;
    unint64_t v21 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Get current volume state for category: %lu",  (uint8_t *)&v20,  0xCu);
  }

  if (a3 == 1)
  {
    float v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemMusicVolumeController](self, "systemMusicVolumeController"));
    [v12 volumeValue];
    unsigned int v14 = v13;

    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemMusicVolumeController](self, "systemMusicVolumeController"));
    LODWORD(v12) = [v15 isMuted];

    unsigned int v11 = v14;
    if (!(_DWORD)v12) {
      goto LABEL_12;
    }
  }

  else
  {
    if (a3)
    {
      id v17 = sub_100082DE4();
      float v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1002757A4();
      }

      unsigned int v11 = 0;
      goto LABEL_12;
    }

    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[PBVolumeController systemAudioVolumeController](self, "systemAudioVolumeController"));
    [(id)v7 volumeValue];
    unsigned int v9 = v8;

    float v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemAudioVolumeController](self, "systemAudioVolumeController"));
    LOBYTE(v7) = [v10 isMuted];

    unsigned int v11 = v9;
    if ((v7 & 1) == 0)
    {
LABEL_12:
      float v16 = 0LL;
      return ($95A7711724258D2DBCF2C7E5A2AF8B2C)((unint64_t)v16 | v11);
    }
  }

  float v16 = &_mh_execute_header;
  return ($95A7711724258D2DBCF2C7E5A2AF8B2C)((unint64_t)v16 | v11);
}

- (BOOL)volumeSupportedForOutputContext:(unint64_t)a3
{
  uint64_t v3 = 9LL;
  if (!a3) {
    uint64_t v3 = 10LL;
  }
  return *((_BYTE *)&self->super.isa + v3);
}

- (BOOL)airPlayActiveForOutputContext:(unint64_t)a3
{
  BOOL v5 = -[PBVolumeController isReady](self, "isReady");
  if (v5)
  {
    uint64_t v6 = 6LL;
    if (a3 == 1) {
      uint64_t v6 = 5LL;
    }
    LOBYTE(v5) = -[PBVolumeController airPlayActiveForRoutingController:]( self,  "airPlayActiveForRoutingController:",  (&self->super.isa)[v6]);
  }

  return v5;
}

- (BOOL)bluetoothActiveForOutputContext:(unint64_t)a3
{
  BOOL v5 = -[PBVolumeController isReady](self, "isReady");
  if (v5)
  {
    uint64_t v6 = 6LL;
    if (a3 == 1) {
      uint64_t v6 = 5LL;
    }
    LOBYTE(v5) = -[PBVolumeController bluetoothActiveForRoutingController:]( self,  "bluetoothActiveForRoutingController:",  (&self->super.isa)[v6]);
  }

  return v5;
}

- (BOOL)odeonActiveForOutputContext:(unint64_t)a3
{
  BOOL v5 = -[PBVolumeController isReady](self, "isReady");
  if (v5)
  {
    if (a3 == 1)
    {
      BOOL v5 = -[PBVolumeController odeonActiveForRoutingController:]( self,  "odeonActiveForRoutingController:",  self->_systemMusicRoutingController);
      if (v5) {
        LOBYTE(v5) = !-[PBVolumeController bluetoothActiveForRoutingController:]( self,  "bluetoothActiveForRoutingController:",  self->_systemAudioRoutingController);
      }
    }

    else
    {
      LOBYTE(v5) = -[PBVolumeController odeonActiveForRoutingController:]( self,  "odeonActiveForRoutingController:",  self->_systemAudioRoutingController);
    }
  }

  return v5;
}

- (void)setVolumeNotificationsEnabled:(BOOL)a3 forOutputContext:(unint64_t)a4
{
  BOOL v5 = a3;
  id v7 = sub_100082DE4();
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109376;
    v10[1] = v5;
    __int16 v11 = 2048;
    unint64_t v12 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Set volume notifications enabled %d for category: %lu",  (uint8_t *)v10,  0x12u);
  }

  if (a4)
  {
    if (a4 != 1) {
      return;
    }
    uint64_t v9 = 11LL;
  }

  else
  {
    uint64_t v9 = 12LL;
  }

  *((_BYTE *)&self->super.isa + v9) = v5;
}

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (MPVolumeController *)a3;
  id v7 = sub_100082DE4();
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    float v10 = "[System Audio]";
    if (self->_systemMusicVolumeController == v6) {
      float v10 = "[System Music]";
    }
    *(_DWORD *)buf = 67109378;
    BOOL v13 = v4;
    __int16 v14 = 2082;
    double v15 = v10;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Volume control available did change %d for %{public}s",  buf,  0x12u);
  }

  dispatch_time_t v9 = dispatch_time(0LL, 100000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000626E8;
  block[3] = &unk_1003CFF08;
  block[4] = self;
  dispatch_after(v9, &_dispatch_main_q, block);
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4 silenceVolumeHUD:(BOOL)a5
{
  unsigned int v8 = (MPVolumeController *)a3;
  id v9 = sub_100082DE4();
  float v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v12 = "[System Audio]";
    if (self->_systemMusicVolumeController == v8) {
      unint64_t v12 = "[System Music]";
    }
    *(_DWORD *)buf = 134218242;
    double v16 = a4;
    __int16 v17 = 2082;
    float v18 = v12;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Volume value did change %f for %{public}s",  buf,  0x16u);
  }

  dispatch_time_t v11 = dispatch_time(0LL, 100000000LL);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100062854;
  v13[3] = &unk_1003D2008;
  void v13[4] = self;
  BOOL v14 = a5;
  dispatch_after(v11, &_dispatch_main_q, v13);
}

- (void)volumeController:(id)a3 mutedStateDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemAudioVolumeController](self, "systemAudioVolumeController"));

  if (v7 == v6)
  {
    id v9 = @"System Audio";
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemMusicVolumeController](self, "systemMusicVolumeController"));

    if (v8 == v6) {
      id v9 = @"System Music";
    }
    else {
      id v9 = @"other";
    }
  }

  id v10 = sub_100082C7C();
  dispatch_time_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      unint64_t v12 = @"mut";
    }
    else {
      unint64_t v12 = @"unmut";
    }
    int v14 = 138543874;
    else {
      BOOL v13 = @"unmut";
    }
    double v15 = v9;
    __int16 v16 = 2114;
    __int16 v17 = v12;
    __int16 v18 = 2114;
    float v19 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ mute changed to %{public}@ed (fetched value %{public}@ed)",  (uint8_t *)&v14,  0x20u);
  }
}

- (void)routingController:(id)a3 pickedRoutesDidChange:(id)a4
{
  id v5 = a4;
  id v6 = sub_100082DE4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100275810();
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100062A70;
  block[3] = &unk_1003CFF08;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5
{
  id v6 = (PBSBulletin *)a4;
  id v7 = v6;
  if (self->_volumeBulletin == v6)
  {
    self->_volumeBulletin = 0LL;
  }
}

- (void)_setNeedsVolumeUpdateWithReason:(id)a3 silenceVolumeHUD:(BOOL)a4
{
  id v6 = a3;
  BOOL updatingVolumeValues = self->_updatingVolumeValues;
  id v8 = sub_100082DE4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (updatingVolumeValues)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Skipping volume update for reason: %{public}@ because one is already in progress",  buf,  0xCu);
    }
  }

  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Performing volume update for reason: %{public}@",  buf,  0xCu);
    }

    self->_BOOL updatingVolumeValues = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100062C40;
    block[3] = &unk_1003D1490;
    block[4] = self;
    id v12 = v6;
    BOOL v13 = a4;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)_updateVolumeWithReason:(id)a3 silenceVolumeHUD:(BOOL)a4
{
  BOOL v4 = a4;
  double v87 = COERCE_DOUBLE(a3);
  if (-[PBVolumeController isReady](self, "isReady"))
  {
    BOOL v77 = v4;
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[MPAVRoutingController pickedRoutes](self->_systemAudioRoutingController, "pickedRoutes"));
    id v7 = (void *)v6;
    if (v6) {
      id v8 = (void *)v6;
    }
    else {
      id v8 = &__NSArray0__struct;
    }
    id v9 = v8;

    id obj = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
    id v10 = [v9 indexOfObjectPassingTest:&stru_1003D2600];
    BOOL v79 = v10 != (id)0x7FFFFFFFFFFFFFFFLL;
    if (v10 == (id)0x7FFFFFFFFFFFFFFFLL
      && -[MPVolumeController isVolumeControlAvailable]( self->_systemAudioVolumeController,  "isVolumeControlAvailable"))
    {
      -[MPVolumeController volumeValue](self->_systemAudioVolumeController, "volumeValue");
      dispatch_time_t v11 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
      int v12 = 1;
    }

    else
    {
      dispatch_time_t v11 = 0LL;
      int v12 = 0;
    }

    systemAudioVolume = self->_systemAudioVolume;
    int systemAudioVolumeSupported = self->_systemAudioVolumeSupported;
    if (systemAudioVolume == v11) {
      unsigned int v15 = 0;
    }
    else {
      unsigned int v15 = -[NSNumber isEqual:](systemAudioVolume, "isEqual:", v11) ^ 1;
    }
    unsigned int v16 = -[NSSet isEqualToSet:](self->_systemAudioRoutes, "isEqualToSet:", obj);
    unsigned int v81 = 0;
    if (systemAudioVolumeSupported == v12 && self->_systemAudioVolumeNotificationsEnabled && v12 && v15 | v16 ^ 1) {
      unsigned int v81 = !-[PBDistributedAssertion isActive](self->_suppressVolumeHUDAssertion, "isActive");
    }
    id v17 = sub_100082DE4();
    __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    unsigned int v85 = v12;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      BOOL systemAudioVolumeNotificationsEnabled = self->_systemAudioVolumeNotificationsEnabled;
      unsigned int v20 = -[MPVolumeController isMuted](self->_systemAudioVolumeController, "isMuted");
      *(_DWORD *)buf = 138545154;
      double v89 = v87;
      __int16 v90 = 1024;
      *(_DWORD *)v91 = v12;
      *(_WORD *)&v91[4] = 2114;
      *(void *)&v91[6] = v11;
      *(_WORD *)&v91[14] = 1024;
      *(_DWORD *)&v91[16] = systemAudioVolumeNotificationsEnabled;
      LOWORD(v92) = 1024;
      *(_DWORD *)((char *)&v92 + 2) = v20;
      HIWORD(v92) = 1024;
      BOOL v93 = v79;
      __int16 v94 = 1024;
      unsigned int v95 = v81;
      __int16 v96 = 2114;
      id v97 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Update Volume (System Audio) for reason %{public}@:\n volumeAvailable: %{BOOL}d\n volume: %{public}@\n notificationsEnabled: %{BOOL}d\n muted: %{BOOL}d includesHDMI: %{BOOL}d\n shouldNotifyForSystemAudio: %{BOOL}d\n routes: %{public}@",  buf,  0x3Eu);
    }

    objc_storeStrong((id *)&self->_systemAudioVolume, v11);
    -[NSNumber floatValue](v11, "floatValue");
    if (v21 > 0.0)
    {
      id v22 = sub_100082DE4();
      char v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        sub_1002758D0();
      }

      objc_storeStrong((id *)&self->_systemAudioVolume_unmuted, v11);
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemAudioVolumeController](self, "systemAudioVolumeController"));
      [v24 setMuted:0];
    }

    self->_int systemAudioVolumeSupported = v12;
    objc_storeStrong((id *)&self->_systemAudioRoutes, obj);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(-[MPAVRoutingController pickedRoutes](self->_systemMusicRoutingController, "pickedRoutes"));
    float v26 = (void *)v25;
    if (v25) {
      float v27 = (void *)v25;
    }
    else {
      float v27 = &__NSArray0__struct;
    }
    id v28 = v27;

    uint64_t v29 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v28));
    v80 = v28;
    id v30 = [v28 indexOfObjectPassingTest:&stru_1003D2620];
    unsigned int v31 = -[MPVolumeController isVolumeControlAvailable]( self->_systemMusicVolumeController,  "isVolumeControlAvailable");
    unsigned int v32 = v31;
    if (v30 == (id)0x7FFFFFFFFFFFFFFFLL) {
      unsigned int v33 = v31;
    }
    else {
      unsigned int v33 = 0;
    }
    if (v33 == 1)
    {
      -[MPVolumeController volumeValue](self->_systemMusicVolumeController, "volumeValue");
      uint64_t v34 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
    }

    else
    {
      uint64_t v34 = 0LL;
    }

    v78 = v11;
    systemMusicVolume = self->_systemMusicVolume;
    int systemMusicVolumeSupported = self->_systemMusicVolumeSupported;
    char v36 = (NSNumber *)v34;
    if (systemMusicVolume == (NSNumber *)v34) {
      unsigned int v37 = 0;
    }
    else {
      unsigned int v37 = -[NSNumber isEqual:](systemMusicVolume, "isEqual:", v34) ^ 1;
    }
    unsigned int v38 = -[NSSet isEqualToSet:](self->_systemMusicRoutes, "isEqualToSet:", v29);
    unsigned int v39 = 0;
    id v84 = (id)v29;
    if (systemMusicVolumeSupported == v33 && self->_systemMusicVolumeNotificationsEnabled && v33 && v37 | v38 ^ 1) {
      unsigned int v39 = !-[PBDistributedAssertion isActive](self->_suppressVolumeHUDAssertion, "isActive");
    }
    id v40 = sub_100082DE4();
    double v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v42 = v32;
      id v43 = v9;
      BOOL systemMusicVolumeNotificationsEnabled = self->_systemMusicVolumeNotificationsEnabled;
      unsigned int v45 = -[MPVolumeController isMuted](self->_systemMusicVolumeController, "isMuted");
      *(_DWORD *)buf = 138545154;
      double v89 = v87;
      __int16 v90 = 1024;
      *(_DWORD *)v91 = v42;
      *(_WORD *)&v91[4] = 2114;
      *(void *)&v91[6] = v36;
      *(_WORD *)&v91[14] = 1024;
      *(_DWORD *)&v91[16] = systemMusicVolumeNotificationsEnabled;
      id v9 = v43;
      LOWORD(v92) = 1024;
      *(_DWORD *)((char *)&v92 + 2) = v45;
      HIWORD(v92) = 1024;
      BOOL v93 = v30 != (id)0x7FFFFFFFFFFFFFFFLL;
      __int16 v94 = 1024;
      unsigned int v95 = v39;
      __int16 v96 = 2114;
      id v97 = v80;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Update Volume (System Music) for reason %{public}@:\n volumeAvailable: %{BOOL}d\n volume: %{public}@\n notificationsEnabled: %{BOOL}d\n muted: %{BOOL}d includesHDMI: %{BOOL}d\n shouldNotifyForSystemMusic: %{BOOL}d\n routes: %{public}@",  buf,  0x3Eu);
    }

    double v46 = v36;
    objc_storeStrong((id *)&self->_systemMusicVolume, v36);
    -[NSNumber floatValue](self->_systemMusicVolume, "floatValue");
    if (v47 > 0.0)
    {
      id v48 = sub_100082DE4();
      v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        sub_100275870();
      }

      objc_storeStrong((id *)&self->_systemMusicVolume_unmuted, self->_systemMusicVolume);
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeController systemMusicVolumeController](self, "systemMusicVolumeController"));
      [v50 setMuted:0];
    }

    self->_int systemMusicVolumeSupported = v33;
    objc_storeStrong((id *)&self->_systemMusicRoutes, v84);
    if (self->_systemMusicVolumeNotificationsEnabled) {
      BOOL v51 = v30 != (id)0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      BOOL v51 = v79;
    }
    if (!v51)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue( +[PBCaptionsOnMuteController sharedInstance]( &OBJC_CLASS___PBCaptionsOnMuteController,  "sharedInstance"));
      [v52 noteVolumeLevel:&off_1003FE9F0 fromSource:0 sourceTracksVolumeLevel:0];
    }

    v53 = (void *)objc_claimAutoreleasedReturnValue( +[PBCaptionsOnMuteController sharedInstance]( &OBJC_CLASS___PBCaptionsOnMuteController,  "sharedInstance"));
    v54 = v53;
    if (self->_systemMusicVolumeNotificationsEnabled) {
      v55 = v46;
    }
    else {
      v55 = v78;
    }
    if (self->_systemMusicVolumeNotificationsEnabled) {
      uint64_t v56 = v33;
    }
    else {
      uint64_t v56 = v85;
    }
    [v53 noteVolumeLevel:v55 fromSource:1 sourceTracksVolumeLevel:v56];

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeController delegate](self, "delegate"));
    if (systemAudioVolumeSupported != v85)
    {
      id v58 = sub_100082DE4();
      v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v89) = v85;
        _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "Volume Supported Changed (System Audio) to %d",  buf,  8u);
      }

      [v57 volumeSupportedChanged:self forOutputContext:0];
    }

    if (systemMusicVolumeSupported != v33)
    {
      id v60 = sub_100082DE4();
      v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v89) = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "Volume Supported Changed (System Music) to %d",  buf,  8u);
      }

      [v57 volumeSupportedChanged:self forOutputContext:1];
    }

    if ((v39 | v81) == 1)
    {
      id v62 = v9;
      p_systemAudioVolume = &self->_systemAudioVolume;
      if (v39)
      {
        p_systemAudioVolume = &self->_systemMusicVolume;
        p_systemMusicRoutingController = &self->_systemMusicRoutingController;
      }

      else
      {
        p_systemMusicRoutingController = &self->_systemAudioRoutingController;
      }

      -[NSNumber floatValue](*p_systemAudioVolume, "floatValue");
      float v66 = v65;
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[MPAVRoutingController pickedRoutes](*p_systemMusicRoutingController, "pickedRoutes"));
      id v68 = [v67 count];
      id v69 = sub_100082DE4();
      v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
      v71 = v70;
      if (!v68 || v77)
      {
        if (v77)
        {
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(double *)&v75 = COERCE_DOUBLE("System Audio");
            if (v39) {
              *(double *)&v75 = COERCE_DOUBLE("System Music");
            }
            *(_DWORD *)buf = 136446722;
            double v89 = *(double *)&v75;
            __int16 v90 = 2114;
            *(void *)v91 = v67;
            *(_WORD *)&v91[8] = 2048;
            *(double *)&v91[10] = v66;
            _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "Silencing volume HUD (%{public}s) for route(s) %{public}@ volume: %f",  buf,  0x20u);
          }
        }

        else if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          v76 = "System Audio";
          *(_DWORD *)buf = 134218498;
          double v89 = v66;
          if (v39) {
            v76 = "System Music";
          }
          __int16 v90 = 2114;
          *(double *)v91 = v87;
          *(_WORD *)&v91[8] = 2082;
          *(void *)&v91[10] = v76;
          _os_log_error_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_ERROR,  "Volume changed to %f for reason %{public}@ but no picked routes for %{public}s",  buf,  0x20u);
        }
      }

      else
      {
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          *(double *)&v72 = COERCE_DOUBLE("System Audio");
          *(_DWORD *)buf = 136446978;
          if (v39) {
            *(double *)&v72 = COERCE_DOUBLE("System Music");
          }
          double v89 = *(double *)&v72;
          __int16 v90 = 2114;
          *(double *)v91 = v87;
          *(_WORD *)&v91[8] = 2114;
          *(void *)&v91[10] = v67;
          *(_WORD *)&v91[18] = 2048;
          double v92 = v66;
          _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "Showing volume HUD (%{public}s) for route(s) for reason %{public}@: %{public}@ volume: %f",  buf,  0x2Au);
        }

        *(float *)&double v73 = v66;
        -[PBVolumeController _presentVolumeBulletinForRoutes:volumeLevel:]( self,  "_presentVolumeBulletinForRoutes:volumeLevel:",  v67,  v73);
      }

      id v9 = v62;
    }

    else
    {
      id v74 = sub_100082DE4();
      v67 = (void *)objc_claimAutoreleasedReturnValue(v74);
      if (os_log_type_enabled((os_log_t)v67, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        double v89 = v87;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v67,  OS_LOG_TYPE_DEFAULT,  "Not showing volume HUD for volume update reason %{public}@",  buf,  0xCu);
      }
    }
  }

  else
  {
    id v13 = sub_100082DE4();
    id v9 = (id)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v89 = v87;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "Skipping volume update for reason %@ because MediaPlayer isn't ready yet.",  buf,  0xCu);
    }
  }
}

- (void)_presentVolumeBulletinForRoutes:(id)a3 volumeLevel:(float)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBVolumeHUDManager sharedInstance](&OBJC_CLASS___PBVolumeHUDManager, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPAVRoutingController _symbolImageForRoutes:]( &OBJC_CLASS___MPAVRoutingController,  "_symbolImageForRoutes:",  v5));

  *(float *)&double v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v8));
  [v6 showVolumeHUDWithImage:v7 level:v9];
}

- (BOOL)airPlayActiveForRoutingController:(id)a3
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue([a3 pickedRoutes]);
  BOOL v4 = (void *)v3;
  id v5 = &__NSArray0__struct;
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  id v7 = [v6 indexOfObjectPassingTest:&stru_1003D2640];
  return v7 != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)bluetoothActiveForRoutingController:(id)a3
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue([a3 pickedRoutes]);
  BOOL v4 = (void *)v3;
  id v5 = &__NSArray0__struct;
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  id v7 = [v6 indexOfObjectPassingTest:&stru_1003D2660];
  return v7 != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)odeonActiveForRoutingController:(id)a3
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue([a3 pickedRoutes]);
  BOOL v4 = (void *)v3;
  id v5 = &__NSArray0__struct;
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  id v7 = [v6 indexOfObjectPassingTest:&stru_1003D2680];
  return v7 != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (float)odeonVolumeStepForCurrentVolume:(float)a3 isIncrementing:(BOOL)a4
{
  double v4 = a3;
  float result = 0.0125;
  if (v4 >= 0.025 && (fabs(v4 + -0.025) >= 0.00000011920929 || a4))
  {
    if (v4 >= 0.2)
    {
      BOOL v7 = fabs(v4 + -0.2) >= 0.00000011920929 || a4;
      float result = 0.025;
      if (v7) {
        return 0.05;
      }
    }

    else
    {
      return 0.025;
    }
  }

  return result;
}

- (PBVolumeControllerDelegate)delegate
{
  return (PBVolumeControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (PBBulletinService)bulletinService
{
  return self->_bulletinService;
}

- (void)setBulletinService:(id)a3
{
}

- (PBSBulletin)volumeBulletin
{
  return self->_volumeBulletin;
}

- (void)setVolumeBulletin:(id)a3
{
}

- (MPAVRoutingController)systemMusicRoutingController
{
  return self->_systemMusicRoutingController;
}

- (MPAVRoutingController)systemAudioRoutingController
{
  return self->_systemAudioRoutingController;
}

- (MPVolumeController)systemMusicVolumeController
{
  return self->_systemMusicVolumeController;
}

- (MPVolumeController)systemAudioVolumeController
{
  return self->_systemAudioVolumeController;
}

- (NSNumber)systemMusicVolume
{
  return self->_systemMusicVolume;
}

- (NSNumber)systemMusicVolume_unmuted
{
  return self->_systemMusicVolume_unmuted;
}

- (NSNumber)systemAudioVolume
{
  return self->_systemAudioVolume;
}

- (NSNumber)systemAudioVolume_unmuted
{
  return self->_systemAudioVolume_unmuted;
}

- (NSSet)systemMusicRoutes
{
  return self->_systemMusicRoutes;
}

- (NSSet)systemAudioRoutes
{
  return self->_systemAudioRoutes;
}

- (BOOL)systemMusicVolumeSupported
{
  return self->_systemMusicVolumeSupported;
}

- (BOOL)systemAudioVolumeSupported
{
  return self->_systemAudioVolumeSupported;
}

- (BOOL)systemMusicVolumeNotificationsEnabled
{
  return self->_systemMusicVolumeNotificationsEnabled;
}

- (BOOL)systemAudioVolumeNotificationsEnabled
{
  return self->_systemAudioVolumeNotificationsEnabled;
}

- (BOOL)updatingVolumeValues
{
  return self->_updatingVolumeValues;
}

- (PBDistributedAssertion)suppressVolumeHUDAssertion
{
  return self->_suppressVolumeHUDAssertion;
}

- (void).cxx_destruct
{
}

  ;
}

@end