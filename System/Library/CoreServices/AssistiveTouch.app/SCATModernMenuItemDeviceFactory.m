@interface SCATModernMenuItemDeviceFactory
+ (id)_stringForRingerOn:(BOOL)a3;
+ (id)itemDetailsForItem:(id)a3 menu:(id)a4;
+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)updateBlockForIdentifier:(id)a3;
+ (void)_handleSpeakThis:(id)a3;
+ (void)_handleSysdiagnose:(id)a3;
@end

@implementation SCATModernMenuItemDeviceFactory

+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "itemDetailsForItem:menu:", v8, v9, 0));
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue( [a1 menuItemWithItemDictionary:*(void *)(*((void *)&v19 + 1) + 8 * (void)v16) menu:v9 delegate:v10]);
        -[NSMutableArray addObject:](v11, "addObject:", v17);

        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v14);
  }

  return v11;
}

+ (id)itemDetailsForItem:(id)a3 menu:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 isEqualToString:AXSSwitchControlMenuItemDeviceAppSwitcher])
  {
    if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceNotificationCenter])
    {
      v147[0] = @"device_notificationCenter";
      v146[0] = @"identifier";
      v146[1] = @"title";
      id v12 = sub_10002B014(@"Device-Notification-Center");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v146[2] = @"activateBehavior";
      v147[1] = v9;
      v147[2] = &off_10012FB98;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v147,  v146,  3LL));
      v148 = v10;
      v11 = &v148;
      goto LABEL_11;
    }

    if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceControlCenter])
    {
      v144[0] = @"device_controlCenter";
      v143[0] = @"identifier";
      v143[1] = @"title";
      id v13 = sub_10002B014(@"Device-Control-Center");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v143[2] = @"activateBehavior";
      v144[1] = v9;
      v144[2] = &off_10012FB98;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v144,  v143,  3LL));
      v145 = v10;
      v11 = &v145;
      goto LABEL_11;
    }

    if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceLockScreen])
    {
      v141[0] = @"device_lock";
      v140[0] = @"identifier";
      v140[1] = @"title";
      id v14 = sub_10002B014(@"LOCK");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v140[2] = @"activateBehavior";
      v141[1] = v9;
      v141[2] = &off_10012FBB0;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v141,  v140,  3LL));
      v142 = v10;
      v11 = &v142;
      goto LABEL_11;
    }

    if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceRotateScreen])
    {
      v138[0] = @"device_rotate";
      v137[0] = @"identifier";
      v137[1] = @"title";
      id v15 = sub_10002B014(@"ORIENTATION");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v137[2] = @"activateBehavior";
      v138[1] = v9;
      v138[2] = &off_10012FB98;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v138,  v137,  3LL));
      v139 = v10;
      v11 = &v139;
      goto LABEL_11;
    }

    if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceMute])
    {
      v135[0] = @"device_mute";
      v134[0] = @"identifier";
      v134[1] = @"title";
      id v18 = [a1 _stringForRingerOn:sub_10002ADD8()];
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v134[2] = @"activateBehavior";
      v135[1] = v19;
      v135[2] = &off_10012FBC8;
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v135,  v134,  3LL));
      v136 = v20;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v136, 1LL));

      if (!AXDeviceHasStaccato(v21, v22))
      {
        id v16 = v9;
        goto LABEL_13;
      }

      v132[0] = @"device_mute";
      v131[0] = @"identifier";
      v131[1] = @"title";
      id v23 = sub_10002B14C(@"ACTION_BUTTON");
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v131[2] = @"activateBehavior";
      v132[1] = v10;
      v132[2] = &off_10012FBC8;
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v132,  v131,  3LL));
      v133 = v24;
      v25 = &v133;
      goto LABEL_18;
    }

    if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceVolumeUpDown])
    {
      v129[0] = @"device_volumeDown";
      v128[0] = @"identifier";
      v128[1] = @"title";
      id v26 = sub_10002B014(@"VOLUME_DOWN");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v129[1] = v9;
      v129[2] = &off_10012FBC8;
      v128[2] = @"activateBehavior";
      v128[3] = @"menuItemGroup";
      v129[3] = @"menuItemGroupVolume";
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v129,  v128,  4LL));
      v130[0] = v10;
      v127[0] = @"device_volumeUp";
      v126[0] = @"identifier";
      v126[1] = @"title";
      id v27 = sub_10002B014(@"VOLUME_UP");
      v24 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v127[1] = v24;
      v127[2] = &off_10012FBC8;
      v126[2] = @"activateBehavior";
      v126[3] = @"menuItemGroup";
      v127[3] = @"menuItemGroupVolume";
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v127,  v126,  4LL));
      v130[1] = v28;
      v29 = v130;
