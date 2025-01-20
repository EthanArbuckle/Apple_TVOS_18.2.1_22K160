void sub_4FA4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5004(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained profileStore]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allProfilesArray]);
  [v3 setAvailableValues:v5];
}

DTTVNLCInfoViewController *sub_5078(uint64_t a1)
{
  v2 = objc_alloc(&OBJC_CLASS___DTTVNLCInfoViewController);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained profileStore]);
  v5 = -[DTTVNLCInfoViewController initWithProfileStore:profileName:](v2, "initWithProfileStore:profileName:", v4, 0LL);

  return v5;
}

void sub_5230(_Unwind_Exception *a1)
{
}

id sub_5254(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained profileStore]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 customProfilesArray]);
  unsigned int v7 = [v6 containsObject:v3];

  v8 = v3;
  if (v7)
  {
    v9 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"NLCProfileCustomFormat" value:&stru_18BA0 table:@"Localizable"]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, v3));
  }

  return v8;
}

uint64_t sub_5774(uint64_t a1)
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v2 = (uint64_t (*)(uint64_t))off_1E630;
  v8 = off_1E630;
  if (!off_1E630)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_5970;
    v4[3] = &unk_186A8;
    v4[4] = &v5;
    sub_5970((uint64_t)v4);
    uint64_t v2 = (uint64_t (*)(uint64_t))v6[3];
  }

  _Block_object_dispose(&v5, 8);
  if (!v2) {
    sub_104E0();
  }
  return v2(a1);
}

void sub_5818( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void *sub_5970(uint64_t a1)
{
  uint64_t v5 = 0LL;
  if (!qword_1E638)
  {
    __int128 v6 = off_186C8;
    uint64_t v7 = 0LL;
    qword_1E638 = _sl_dlopen(&v6, &v5);
    id v3 = v5;
    uint64_t v2 = (void *)qword_1E638;
    if (qword_1E638)
    {
      if (!v5) {
        goto LABEL_5;
      }
    }

    else
    {
      id v3 = (char *)abort_report_np("%s", v5);
    }

    free(v3);
    goto LABEL_5;
  }

  uint64_t v2 = (void *)qword_1E638;
LABEL_5:
  result = dlsym(v2, "MX_MediaServicesUtilitiesResetMediaServices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  off_1E630 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_5A88(id a1)
{
  v1 = (void *)qword_1E640;
  qword_1E640 = (uint64_t)&off_1A088;

  uint64_t v2 = objc_claimAutoreleasedReturnValue([&off_1A088 arrayByAddingObject:&off_1A0A0]);
  id v3 = (void *)qword_1E648;
  qword_1E648 = v2;
}

id sub_5CD4()
{
  if (qword_1E660 != -1) {
    dispatch_once(&qword_1E660, &stru_18720);
  }
  return (id)qword_1E658;
}

void sub_6DA8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, id a27)
{
}

void sub_6E3C(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "setHidden:", objc_msgSend(WeakRetained, "_networkRecordingActive") ^ 1);
}

DTTVNLCViewController *sub_6E8C(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___DTTVNLCViewController);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained profileStore]);
  uint64_t v5 = -[DTTVNLCViewController initWithProfileStore:](v2, "initWithProfileStore:", v4);

  __int128 v6 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"NLCGroupTitle" value:&stru_18BA0 table:@"Localizable"]);
  -[DTTVNLCViewController setTitle:](v5, "setTitle:", v8);

  return v5;
}

void sub_74B4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.appletv.networkrecording", "");
  uint64_t v2 = (void *)qword_1E658;
  qword_1E658 = (uint64_t)v1;
}

void sub_8AAC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
}

void sub_8B04(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _exitSavingChanges:0];
}

void sub_8B34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _exitSavingChanges:1];
}

void sub_8B64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _exitSavingChanges:0];
}

LABEL_12:
      goto LABEL_13;
    }

    profileDictionary = self->_profileDictionary;
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[NLCSavedProfiles profileDictionaryWithName:]( self->_profileStore,  "profileDictionaryWithName:",  self->_originalProfileName));
    LOBYTE(profileDictionary) = -[NSMutableDictionary isEqualToDictionary:]( profileDictionary,  "isEqualToDictionary:",  v11);

    if ((profileDictionary & 1) == 0)
    {
      uint64_t v12 = self->_profileStore;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController profileName](self, "profileName"));
      __int128 v6 = (void *)objc_claimAutoreleasedReturnValue(-[NLCSavedProfiles profileDictionaryWithName:](v12, "profileDictionaryWithName:", v13));

LABEL_11:
      -[DTTVNLCInfoViewController _applyChangesToProfile:](self, "_applyChangesToProfile:", v6);
      goto LABEL_12;
    }
  }

LABEL_13:
  v18 = (id)objc_claimAutoreleasedReturnValue( -[DTTVNLCInfoViewController _viewControllersUnderViewController:]( self,  "_viewControllersUnderViewController:",  self));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCInfoViewController navigationController](self, "navigationController"));
  [v17 setViewControllers:v18 animated:1];
}

id sub_982C(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (*(void *)(a1 + 32) == a2) {
    *a4 = 1;
  }
  return [*(id *)(a1 + 40) removeObject:a2];
}
}

LABEL_44:
    v23 = @"_nlc_connect failed";
