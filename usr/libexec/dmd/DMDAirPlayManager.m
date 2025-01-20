@interface DMDAirPlayManager
+ (DMDAirPlayManager)shared;
- (BOOL)_setOutputDevices:(id)a3 forSessionType:(unint64_t)a4 password:(id)a5 error:(id *)a6;
- (BOOL)startAirPlaySessionWithDestinationName:(id)a3 destinationDeviceID:(id)a4 password:(id)a5 scanWaitTime:(double)a6 sessionType:(unint64_t)a7 force:(BOOL)a8 error:(id *)a9;
- (BOOL)stopAirPlaySessionOfType:(unint64_t)a3 error:(id *)a4;
- (NSString)currentlyPickedDestinationDeviceID;
- (NSString)currentlyPickedDestinationName;
- (id)_discoverDeviceWithDestinationDeviceID:(id)a3 scanWaitTime:(double)a4 error:(id *)a5;
- (id)_discoverDeviceWithDestinationName:(id)a3 scanWaitTime:(double)a4 sessionType:(unint64_t)a5;
- (id)_messageForAirPlayPromptOnDisplayNamed:(id)a3;
- (id)initPrivate;
- (void)_outputContextForSessionType:(unint64_t)a3;
- (void)_promptUserToMirrorOnDisplayNamed:(id)a3 withCompletion:(id)a4;
- (void)setCurrentlyPickedDestinationDeviceID:(id)a3;
- (void)setCurrentlyPickedDestinationName:(id)a3;
@end

@implementation DMDAirPlayManager

+ (DMDAirPlayManager)shared
{
  if (qword_1000CCB80 != -1) {
    dispatch_once(&qword_1000CCB80, &stru_10009D8A8);
  }
  return (DMDAirPlayManager *)(id)qword_1000CCB78;
}

- (id)initPrivate
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DMDAirPlayManager;
  v2 = -[DMDAirPlayManager init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    currentlyPickedDestinationName = v2->_currentlyPickedDestinationName;
    v2->_currentlyPickedDestinationName = 0LL;

    currentlyPickedDestinationDeviceID = v3->_currentlyPickedDestinationDeviceID;
    v3->_currentlyPickedDestinationDeviceID = 0LL;
  }

  return v3;
}

- (BOOL)startAirPlaySessionWithDestinationName:(id)a3 destinationDeviceID:(id)a4 password:(id)a5 scanWaitTime:(double)a6 sessionType:(unint64_t)a7 force:(BOOL)a8 error:(id *)a9
{
  BOOL v10 = a8;
  unint64_t v17 = (unint64_t)a3;
  unint64_t v18 = (unint64_t)a4;
  id v19 = a5;
  if (!(v17 | v18))
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v43 handleFailureInMethod:a2 object:self file:@"DMDAirPlayManager.m" lineNumber:72 description:@"must provide a destination name or deviceID"];
  }

  uint64_t v51 = 0LL;
  v52 = &v51;
  uint64_t v53 = 0x3032000000LL;
  v54 = sub_10000CB68;
  v55 = sub_10000CB78;
  id v56 = 0LL;
  double v20 = 10.0;
  if (a6 >= 10.0)
  {
    double v20 = a6;
    if (a6 > 500.0) {
      double v20 = 500.0;
    }
  }

  if (-[DMDAirPlayManager _outputContextForSessionType:](self, "_outputContextForSessionType:", a7))
  {
    v21 = (void *)MRAVOutputContextCopyOutputDevices();
    if ([v21 count])
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 firstObject]);
      v23 = (void *)MRAVOutputDeviceCopyName();
      -[DMDAirPlayManager setCurrentlyPickedDestinationName:](self, "setCurrentlyPickedDestinationName:", v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue([v21 firstObject]);
      v25 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
      -[DMDAirPlayManager setCurrentlyPickedDestinationDeviceID:](self, "setCurrentlyPickedDestinationDeviceID:", v25);
    }

    else
    {
      -[DMDAirPlayManager setCurrentlyPickedDestinationDeviceID:](self, "setCurrentlyPickedDestinationDeviceID:", 0LL);
      -[DMDAirPlayManager setCurrentlyPickedDestinationName:](self, "setCurrentlyPickedDestinationName:", 0LL);
    }
  }

  self->mDeviceIDIsMAC = 0;
  if (v18)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAirPlayManager currentlyPickedDestinationDeviceID](self, "currentlyPickedDestinationDeviceID"));
    unsigned __int8 v27 = [v26 isEqualToString:v18];

    if ((v27 & 1) != 0)
    {
      v28 = 0LL;
LABEL_20:
      BOOL v33 = 1;
      goto LABEL_26;
    }

    if ([(id)v18 containsString:@":"])
    {
      self->mDeviceIDIsMAC = 1;
      id v29 = (id)v18;

      v28 = 0LL;
      unint64_t v17 = (unint64_t)v29;
    }

    else
    {
      v30 = (id *)(v52 + 5);
      id obj = (id)v52[5];
      v28 = (void *)objc_claimAutoreleasedReturnValue( -[DMDAirPlayManager _discoverDeviceWithDestinationDeviceID:scanWaitTime:error:]( self,  "_discoverDeviceWithDestinationDeviceID:scanWaitTime:error:",  v18,  &obj,  v20));
      objc_storeStrong(v30, obj);
      if (!v17) {
        goto LABEL_22;
      }
    }
  }

  else
  {
    v28 = 0LL;
    if (!v17) {
      goto LABEL_22;
    }
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAirPlayManager currentlyPickedDestinationName](self, "currentlyPickedDestinationName"));
  unsigned __int8 v32 = [v31 isEqualToString:v17];

  if ((v32 & 1) != 0) {
    goto LABEL_20;
  }
  uint64_t v34 = objc_claimAutoreleasedReturnValue( -[DMDAirPlayManager _discoverDeviceWithDestinationName:scanWaitTime:sessionType:]( self,  "_discoverDeviceWithDestinationName:scanWaitTime:sessionType:",  v17,  a7,  v20));

  v28 = (void *)v34;