LABEL_21:
      id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));

      goto LABEL_22;
    }

    if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceSpotlightSearch])
    {
      v124[0] = @"device_spotlightSearch";
      v123[0] = @"identifier";
      v123[1] = @"title";
      id v30 = sub_10002B014(@"SPOTLIGHT_SEARCH");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v123[2] = @"activateBehavior";
      v124[1] = v9;
      v124[2] = &off_10012FBB0;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v124,  v123,  3LL));
      v125 = v10;
      v11 = &v125;
      goto LABEL_11;
    }

    id v31 = [v6 isEqualToString:AXSSwitchControlMenuItemDeviceSiriVoiceControl];
    if ((_DWORD)v31)
    {
      if ((j__AXDeviceIsSiriAvailable(v31) & 1) != 0)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[AXSystemAppServer server](&OBJC_CLASS___AXSystemAppServer, "server"));
        unsigned __int8 v33 = [v32 isSiriVisible];

        if ((v33 & 1) == 0)
        {
          v118[0] = @"device_siri";
          v117[0] = @"identifier";
          v117[1] = @"title";
          id v34 = sub_10002B014(@"SCAT_QUICK_ITEM_SIRI");
          id v9 = (void *)objc_claimAutoreleasedReturnValue(v34);
          v117[2] = @"activateBehavior";
          v118[1] = v9;
          v118[2] = &off_10012FB98;
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v118,  v117,  3LL));
          v119 = v10;
          v11 = &v119;
          goto LABEL_11;
        }
      }

      else if (j__AXDeviceIsVoiceControlAvailable())
      {
        v121[0] = @"device_voiceControl";
        v120[0] = @"identifier";
        v120[1] = @"title";
        id v36 = sub_10002B014(@"SCAT_QUICK_ITEM_VOICE_CONTROL");
        id v9 = (void *)objc_claimAutoreleasedReturnValue(v36);
        v120[2] = @"activateBehavior";
        v121[1] = v9;
        v121[2] = &off_10012FB98;
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v121,  v120,  3LL));
        v122 = v10;
        v11 = &v122;
        goto LABEL_11;
      }

      goto LABEL_42;
    }

    if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceTripleClick])
    {
      v115[0] = @"device_tripleClick";
      v114[0] = @"identifier";
      v114[1] = @"title";
      id v35 = sub_10002B014(@"TRIPLE_CLICK");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v115[1] = v9;
      v115[2] = &off_10012FBB0;
      v114[2] = @"activateBehavior";
      v114[3] = @"assistiveAccess";
      v114[4] = @"guidedAccess";
      v115[3] = &__kCFBooleanTrue;
      v115[4] = &__kCFBooleanTrue;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v115,  v114,  5LL));
      v116 = v10;
      v11 = &v116;
      goto LABEL_11;
    }

    if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceShake])
    {
      v112[0] = @"device_shake";
      v111[0] = @"identifier";
      v111[1] = @"imageName";
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString sc_deviceIconNameForIdentifier:]( &OBJC_CLASS___NSString,  "sc_deviceIconNameForIdentifier:"));
      v112[1] = v9;
      v111[2] = @"title";
      id v37 = sub_10002B014(@"SHAKE");
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v37);
      v112[2] = v10;
      v112[3] = &off_10012FBB0;
      v111[3] = @"activateBehavior";
      v111[4] = @"guidedAccess";
      v112[4] = &__kCFBooleanTrue;
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v112,  v111,  5LL));
      v113 = v24;
      v25 = &v113;
    }

    else
    {
      if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceScreenshot])
      {
        v109[0] = @"device_screenshot";
        v108[0] = @"identifier";
        v108[1] = @"title";
        id v38 = sub_10002B014(@"SCREENSHOT");
        id v9 = (void *)objc_claimAutoreleasedReturnValue(v38);
        v108[2] = @"activateBehavior";
        v109[1] = v9;
        v109[2] = &off_10012FBB0;
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v109,  v108,  3LL));
        v110 = v10;
        v11 = &v110;
        goto LABEL_11;
      }

      if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceIncreaseDecreaseZoom])
      {
        if (_AXSZoomTouchEnabled())
        {
          v106[0] = @"action_zoomOut";
          v105[0] = @"identifier";
          v105[1] = @"title";
          id v39 = sub_10002B014(@"DECREASE_ZOOM");
          id v9 = (void *)objc_claimAutoreleasedReturnValue(v39);
          v106[1] = v9;
          v106[2] = &off_10012FBC8;
          v105[2] = @"activateBehavior";
          v105[3] = @"guidedAccess";
          v105[4] = @"menuItemGroup";
          v106[3] = &__kCFBooleanTrue;
          v106[4] = @"menuItemGroupZoom";
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v106,  v105,  5LL));
          v107[0] = v10;
          v104[0] = @"action_zoomIn";
          v103[0] = @"identifier";
          v103[1] = @"title";
          id v40 = sub_10002B014(@"INCREASE_ZOOM");
          v24 = (void *)objc_claimAutoreleasedReturnValue(v40);
          v104[1] = v24;
          v104[2] = &off_10012FBC8;
          v103[2] = @"activateBehavior";
          v103[3] = @"guidedAccess";
          v103[4] = @"menuItemGroup";
          v104[3] = &__kCFBooleanTrue;
          v104[4] = @"menuItemGroupZoom";
          v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v104,  v103,  5LL));
          v107[1] = v28;
          v29 = v107;
          goto LABEL_21;
        }