LABEL_46:
    sub_AE94(v23);
    return;
  }

  v29 = 0;
  uint64_t v27 = 0uLL;
  v28 = 0uLL;
  memset(v26, 0, sizeof(v26));
  __int128 v6 = -[NSString intValue](self->_currentProfile, "intValue");
  -[NSString floatValue](self->_values[0], "floatValue");
  v8 = v7 / 100.0;
  v9 = -[NSString intValue](self->_values[1], "intValue");
  if (!v6 && (v8 == 0.0 ? (v10 = v9 == 0) : (v10 = 0), v10))
  {
    v11 = 5;
  }

  else
  {
    LODWORD(v26[0]) = 9;
    *(void *)&uint64_t v27 = v6;
    *((void *)&v27 + 1) = __PAIR64__(v9, LODWORD(v8));
    v28 = 0uLL;
    v11 = 13;
    v29 = 0;
  }

  uint64_t v12 = -[NSString intValue](self->_values[2], "intValue");
  -[NSString floatValue](self->_values[3], "floatValue");
  v14 = v13 / 100.0;
  v15 = -[NSString intValue](self->_values[4], "intValue");
  if (v12 || (v14 == 0.0 ? (v16 = v15 == 0) : (v16 = 0), !v16))
  {
    LODWORD(v26[0]) = v11;
    HIDWORD(v26[1]) = v12;
    LODWORD(v26[2]) = 0;
    *(void *)((char *)&v26[2] + 4) = __PAIR64__(v15, LODWORD(v14));
    memset((char *)&v26[2] + 12, 0, 20);
  }

  v17 = self->_values[6];
  if (v17 && !-[NSString isEqualToString:](v17, "isEqualToString:", &stru_18BA0))
  {
    __strlcpy_chk( (unint64_t)v26 | 0xC, -[NSString cStringUsingEncoding:](self->_values[6], "cStringUsingEncoding:", 1LL), 16LL, 16LL);
    LODWORD(v26[0]) |= 1u;
  }

  DWORD1(v26[0]) = -[NSString intValue](self->_values[7], "intValue");
  if (DWORD1(v26[0])) {
    LODWORD(v26[0]) |= 1u;
  }
  DWORD2(v26[0]) = -[NSString intValue](self->_values[8], "intValue");
  if ((v26[0] & 1) != 0)
  {
    *(_OWORD *)&v25[39] = v26[3];
    *(_OWORD *)&v25[43] = v27;
    *(_OWORD *)&v25[47] = v28;
    v25[51] = v29;
    *(_OWORD *)&v25[27] = v26[0];
    *(_OWORD *)&v25[31] = v26[1];
    *(_OWORD *)&v25[35] = v26[2];
  }

  if (-[NSString intValue](self->_values[5], "intValue") >= 1)
  {
    v29 = 0;
    uint64_t v27 = 0u;
    v28 = 0u;
    memset(v26, 0, sizeof(v26));
    v18 = -[NSString intValue](self->_values[5], "intValue");
    memset((char *)v26 + 4, 0, 36);
    *(void *)((char *)&v26[2] + 12) = 0LL;
    *(void *)((char *)&v26[3] + 4) = 0x3500000011LL;
    HIDWORD(v26[3]) = 0;
    DWORD2(v26[2]) = v18;
    LODWORD(v26[0]) |= 6u;
    DWORD2(v26[0]) = -[NSString intValue](self->_values[8], "intValue");
    *(_OWORD *)&v25[14] = v26[3];
    *(_OWORD *)&v25[18] = v27;
    *(_OWORD *)&v25[22] = v28;
    *(_OWORD *)&v25[6] = v26[1];
    *(_OWORD *)&v25[10] = v26[2];
    v25[26] = v29;
    *(_OWORD *)&v25[2] = v26[0];
  }

  if (_nlc_disconnect(&v24) != 1)
  {
LABEL_45:
    v23 = @"_nlc_disconnect failed";
    goto LABEL_46;
  }

  CFPreferencesSetAppValue(@"SimulatorIsRunning", kCFBooleanTrue, @"com.apple.network.prefPaneSimulate");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v19 timeIntervalSince1970];
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", (uint64_t)v20));

  CFPreferencesSetAppValue(@"TimeAtLastRun", v21, @"com.apple.network.prefPaneSimulate");
  CFPreferencesAppSynchronize(@"com.apple.network.prefPaneSimulate");
  *(&self->super.secondarySimulatorRunning + 1) = 1;
  -[NLCSavedProfiles setSimulatorRunning:](self, "setSimulatorRunning:", 1LL);
  if (nlc_log) {
    NSLog(@"NLC Running");
  }

LABEL_42:
  if (nlc_log)
  {
    AppBooleanValue = CFPreferencesGetAppBooleanValue( @"SimulatorIsRunning",  @"com.apple.network.prefPaneSimulate",  0LL);
    NSLog(@"%s done, kSimulatorIsRunning: %u", "-[DTTVNLCProfileStore enableNLC:]", AppBooleanValue);
  }

void sub_AE94(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (nlc_log) {
    NSLog(@"%@", v1);
  }
  if (v2)
  {
    uint64_t v5 = @"DTTVNLCProfileStoreErrorMessageKey";
    __int128 v6 = v2;
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 postNotificationName:@"DTTVNLCProfileStoreErrorNotification" object:0 userInfo:v3];
  }
}