LABEL_22:
  if (!v52[5])
  {
    if ([v28 count])
    {
      if (v10)
      {
        v37 = (id *)(v52 + 5);
        id v49 = (id)v52[5];
        -[DMDAirPlayManager _setOutputDevices:forSessionType:password:error:]( self,  "_setOutputDevices:forSessionType:password:error:",  v28,  a7,  v19,  &v49);
        objc_storeStrong(v37, v49);
      }

      else
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue([v28 objectAtIndexedSubscript:0]);
        v42 = (void *)MRAVOutputDeviceCopyName();
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472LL;
        v44[2] = sub_10000CB80;
        v44[3] = &unk_10009D8D0;
        v44[4] = self;
        id v45 = v28;
        unint64_t v48 = a7;
        id v46 = v19;
        v47 = &v51;
        -[DMDAirPlayManager _promptUserToMirrorOnDisplayNamed:withCompletion:]( self,  "_promptUserToMirrorOnDisplayNamed:withCompletion:",  v42,  v44);
      }
    }

    else
    {
      uint64_t v38 = DMFErrorWithCodeAndUserInfo(1301LL, 0LL);
      uint64_t v39 = objc_claimAutoreleasedReturnValue(v38);
      v40 = (void *)v52[5];
      v52[5] = v39;
    }
  }

  v35 = v52;
  if (a9)
  {
    *a9 = (id) v52[5];
    v35 = v52;
  }

  BOOL v33 = v35[5] == 0;
LABEL_26:

  _Block_object_dispose(&v51, 8);
  return v33;
}

- (BOOL)stopAirPlaySessionOfType:(unint64_t)a3 error:(id *)a4
{
  return -[DMDAirPlayManager _setOutputDevices:forSessionType:password:error:]( self,  "_setOutputDevices:forSessionType:password:error:",  0LL,  a3,  0LL,  a4);
}

- (void)_outputContextForSessionType:(unint64_t)a3
{
  switch(a3)
  {
    case 3uLL:
      return (void *)MRAVOutputContextGetSharedSystemScreenContext(self, a2);
    case 2uLL:
      return (void *)MRAVOutputContextGetSharedSystemAudioContext(self, a2);
    case 1uLL:
      return (void *)MRAVOutputContextGetSharedAudioPresentationContext(self, a2);
  }

  return 0LL;
}

- (BOOL)_setOutputDevices:(id)a3 forSessionType:(unint64_t)a4 password:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  v12 = -[DMDAirPlayManager _outputContextForSessionType:](self, "_outputContextForSessionType:", a4);
  v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v14 = v13;
  if (v11) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v11,  @"AVOutputContextSetOutputDevicePasswordKey");
  }
  if (!v12)
  {
    uint64_t v23 = DMFErrorWithCodeAndUserInfo(1302LL, 0LL);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if (!a6) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  SEL v15 = NSSelectorFromString(@"avOutputContext");
  if ((objc_opt_respondsToSelector(v12, v15) & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForKey:@"avOutputContext"]);
    unint64_t v17 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", getpid());
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    [v16 setValue:v18 forKey:@"applicationProcessID"];

    SEL v19 = NSSelectorFromString(@"avOutputDevice");
    double v20 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
    LOBYTE(v19) = objc_opt_respondsToSelector(v20, v19);

    if ((v19 & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 valueForKey:@"avOutputDevice"]);
    }

    else
    {
      v22 = 0LL;
    }

    SEL v25 = NSSelectorFromString(@"setOutputDevice:options:");
    if ((objc_opt_respondsToSelector(v16, v25) & 1) != 0) {
      ((void (*)(void *, SEL, void *, NSMutableDictionary *))[v16 methodForSelector:v25])( v16,  v25,  v22,  v14);
    }
  }

  v24 = 0LL;
  if (a6) {
LABEL_14:
  }
    *a6 = v24;
LABEL_15:

  return v24 == 0LL;
}