+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"identifier"]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"title"]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"imageName"]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"activateBehavior"]);
  id v28 = [v11 unsignedIntegerValue];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"guidedAccess"]);
  id v13 = [v12 BOOLValue];

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"assistiveAccess"]);
  id v15 = v14;
  unsigned __int8 v16 = v13;
  if (v14) {
    unsigned __int8 v16 = [v14 BOOLValue];
  }
  if ([v9 isEqualToString:@"device_siri"])
  {
    id v18 = &stru_100124D38;
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"device_voiceControl"])
  {
    id v18 = &stru_100124D58;
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"device_appSwitcher"])
  {
    id v18 = &stru_100124D78;
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"device_notificationCenter"])
  {
    id v18 = &stru_100124D98;
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"device_controlCenter"])
  {
    id v18 = &stru_100124DB8;
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"device_lock"])
  {
    id v18 = &stru_100124DD8;
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"device_rotate"])
  {
    id v18 = &stru_100124DF8;
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"device_mute"])
  {
    id v18 = &stru_100124E18;
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"device_volumeDown"])
  {
    id v18 = &stru_100124E38;
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"device_volumeUp"])
  {
    id v18 = &stru_100124E58;
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"device_tripleClick"])
  {
    id v18 = &stru_100124E78;
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"device_shake"])
  {
    id v18 = &stru_100124E98;
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"device_screenshot"])
  {
    id v18 = &stru_100124EB8;
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"action_zoomIn"])
  {
    id v18 = &stru_100124EF8;
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"action_zoomOut"])
  {
    id v18 = &stru_100124F18;
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"device_speakThis"])
  {
    id v31 = _NSConcreteStackBlock;
    __int128 v19 = sub_1000AA84C;
    __int128 v20 = &v31;
LABEL_35:
    v20[1] = (void **)3221225472LL;
    v20[2] = (void **)v19;
    v20[3] = (void **)&unk_100123D48;
    v20[4] = (void **)a1;
    id v18 = objc_retainBlock(v20);
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"device_spotlightSearch"])
  {
    id v18 = &stru_100124F38;
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"device_multiDeviceSelectReceiver"])
  {
    id v18 = &stru_100124F58;
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"device_multiDeviceReturnToForwarder"])
  {
    id v18 = &stru_100124F78;
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"device_SOS"])
  {
    id v18 = &stru_100124F98;
    goto LABEL_63;
  }

  if ([v9 isEqualToString:@"device_sysdiagnose"])
  {
    id v30 = _NSConcreteStackBlock;
    __int128 v19 = sub_1000AA9CC;
    __int128 v20 = &v30;
    goto LABEL_35;
  }

  if ([v9 isEqualToString:@"device_restart"])
  {
    id v18 = &stru_100124FB8;
  }

  else if ([v9 isEqualToString:@"device_dock"])
  {
    id v18 = &stru_100124FD8;
  }

  else if ([v9 isEqualToString:@"device_applePay"])
  {
    id v18 = &stru_100124FF8;
  }

  else if ([v9 isEqualToString:@"device_commandAndControl"])
  {
    id v18 = &stru_100125018;
  }

  else if ([v9 isEqualToString:@"device_cameraButton"])
  {
    id v18 = &stru_100125038;
  }

  else if ([v9 isEqualToString:@"device_cameraButtonLightPress"])
  {
    id v18 = &stru_100125058;
  }

  else if ([v9 isEqualToString:@"device_cameraButtonDoubleLightPress"])
  {
    id v18 = &stru_100125078;
  }

  else if ([v9 isEqualToString:@"device_visualIntelligence"])
  {
    id v18 = &stru_100125098;
  }

  else
  {
    id v18 = 0LL;
  }

+ (void)_handleSpeakThis:(id)a3
{
  char v3 = 1;
  _AXLogWithFacility( 1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v3,  @"Handle SpeakThis is not available on tvOS");
}

+ (void)_handleSysdiagnose:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000AACB8;
  v6[3] = &unk_1001231A0;
  id v7 = v3;
  id v5 = v3;
  [v4 performSysdiagnoseWithStatusUpdateHandler:v6];
}

+ (id)_stringForRingerOn:(BOOL)a3
{
  if (a3) {
    id v3 = @"MUTE";
  }
  else {
    id v3 = @"UNMUTE";
  }
  id v4 = sub_10002B014(v3);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

+ (id)updateBlockForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"device_mute"])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000AAE10;
    v7[3] = &unk_100122B28;
    v7[4] = a1;
    id v5 = objc_retainBlock(v7);
  }

  else if ([v4 isEqualToString:@"device_tripleClick"])
  {
    id v5 = &stru_1001250B8;
  }

  else if ([v4 isEqualToString:@"device_visualIntelligence"])
  {
    id v5 = &stru_1001250D8;
  }

  else
  {
    id v5 = &stru_1001250F8;
  }

  return v5;
}

@end