void *_pids_for_proc_name(const char *a1)
{
  if (!a1) {
    return 0LL;
  }
  size_t v23 = 0LL;
  *(void *)v26 = 0xE00000001LL;
  int v27 = 5;
  uid_t v28 = getuid();
  sysctl(v26, 4u, 0LL, &v23, 0LL, 0LL);
  uint64_t v2 = 0LL;
  while (1)
  {
    v23 += v23 / 0xA;
    id v3 = (char *)realloc(v2, v23);
    if (!v3)
    {
      if (!v2) {
        return v2;
      }
      goto LABEL_43;
    }

    v4 = v3;
    if (sysctl(v26, 4u, v3, &v23, 0LL, 0LL) != -1) {
      break;
    }
    uint64_t v2 = v4;
    if (*__error() != 12) {
      return 0LL;
    }
  }

  size_t v5 = v23;
  size_t v6 = v23 / 0x288;
  if (v23 % 0x288) {
    return 0LL;
  }
  uint64_t v2 = calloc(v6 + 1, 4uLL);
  if (v5 <= 0x287)
  {
    free(v4);
LABEL_43:
    free(v2);
    return 0LL;
  }

  uint64_t v7 = 0LL;
  uint64_t v20 = 0LL;
  if (v6 <= 1) {
    uint64_t v8 = 1LL;
  }
  else {
    uint64_t v8 = v6;
  }
  do
  {
    v9 = &v4[648 * v7];
    if ((~v9[36] & 5) != 0)
    {
      int v10 = *((_DWORD *)v9 + 10);
      *(void *)v24 = 0x800000001LL;
      size_t v22 = 8LL;
      if (sysctl(v24, 2u, &__size, &v22, 0LL, 0LL) != -1)
      {
        size_t v11 = __size;
        uint64_t v12 = (char *)malloc(__size);
        if (v12)
        {
          v13 = v12;
          *(void *)v24 = 0x3100000001LL;
          int v25 = v10;
          size_t v22 = v11;
          if (sysctl(v24, 3u, v12, &v22, 0LL, 0LL) != -1)
          {
            v14 = &v13[v22];
            v15 = v13;
            if ((uint64_t)v22 < 1)
            {
              v15 = v13;
            }

            else
            {
              do
              {
                if (!*v15) {
                  break;
                }
                ++v15;
              }

              while (v15 < v14);
            }

            if (v15 != v14)
            {
              if (v15 < v14)
              {
                int64_t v16 = &v13[v22] - v15;
                while (!*v15)
                {
                  ++v15;
                  if (!--v16)
                  {
                    v15 = &v13[v22];
                    break;
                  }
                }
              }

              if (v15 != v14)
              {
                if (v15 < v14)
                {
                  int64_t v17 = &v13[v22] - v15;
                  v18 = v15 + 1;
                  do
                  {
                    if (*(v18 - 1) == 47)
                    {
                      v15 = v18;
                    }

                    else if (!*(v18 - 1))
                    {
                      break;
                    }

                    ++v18;
                    --v17;
                  }

                  while (v17);
                }

                if (!strcmp(v15, a1)) {
                  *((_DWORD *)v2 + v20++) = v10;
                }
              }
            }
          }

          free(v13);
        }
      }
    }

    ++v7;
  }

  while (v7 != v8);
  free(v4);
  if (!v20) {
    goto LABEL_43;
  }
  return v2;
}

uint64_t _pid_for_proc_name(const char *a1)
{
  id v1 = (unsigned int *)_pids_for_proc_name(a1);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = *v1;
  free(v1);
  return v2;
}

void sub_B948(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___DTTVSettings);
  uint64_t v2 = (void *)qword_1E668;
  qword_1E668 = (uint64_t)v1;
}

void sub_BCEC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_BD08(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_BD80;
  block[3] = &unk_187C8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_BD80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    unsigned int v2 = +[_SWCServiceDetails isDeveloperModeEnabled]( &OBJC_CLASS____SWCServiceDetails,  "isDeveloperModeEnabled");
    id WeakRetained = v3;
    if (v3[8] != v2)
    {
      [v3 willChangeValueForKey:@"swcDeveloperModeEnabled"];
      v3[8] = v2;
      [v3 didChangeValueForKey:@"swcDeveloperModeEnabled"];
      id WeakRetained = v3;
    }
  }
}

void sub_C29C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_C2C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateHangEvents];
  [WeakRetained updatePendingHangEvents];
}

void sub_C2FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updatePendingHangEvents];
}

void sub_C58C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_C5AC(uint64_t a1, uint64_t a2)
{
}

void sub_C5B8(uint64_t a1)
{
}

void sub_C5C0(uint64_t a1, void *a2, void *a3)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_C66C;
  v7[3] = &unk_18818;
  id v8 = a2;
  id v9 = a3;
  __int128 v10 = *(_OWORD *)(a1 + 32);
  id v5 = v9;
  id v6 = v8;
  dispatch_async(&_dispatch_main_q, v7);
}

void sub_C66C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
  unsigned __int8 v3 = [WeakRetained goToNextAppsState];
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [*(id *)(a1 + 32) count]));
  if (*(void *)(a1 + 40) || (id v9 = *(void **)(a1 + 32)) == 0LL)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[DVTTVHangsRow errorRow](&OBJC_CLASS___DVTTVHangsRow, "errorRow"));
LABEL_3:
    id v6 = (id)v5;
    [v4 addObject:v5];
    goto LABEL_4;
  }

  if (![v9 count])
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[DVTTVHangsRow placeholderRow](&OBJC_CLASS___DVTTVHangsRow, "placeholderRow"));
    goto LABEL_3;
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = *(id *)(a1 + 32);
  id v10 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v6);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[DVTTVHangsRow appRowWithData:]( &OBJC_CLASS___DVTTVHangsRow,  "appRowWithData:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)i),  (void)v15));
        [v4 addObject:v14];
      }

      id v11 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v11);
  }