- (void)_promptUserToMirrorOnDisplayNamed:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  SEL v19 = objc_opt_new(&OBJC_CLASS___DMDUserNotification);
  v8 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"AirPlay" value:&stru_10009F768 table:@"DMFNotifications"]);
  -[DMDUserNotification setHeader:](v19, "setHeader:", v10);

  id v11 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"Display" value:&stru_10009F768 table:@"DMFNotifications"]);
  -[DMDUserNotification setDefaultButtonTitle:](v19, "setDefaultButtonTitle:", v13);

  v14 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
  SEL v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"Cancel" value:&stru_10009F768 table:@"DMFNotifications"]);
  -[DMDUserNotification setAlternateButtonTitle:](v19, "setAlternateButtonTitle:", v16);

  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[DMDAirPlayManager _messageForAirPlayPromptOnDisplayNamed:]( self,  "_messageForAirPlayPromptOnDisplayNamed:",  v7));
  -[DMDUserNotification setMessage:](v19, "setMessage:", v17);

  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[DMDUserNotificationController sharedController]( &OBJC_CLASS___DMDUserNotificationController,  "sharedController"));
  [v18 showNotification:v19 completion:v6];
}

- (id)_messageForAirPlayPromptOnDisplayNamed:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeviceController shared](&OBJC_CLASS___DMDDeviceController, "shared"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceType]);
  id v6 = [v5 unsignedIntegerValue];

  switch((unint64_t)v6)
  {
    case 1uLL:
      id v7 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = v8;
      id v10 = @"Would you like to display your iPhone's screen on “%@”?";
      break;
    case 2uLL:
      id v11 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
      v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v9 = v8;
      id v10 = @"Would you like to display your iPod's screen on “%@”?";
      break;
    case 3uLL:
      v12 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
      v8 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v9 = v8;
      id v10 = @"Would you like to display your iPad's screen on “%@”?";
      break;
    case 4uLL:
      v13 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
      v8 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v9 = v8;
      id v10 = @"Would you like to display your Apple TV's output on “%@”?";
      break;
    case 7uLL:
      SEL v15 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
      v8 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v9 = v8;
      id v10 = @"Would you like to display your Mac's screen on “%@”?";
      break;
    case 8uLL:
      v16 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
      v8 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v9 = v8;
      id v10 = @"Would you like to display your Apple Vision Pro's screen on “%@”?";
      break;
    default:
      v14 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
      v8 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v9 = v8;
      id v10 = @"Would you like to display your device's screen on “%@”?";
      break;
  }

  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:v10 value:&stru_10009F768 table:@"DMFNotifications"]);
  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v17, v3));

  return v18;
}

- (id)_discoverDeviceWithDestinationDeviceID:(id)a3 scanWaitTime:(double)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v24 = 0LL;
  SEL v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  unsigned __int8 v27 = sub_10000CB68;
  v28 = sub_10000CB78;
  id v29 = 0LL;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  uint64_t v23 = 0LL;
  id v30 = v7;
  v8 = (const void *)MRAVReconnaissanceSessionCreateWithEndpointFeatures( +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL),  2LL);
  MRAVReconnaissanceSessionSetUseWeakMatching(v8, 1LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D428;
  block[3] = &unk_10009D920;
  double v19 = a4;
  v16 = &v20;
  unint64_t v17 = &v24;
  unint64_t v18 = v8;
  v9 = dispatch_semaphore_create(0LL);
  SEL v15 = v9;
  dispatch_async(&_dispatch_main_q, block);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  CFRelease(v8);
  id v10 = (void *)v21[3];
  if (a5) {
    *a5 = (id) v25[5];
  }
  id v11 = v15;
  id v12 = v10;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (id)_discoverDeviceWithDestinationName:(id)a3 scanWaitTime:(double)a4 sessionType:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  SEL v25 = sub_10000CB68;
  uint64_t v26 = sub_10000CB78;
  id v27 = 0LL;
  if (a5 == 3) {
    uint64_t v9 = 2LL;
  }
  else {
    uint64_t v9 = 1LL;
  }
  id v10 = (const void *)MRAVRoutingDiscoverySessionCreate(v9);
  MRAVRoutingDiscoverySessionSetDiscoveryMode(v10, 3LL);
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000D71C;
  v18[3] = &unk_10009D948;
  v18[4] = self;
  id v12 = v8;
  id v19 = v12;
  v21 = &v22;
  v13 = v11;
  uint64_t v20 = v13;
  uint64_t v14 = MRAVRoutingDiscoverySessionAddOutputDevicesChangedCallback(v10, v18);
  dispatch_time_t v15 = dispatch_time(0LL, (uint64_t)(a4 * 1000000000.0));
  dispatch_semaphore_wait(v13, v15);
  if (v14) {
    MRAVRoutingDiscoverySessionRemoveOutputDevicesChangedCallback(v10, v14);
  }
  CFRelease(v10);
  id v16 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v16;
}

- (NSString)currentlyPickedDestinationName
{
  return self->_currentlyPickedDestinationName;
}

- (void)setCurrentlyPickedDestinationName:(id)a3
{
}

- (NSString)currentlyPickedDestinationDeviceID
{
  return self->_currentlyPickedDestinationDeviceID;
}

- (void)setCurrentlyPickedDestinationDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end