LABEL_4:
  if ((v3 & 1) != 0
    || (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained appRows]),
        unsigned __int8 v8 = [v7 isEqual:v4],
        v7,
        (v8 & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 48), "willChangeValueForKey:", @"appRows", (void)v15);
    [WeakRetained setAppRows:v4];
    [*(id *)(a1 + 48) didChangeValueForKey:@"appRows"];
  }
}

void sub_C924(_Unwind_Exception *a1)
{
}

void sub_C940(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained goToNextLogsState];
  if (a3) {
    uint64_t v7 = &__NSDictionary0__struct;
  }
  else {
    uint64_t v7 = v11;
  }
  [WeakRetained setErrorFindingLogs:a3 != 0];
  [WeakRetained setLogsFound:v7];
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained pendingLogsFound]);
  id v9 = v8;
  if (!a3)
  {
    id v10 = [v8 mutableCopy];

    [v10 addEntriesFromDictionary:v11];
    id v9 = v10;
  }

  [WeakRetained processNewHangEvents:v9 forceUpdate:v6];
}

void sub_CA9C(_Unwind_Exception *a1)
{
}

void sub_CAB8(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained goToNextLogsState];
  if (a3) {
    uint64_t v7 = &__NSDictionary0__struct;
  }
  else {
    uint64_t v7 = v10;
  }
  [WeakRetained setErrorFindingPendingLogs:a3 != 0];
  [WeakRetained setPendingLogsFound:v7];
  if (a3)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue([WeakRetained logsFound]);
  }

  else
  {
    id v8 = [v10 mutableCopy];
    id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained logsFound]);
    [v8 addEntriesFromDictionary:v9];
  }

  [WeakRetained processNewHangEvents:v8 forceUpdate:v6];
}

LABEL_16:
  return v21;
}

void sub_D3C4(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___NSMeasurementFormatter);
  uint64_t v2 = (void *)qword_1E678;
  qword_1E678 = (uint64_t)v1;

  [(id)qword_1E678 setUnitStyle:3];
  [(id)qword_1E678 setUnitOptions:1];
  id v3 = (id)objc_claimAutoreleasedReturnValue([(id)qword_1E678 numberFormatter]);
  [v3 setMaximumFractionDigits:0];
}

void sub_D73C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

id sub_D778(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 isLogFile])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v7, 0LL));
    unsigned __int8 v9 = +[HTHangSymbolicator isLogFileSymbolicated:]( &OBJC_CLASS___HTHangSymbolicator,  "isLogFileSymbolicated:",  v8);

    if ((v9 & 1) != 0) {
      uint64_t v10 = HTUIFileFormatSpindumpSymbolicated();
    }
    else {
      uint64_t v10 = HTUIFileFormatSpindump();
    }
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_D960;
    v18[3] = &unk_188D8;
    id v19 = v6;
    id v16 = v15;
    id v20 = v16;
    objc_copyWeak(&v21, (id *)(a1 + 32));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v16,  0LL,  v19,  0LL,  v18));
    [v14 setShouldPresentChildController:1];
    objc_destroyWeak(&v21);
  }

  else
  {
    uint64_t v11 = HTUIFileFormatTailspin();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v12,  0LL,  v6,  0LL,  WeakRetained,  "shareFile:"));
  }

  return v14;
}

void sub_D948(_Unwind_Exception *a1)
{
}

id sub_D960(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) path]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:usedEncoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:usedEncoding:error:",  v4,  0LL,  0LL));

  id v6 = [[TVSUITextAlertController alloc] initWithTitle:*(void *)(a1 + 40) text:v5];
  uint64_t v7 = HTUIShareButton();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  v14 = sub_DAB8;
  __int128 v15 = &unk_188B0;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  id v9 = v3;
  id v16 = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v8,  0LL,  &v12));
  objc_msgSend(v6, "addButton:", v10, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
  return v6;
}

void sub_DAA4(_Unwind_Exception *a1)
{
}

void sub_DAB8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained shareFile:*(void *)(a1 + 32)];
}

void sub_DD78( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_DDA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void sub_DE9C(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  uint64_t v2 = (void *)qword_1E688;
  qword_1E688 = (uint64_t)v1;

  [(id)qword_1E688 setDateStyle:3];
  [(id)qword_1E688 setTimeStyle:1];
}

void sub_E414( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_E43C(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained settingsFacade]);
  objc_msgSend(v3, "setHidden:", objc_msgSend(v4, "isEnabled") ^ 1);
}

UIViewController *__cdecl sub_E49C(id a1, TSKSettingItem *a2)
{
  uint64_t v2 = HTUILearnMoreWhatAreHangsTitle(a1, a2);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v32 localizedUppercaseString]);
  uint64_t v3 = HTUILearnMoreWhatAreHangsContent();
  v33 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v4 = HTUILearnMoreHUDTitle();
  v31 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v31 localizedUppercaseString]);
  uint64_t v5 = HTUILearnMoreHUDContent();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = HTUILearnMoreLogLimitTitle();
  v30 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v30 localizedUppercaseString]);
  uint64_t v9 = HTUILearnMoreLogLimitContent();
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = HTUILearnMoreFileTypesTitle();
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = HTUILearnMoreFileTypesIPS();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = HTUILearnMoreFileTypesTailspin();
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = HTUILearnMoreFileTypesShare();
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v19 = HTUILearnMoreURLPrefix();
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  uint64_t v21 = HTUILearnMoreURL();
  size_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  size_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  @"%@\n%@\n\n%@\n%@\n\n%@\n%@\n\n%@\n\n• %@\n\n• %@\n\n%@\n\n%@\n%@",  v34,  v33,  v29,  v6,  v8,  v10,  v12,  v14,  v16,  v18,  v20,  v22));

  id v24 = objc_alloc(&OBJC_CLASS___TVSUITextAlertController);
  uint64_t v25 = HTUILearnMoreTitle(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  id v27 = [v24 initWithTitle:v26 text:v23];

  return (UIViewController *)v27;
}

void sub_E9EC(uint64_t a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hangLogPreviewViewControllerForHangDurationLevel:0]);
  uint64_t v2 = (void *)qword_1E698;
  qword_1E698 = v1;
}

void sub_EA18(uint64_t a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hangLogPreviewViewControllerForHangDurationLevel:1]);
  uint64_t v2 = (void *)qword_1E6A8;
  qword_1E6A8 = v1;
}

void sub_EA44(uint64_t a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hangLogPreviewViewControllerForHangDurationLevel:2]);
  uint64_t v2 = (void *)qword_1E6B8;
  qword_1E6B8 = v1;
}

void sub_ECE8(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
  UIFontDescriptorAttributeName v12 = UIFontDescriptorFeatureSettingsAttribute;
  v9[0] = UIFontFeatureTypeIdentifierKey;
  v9[1] = UIFontFeatureSelectorIdentifierKey;
  v10[0] = &off_1A130;
  v10[1] = &off_1A148;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));
  uint64_t v11 = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  uint64_t v13 = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v1 fontDescriptor]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fontDescriptorByAddingAttributes:v4]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](&OBJC_CLASS___UIFont, "fontWithDescriptor:size:", v6, 0.0));
  id v8 = (void *)qword_1E6C8;
  qword_1E6C8 = v7;
}

void sub_EF74( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

id sub_EF90(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = HTUIAppsSectionFooter();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 makeRowDescriptionFrom:v7]);

  if ([v4 type]
    || (UIFontDescriptorAttributeName v12 = (void *)objc_claimAutoreleasedReturnValue([v4 appData]), v12, !v12))
  {
    else {
      uint64_t v9 = HTUIFetchingAppsErrorTitle();
    }
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v10,  v8,  0LL,  0LL));
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 appData]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v13,  v8,  v10,  0LL));
  }

  return v11;
}

void sub_F0BC(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained settingsFacade]);
  BOOL v6 = [v5 appsState] != (char *)&dword_0 + 2;

  [v3 setAccessoryTypes:4 * v6];
  id v8 = objc_loadWeakRetained(v2);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 settingsFacade]);
  objc_msgSend(v3, "setHidden:", objc_msgSend(v7, "isEnabled") ^ 1);
}

void sub_F1A4(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NSMeasurementFormatter);
  uint64_t v2 = (void *)qword_1E6D8;
  qword_1E6D8 = (uint64_t)v1;

  [(id)qword_1E6D8 setUnitStyle:2];
  [(id)qword_1E6D8 setUnitOptions:1];
  id v3 = (id)objc_claimAutoreleasedReturnValue([(id)qword_1E6D8 numberFormatter]);
  [v3 setMaximumFractionDigits:0];
}

void sub_F324( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

id sub_F340(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 type] == (char *)&dword_0 + 1
    && (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 hangEventData]),
        BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]),
        v6,
        v5,
        v6))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 hangEventData]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 creationDate]);
    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[HTHangsDataEntry dateFormatter](&OBJC_CLASS___HTHangsDataEntry, "dateFormatter"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 creationDate]);
      UIFontDescriptorAttributeName v12 = (void *)objc_claimAutoreleasedReturnValue([v10 stringFromDate:v11]);
    }

    else
    {
      UIFontDescriptorAttributeName v12 = 0LL;
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 displayName]);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) makeRowDescriptionFrom:v12]);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_F5CC;
    v25[3] = &unk_18A38;
    id v19 = v8;
    id v26 = v19;
    id v27 = v4;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v17,  v18,  v19,  @"durationMeasurement",  v25));

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_F63C;
    v23[3] = &unk_18A60;
    id v24 = v19;
    id v20 = v19;
    [v16 setUpdateBlock:v23];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[DVTTVHangsMainViewController durationFormatter]( &OBJC_CLASS___DVTTVHangsMainViewController,  "durationFormatter"));
    [v16 setLocalizedValueFormatter:v21];
  }

  else
  {
    else {
      uint64_t v13 = HTUIFetchingHangsErrorTitle();
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) makeRowDescriptionFrom:0]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v14,  v15,  0LL,  0LL));
  }

  return v16;
}

DVTTVHangsDetailViewController *sub_F5CC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isBeingProcessed])
  {
    uint64_t v2 = 0LL;
  }

  else
  {
    id v3 = objc_alloc(&OBJC_CLASS___DVTTVHangsDetailViewController);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) hangEventData]);
    uint64_t v2 = -[DVTTVHangsDetailViewController initWithHangsDataEntries:](v3, "initWithHangsDataEntries:", v4);
  }

  return v2;
}

void sub_F63C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = a2;
  else {
    uint64_t v3 = 1LL;
  }
  [v4 setAccessoryTypes:v3];
}

void sub_F688(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained settingsFacade]);
  BOOL v6 = [v5 logsState] != (char *)&dword_0 + 2;

  [v3 setAccessoryTypes:4 * v6];
  id v8 = objc_loadWeakRetained(v2);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 settingsFacade]);
  objc_msgSend(v3, "setHidden:", objc_msgSend(v7, "isEnabled") ^ 1);
}

uint64_t _nlc_connect(_DWORD *a1)
{
  if (bootstrap_look_up(bootstrap_port, "com.apple.NetworkLinkConditioner", &sp))
  {
    puts("NLCd : Bootstrap failure");
    return 100LL;
  }

  else
  {
    mach_error_t v3 = nlc_connect(sp, a1, a1 + 1, &v5);
    if (v3) {
      mach_error("nlc_connect:", v3);
    }
    return v5;
  }

uint64_t _nlc_disconnect(mach_port_t *a1)
{
  mach_error_t v2 = nlc_disconnect(*a1, a1[1], &v4);
  if (v2) {
    mach_error("nlc_disconnect:", v2);
  }
  mach_port_deallocate(mach_task_self_, *a1);
  return v4;
}

uint64_t _nlc_start_simulation(uint64_t a1, __int128 *a2)
{
  *((_DWORD *)a2 + 1) = 0;
  __int128 v3 = a2[11];
  __int128 v28 = a2[10];
  __int128 v29 = v3;
  __int128 v30 = a2[12];
  __int128 v4 = a2[7];
  __int128 v24 = a2[6];
  __int128 v25 = v4;
  __int128 v5 = a2[9];
  __int128 v26 = a2[8];
  __int128 v27 = v5;
  __int128 v6 = a2[3];
  __int128 v20 = a2[2];
  __int128 v21 = v6;
  __int128 v7 = a2[5];
  __int128 v22 = a2[4];
  __int128 v23 = v7;
  __int128 v8 = a2[1];
  __int128 v18 = *a2;
  __int128 v19 = v8;
  mach_error_t v9 = nlc_simulate(*(_DWORD *)a1, (uint64_t)&v18, 0xD0u, *(_DWORD *)(a1 + 4), &v17);
  if (v9) {
    mach_error("_nlc_start_simulation:", v9);
  }
  __int128 v10 = v29;
  a2[10] = v28;
  a2[11] = v10;
  a2[12] = v30;
  __int128 v11 = v25;
  a2[6] = v24;
  a2[7] = v11;
  __int128 v12 = v27;
  a2[8] = v26;
  a2[9] = v12;
  __int128 v13 = v21;
  a2[2] = v20;
  a2[3] = v13;
  __int128 v14 = v23;
  a2[4] = v22;
  a2[5] = v14;
  __int128 v15 = v19;
  *a2 = v18;
  a2[1] = v15;
  return v17;
}

uint64_t _nlc_stop_simulation(uint64_t a1, __int128 *a2)
{
  *((_DWORD *)a2 + 1) = 1;
  __int128 v3 = a2[11];
  __int128 v28 = a2[10];
  __int128 v29 = v3;
  __int128 v30 = a2[12];
  __int128 v4 = a2[7];
  __int128 v24 = a2[6];
  __int128 v25 = v4;
  __int128 v5 = a2[9];
  __int128 v26 = a2[8];
  __int128 v27 = v5;
  __int128 v6 = a2[3];
  __int128 v20 = a2[2];
  __int128 v21 = v6;
  __int128 v7 = a2[5];
  __int128 v22 = a2[4];
  __int128 v23 = v7;
  __int128 v8 = a2[1];
  __int128 v18 = *a2;
  __int128 v19 = v8;
  mach_error_t v9 = nlc_stop_simulation(*(_DWORD *)a1, (uint64_t)&v18, 0xD0u, *(_DWORD *)(a1 + 4), &v17);
  if (v9) {
    mach_error("_nlc_stop_simulation:", v9);
  }
  __int128 v10 = v29;
  a2[10] = v28;
  a2[11] = v10;
  a2[12] = v30;
  __int128 v11 = v25;
  a2[6] = v24;
  a2[7] = v11;
  __int128 v12 = v27;
  a2[8] = v26;
  a2[9] = v12;
  __int128 v13 = v21;
  a2[2] = v20;
  a2[3] = v13;
  __int128 v14 = v23;
  a2[4] = v22;
  a2[5] = v14;
  __int128 v15 = v19;
  *a2 = v18;
  a2[1] = v15;
  return v17;
}

uint64_t _nlc_get_status(uint64_t a1, _DWORD *a2)
{
  a2[1] = 2;
  mach_msg_size_t __n = 208;
  __int128 v4 = *((_OWORD *)a2 + 11);
  v15[10] = *((_OWORD *)a2 + 10);
  v15[11] = v4;
  v15[12] = *((_OWORD *)a2 + 12);
  __int128 v5 = *((_OWORD *)a2 + 7);
  v15[6] = *((_OWORD *)a2 + 6);
  v15[7] = v5;
  __int128 v6 = *((_OWORD *)a2 + 9);
  v15[8] = *((_OWORD *)a2 + 8);
  v15[9] = v6;
  __int128 v7 = *((_OWORD *)a2 + 3);
  v15[2] = *((_OWORD *)a2 + 2);
  v15[3] = v7;
  __int128 v8 = *((_OWORD *)a2 + 5);
  v15[4] = *((_OWORD *)a2 + 4);
  v15[5] = v8;
  __int128 v9 = *((_OWORD *)a2 + 1);
  v15[0] = *(_OWORD *)a2;
  v15[1] = v9;
  bzero(__src, 0x400uLL);
  mach_error_t status = nlc_get_status(*(_DWORD *)a1, (uint64_t)v15, 0xD0u, __src, &__n, *(_DWORD *)(a1 + 4), &__n_4);
  if (status) {
    mach_error("_nlc_get_status:", status);
  }
  memcpy(a2, __src, __n);
  return __n_4;
}

uint64_t nlc_connect(mach_port_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  mach_port_t reply_port = mig_get_reply_port();
  v13.msgh_remote_port = a1;
  v13.msgh_local_port = reply_port;
  v13.msgh_bits = 5395;
  *(void *)&v13.msgh_voucher_port = 0x9D4C00000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v13);
    mach_port_t reply_port = v13.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&v13, 3, 0x18u, 0x40u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v13.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v9)
    {
      if (v13.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (v13.msgh_id == 40368)
      {
        if ((v13.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996LL;
          if (v14 == 1 && v13.msgh_size == 56 && !v13.msgh_remote_port && v17 << 16 == 1114112)
          {
            uint64_t v10 = 0LL;
            int v11 = v18;
            *a2 = v15;
            *a3 = v11;
            *a4 = v19;
            return v10;
          }
        }

        else if (v13.msgh_size == 36)
        {
          uint64_t v10 = 4294966996LL;
          if (v16)
          {
            if (v13.msgh_remote_port) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = v16;
            }
          }
        }

        else
        {
          uint64_t v10 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

      mach_msg_destroy(&v13);
      return v10;
    }

    mig_dealloc_reply_port(v13.msgh_local_port);
  }

  return v10;
}

uint64_t nlc_disconnect(mach_port_t a1, unsigned int a2, _DWORD *a3)
{
  NDR_record_t v11 = NDR_record;
  unsigned int v12 = a2;
  mach_port_t reply_port = mig_get_reply_port();
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = reply_port;
  v10.msgh_bits = 5395;
  *(void *)&v10.msgh_voucher_port = 0x9D4D00000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v10);
    mach_port_t reply_port = v10.msgh_local_port;
  }

  uint64_t v6 = mach_msg(&v10, 3, 0x24u, 0x30u, reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v10.msgh_id == 40369)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 40)
        {
          if (!v10.msgh_remote_port)
          {
            uint64_t v7 = v12;
            if (!v12)
            {
              *a3 = v13;
              return v7;
            }

            goto LABEL_23;
          }
        }

        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port) {
            BOOL v8 = 1;
          }
          else {
            BOOL v8 = v12 == 0;
          }
          if (v8) {
            uint64_t v7 = 4294966996LL;
          }
          else {
            uint64_t v7 = v12;
          }
          goto LABEL_23;
        }
      }

      uint64_t v7 = 4294966996LL;
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

LABEL_23:
    mach_msg_destroy(&v10);
    return v7;
  }

  mig_put_reply_port(v10.msgh_local_port);
  return v7;
}

uint64_t nlc_simulate(mach_port_t a1, uint64_t a2, unsigned int a3, int a4, _DWORD *a5)
{
  NDR_record_t v17 = NDR_record;
  if (a3 <= 0x400)
  {
    __memcpy_chk(v19, a2, a3, 1028LL);
    unsigned int v18 = a3;
    uint64_t v10 = (a3 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v11 = v10 + 40;
    *(_DWORD *)((char *)&v16 + v10 + 36) = a4;
    mach_port_t reply_port = mig_get_reply_port();
    v16.msgh_remote_port = a1;
    v16.msgh_local_port = reply_port;
    v16.msgh_bits = 5395;
    *(void *)&v16.msgh_voucher_port = 0x9D4E00000000LL;
    if (&_voucher_mach_msg_set)
    {
      voucher_mach_msg_set(&v16);
      mach_port_t reply_port = v16.msgh_local_port;
    }

    uint64_t v13 = mach_msg(&v16, 3, v11, 0x30u, reply_port, 0, 0);
    uint64_t v5 = v13;
    if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(v16.msgh_local_port);
      return v5;
    }

    if ((_DWORD)v13)
    {
      mig_dealloc_reply_port(v16.msgh_local_port);
      return v5;
    }

    if (v16.msgh_id == 71)
    {
      uint64_t v5 = 4294966988LL;
    }

    else if (v16.msgh_id == 40370)
    {
      if ((v16.msgh_bits & 0x80000000) == 0)
      {
        if (v16.msgh_size == 40)
        {
          if (!v16.msgh_remote_port)
          {
            uint64_t v5 = v18;
            if (!v18)
            {
              *a5 = v19[0];
              return v5;
            }

            goto LABEL_25;
          }
        }

        else if (v16.msgh_size == 36)
        {
          if (v16.msgh_remote_port) {
            BOOL v14 = 1;
          }
          else {
            BOOL v14 = v18 == 0;
          }
          if (v14) {
            uint64_t v5 = 4294966996LL;
          }
          else {
            uint64_t v5 = v18;
          }
          goto LABEL_25;
        }
      }

      uint64_t v5 = 4294966996LL;
    }

    else
    {
      uint64_t v5 = 4294966995LL;
    }

LABEL_25:
    mach_msg_destroy(&v16);
    return v5;
  }

  return 4294966989LL;
}

    mach_msg_destroy(&v16);
    return v5;
  }

  return 4294966989LL;
}

uint64_t nlc_stop_simulation(mach_port_t a1, uint64_t a2, unsigned int a3, int a4, _DWORD *a5)
{
  NDR_record_t v17 = NDR_record;
  if (a3 <= 0x400)
  {
    __memcpy_chk(v19, a2, a3, 1028LL);
    unsigned int v18 = a3;
    uint64_t v10 = (a3 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v11 = v10 + 40;
    *(_DWORD *)((char *)&v16 + v10 + 36) = a4;
    mach_port_t reply_port = mig_get_reply_port();
    v16.msgh_remote_port = a1;
    v16.msgh_local_port = reply_port;
    v16.msgh_bits = 5395;
    *(void *)&v16.msgh_voucher_port = 0x9D4F00000000LL;
    if (&_voucher_mach_msg_set)
    {
      voucher_mach_msg_set(&v16);
      mach_port_t reply_port = v16.msgh_local_port;
    }

    uint64_t v13 = mach_msg(&v16, 3, v11, 0x30u, reply_port, 0, 0);
    uint64_t v5 = v13;
    if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(v16.msgh_local_port);
      return v5;
    }

    if ((_DWORD)v13)
    {
      mig_dealloc_reply_port(v16.msgh_local_port);
      return v5;
    }

    if (v16.msgh_id == 71)
    {
      uint64_t v5 = 4294966988LL;
    }

    else if (v16.msgh_id == 40371)
    {
      if ((v16.msgh_bits & 0x80000000) == 0)
      {
        if (v16.msgh_size == 40)
        {
          if (!v16.msgh_remote_port)
          {
            uint64_t v5 = v18;
            if (!v18)
            {
              *a5 = v19[0];
              return v5;
            }

            goto LABEL_25;
          }
        }

        else if (v16.msgh_size == 36)
        {
          if (v16.msgh_remote_port) {
            BOOL v14 = 1;
          }
          else {
            BOOL v14 = v18 == 0;
          }
          if (v14) {
            uint64_t v5 = 4294966996LL;
          }
          else {
            uint64_t v5 = v18;
          }
          goto LABEL_25;
        }
      }

      uint64_t v5 = 4294966996LL;
    }

    else
    {
      uint64_t v5 = 4294966995LL;
    }

uint64_t nlc_get_status( mach_port_t a1, uint64_t a2, unsigned int a3, void *a4, mach_msg_size_t *a5, int a6, _DWORD *a7)
{
  NDR_record_t v25 = NDR_record;
  if (a3 <= 0x400)
  {
    __memcpy_chk(&__n, a2, a3, 1040LL);
    unsigned int v26 = a3;
    uint64_t v14 = (a3 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v15 = v14 + 40;
    *(_DWORD *)((char *)&msg + v14 + 36) = a6;
    mach_port_t reply_port = mig_get_reply_port();
    msg.msgh_remote_port = a1;
    msg.msgh_local_port = reply_port;
    msg.msgh_bits = 5395;
    *(void *)&msg.msgh_voucher_port = 0x9D5000000000LL;
    if (&_voucher_mach_msg_set)
    {
      voucher_mach_msg_set(&msg);
      mach_port_t reply_port = msg.msgh_local_port;
    }

    uint64_t v17 = mach_msg(&msg, 3, v15, 0x434u, reply_port, 0, 0);
    uint64_t v7 = v17;
    if ((v17 - 268435458) <= 0xE && ((1 << (v17 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg.msgh_local_port);
      return v7;
    }

    if ((_DWORD)v17)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v7;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (msg.msgh_id == 40372)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size - 1069 <= 0xFFFFFBFE)
        {
          if (msg.msgh_remote_port) {
            BOOL v18 = 1;
          }
          else {
            BOOL v18 = v26 == 0;
          }
          if (!v18 && msg.msgh_size == 36) {
            uint64_t v7 = v26;
          }
          else {
            uint64_t v7 = 4294966996LL;
          }
          goto LABEL_27;
        }

        if (!msg.msgh_remote_port)
        {
          uint64_t v7 = v26;
          if (v26) {
            goto LABEL_27;
          }
          mach_msg_size_t v21 = __n;
          if (__n <= 0x400)
          {
            uint64_t v7 = 4294966996LL;
            if (msg.msgh_size - 44 >= __n)
            {
              unsigned int v22 = (__n + 3) & 0xFFFFFFFC;
              if (msg.msgh_size == v22 + 44)
              {
                __int128 v23 = (char *)&msg + v22 - 1024;
                memcpy(a4, &__n_4, __n);
                uint64_t v7 = 0LL;
                *a5 = v21;
                *a7 = *((_DWORD *)v23 + 266);
                return v7;
              }
            }

            goto LABEL_27;
          }
        }
      }

      uint64_t v7 = 4294966996LL;
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

LABEL_27:
    mach_msg_destroy(&msg);
    return v7;
  }

  return 4294966989LL;
}

void sub_104E0()
{
  v0 = dlerror();
  abort_report_np("%s", v0);
  CFNotificationCenterGetDarwinNotifyCenter();
}

id objc_msgSend_childPaneItemWithTitle_description_representedObject_keyPath_childControllerBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:");
}

id objc_msgSend_childPaneItemWithTitle_description_representedObject_keyPath_childControllerClass_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:");
}

id objc_msgSend_multiValueItemWithTitle_description_representedObject_keyPath_availableValues_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:");
}

id objc_msgSend_toggleItemWithTitle_description_representedObject_keyPath_onTitle_offTitle_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}