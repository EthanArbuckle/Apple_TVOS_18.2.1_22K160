void sub_100003E54(uint64_t a1)
{
  id v1;
  void *v2;
  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100011F38;
  qword_100011F38 = (uint64_t)v1;
}

id sub_100004008(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}
}

id sub_1000040D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

id sub_100004C9C(uint64_t a1)
{
  v2 = -[CLLocationManager initWithEffectiveBundlePath:delegate:onQueue:]( objc_alloc(&OBJC_CLASS___CLLocationManager),  "initWithEffectiveBundlePath:delegate:onQueue:",  @"/System/Library/LocationBundles/SensingPredictBundle.bundle",  *(void *)(a1 + 32),  *(void *)(*(void *)(a1 + 32) + 16LL));
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setDelegate:");
  v5 = objc_opt_new(&OBJC_CLASS___GEOMapService);
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;

  [*(id *)(a1 + 32) _startMonitoringVisits];
  return [*(id *)(a1 + 32) _requestPlaceInference];
}

void sub_100004DC4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0LL;
}

LABEL_8:
  v10 = (void *)GEOPOICategoryFitnessCenter;
  v11 = v5;
  v12 = v10;
  if (v12 == v11)
  {

    goto LABEL_13;
  }

  v13 = v12;
  if ((v5 == 0LL) == (v12 != 0LL))
  {

    goto LABEL_15;
  }

  v14 = [v11 isEqual:v12];

  if ((v14 & 1) != 0)
  {
LABEL_13:
    v9 = 4;
    goto LABEL_51;
  }

LABEL_15:
  v15 = (void *)GEOPOICategoryAirport;
  v16 = v11;
  v17 = v15;
  if (v17 == v16)
  {

    goto LABEL_20;
  }

  v18 = v17;
  if ((v5 == 0LL) == (v17 != 0LL))
  {

    goto LABEL_22;
  }

  v19 = [v16 isEqual:v17];

  if ((v19 & 1) != 0)
  {
LABEL_20:
    v9 = 5;
    goto LABEL_51;
  }

LABEL_22:
  v20 = (void *)GEOPOICategoryStadium;
  v21 = v16;
  v22 = v20;
  if (v22 == v21)
  {

    goto LABEL_27;
  }

  v23 = v22;
  if ((v5 == 0LL) == (v22 != 0LL))
  {

    goto LABEL_29;
  }

  v24 = [v21 isEqual:v22];

  if ((v24 & 1) != 0)
  {
LABEL_27:
    v9 = 6;
    goto LABEL_51;
  }

LABEL_29:
  v25 = (void *)GEOPOICategoryTheater;
  v26 = v21;
  v27 = v25;
  if (v27 == v26)
  {

    goto LABEL_34;
  }

  v28 = v27;
  if ((v5 == 0LL) == (v27 != 0LL))
  {

    goto LABEL_36;
  }

  v29 = [v26 isEqual:v27];

  if ((v29 & 1) != 0)
  {
LABEL_34:
    v9 = 8;
    goto LABEL_51;
  }

LABEL_36:
  v30 = (void *)GEOPOICategoryMovieTheater;
  v31 = v26;
  v32 = v30;
  if (v32 == v31)
  {

    goto LABEL_41;
  }

  v33 = v32;
  if ((v5 == 0LL) != (v32 != 0LL))
  {
    v34 = [v31 isEqual:v32];

    if ((v34 & 1) == 0) {
      goto LABEL_43;
    }
LABEL_41:
    v9 = 7;
    goto LABEL_51;
  }

LABEL_43:
  v35 = (void *)GEOPOICategoryMusicVenue;
  v36 = v31;
  v37 = v35;
  if (v37 == v36)
  {
  }

  else
  {
    v38 = v37;
    if ((v5 == 0LL) == (v37 != 0LL))
    {

LABEL_50:
      v9 = 0;
      goto LABEL_51;
    }

    v39 = [v36 isEqual:v37];

    if (!v39) {
      goto LABEL_50;
    }
  }

  v9 = 9;
LABEL_51:
  if (dword_100011C00 <= 30 && (dword_100011C00 != -1 || _LogCategory_Initialize(&dword_100011C00, 30LL))) {
    LogPrintF( &dword_100011C00,  "-[SPLocationManager _getLocationCategoryFromGEOPOI:]",  30LL,  "Retrieved category: %@ from GEOPOI category: %@",  *(&off_10000C3E0 + v9),  v5);
  }

  return v9;
}

void sub_1000053D8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 16LL);
  id v4 = a2;
  dispatch_assert_queue_V2(v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v8 _loiIdentifier]);
  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v8 _loiIdentifier]);
    [v6 _updateLocationCategoryWithBestPlaceInferenceIdentifier:v7];
  }

  else
  {
    if (dword_100011C00 <= 30
      && (dword_100011C00 != -1 || _LogCategory_Initialize(&dword_100011C00, 30LL)))
    {
      LogPrintF( &dword_100011C00,  "-[SPLocationManager _requestPlaceInference]_block_invoke",  30LL,  "missing LOI identifier in best place inference");
    }

    [*(id *)(a1 + 32) _startPollingForLocationCategory];
  }
}

id sub_100005734(uint64_t a1)
{
  if (dword_100011C00 <= 30 && (dword_100011C00 != -1 || _LogCategory_Initialize(&dword_100011C00, 30LL)))
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    LogPrintF( &dword_100011C00,  "-[SPLocationManager _startPollingForLocationCategory]_block_invoke",  30LL,  "Location Query EXIT Timer fired at %@",  v2);
  }

  return [*(id *)(a1 + 32) _stopPollingForLocationCategory];
}

id sub_1000057C8(uint64_t a1)
{
  if (dword_100011C00 <= 30 && (dword_100011C00 != -1 || _LogCategory_Initialize(&dword_100011C00, 30LL)))
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    LogPrintF( &dword_100011C00,  "-[SPLocationManager _startPollingForLocationCategory]_block_invoke_2",  30LL,  "Location Query Timer fired at %@",  v2);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000589C;
  v6[3] = &unk_10000C320;
  v6[4] = v3;
  return [v4 _fetchPlaceInferencesWithFidelityPolicy:0 handler:v6];
}

void sub_10000589C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 16LL);
  id v4 = a2;
  dispatch_assert_queue_V2(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  if (v5)
  {
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 24LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 placemark]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 _geoMapItemHandle]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100005974;
    v9[3] = &unk_10000C370;
    v9[4] = *(void *)(a1 + 32);
    [v6 resolveMapItemFromHandle:v8 completionHandler:v9];
  }
}

void sub_100005974(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(dispatch_queue_s **)(v4 + 16);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000059F4;
  v7[3] = &unk_10000C348;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

id sub_1000059F4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _poiCategory]);
  id v4 = [v2 _getLocationCategoryFromGEOPOI:v3];

  id result = [*(id *)(a1 + 32) _updateLocationCategory:v4];
  if ((_DWORD)v4) {
    return [*(id *)(a1 + 32) _stopPollingForLocationCategory];
  }
  return result;
}

void sub_100005CAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(dispatch_queue_s **)(v4 + 16);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100005D2C;
  v7[3] = &unk_10000C348;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

id sub_100005D2C(uint64_t a1)
{
  id v2 = objc_msgSend( *(id *)(a1 + 32),  "_getLocationCategoryFromRTLocationOfInterestType:",  objc_msgSend(*(id *)(a1 + 40), "type"));
  if (!(_DWORD)v2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mapItem]);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 category]);
    id v2 = [v3 _getLocationCategoryFromGEOPOI:v5];
  }

  return [*(id *)(a1 + 32) _updateLocationCategory:v2];
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = objc_autoreleasePoolPush();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SPXPCService sharedInstance](&OBJC_CLASS___SPXPCService, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v5 setDelegate:v4];
  [v5 resume];

  objc_autoreleasePoolPop(v3);
  return 0;
}

id sub_10000622C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

void sub_100006294(id a1, unsigned __int8 a2)
{
  uint64_t v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SPXPCService sharedInstance](&OBJC_CLASS___SPXPCService, "sharedInstance"));
  [v3 locationCategoryChanged:v2];

  id v4 = (id)objc_claimAutoreleasedReturnValue(+[SPXPCService sharedInstance](&OBJC_CLASS___SPXPCService, "sharedInstance"));
  [v4 contextEventUpdated:v2 fusedState:(v2 - 6) < 4];
}

void sub_10000636C(id a1, unsigned int a2)
{
  if (dword_100011D30 <= 30 && (dword_100011D30 != -1 || _LogCategory_Initialize(&dword_100011D30, 30LL))) {
    LogPrintF( &dword_100011D30,  "-[SPContextEngine _ensureSoundSensorModuleStarted]_block_invoke",  30LL,  "Callback receiveSoundContextUpdate: Noise Level %lu",  a2);
  }
}

id sub_10000647C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

void sub_100006570(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_100011F50;
  qword_100011F50 = (uint64_t)v1;
}

id sub_100006688(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prefsChanged];
}

id sub_1000068A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _xpcConnectionInvalidated:*(void *)(a1 + 40)];
}

LABEL_6:
    id v3 = 0;
  }

  prefsOverrideLocationCategory = self->_prefsOverrideLocationCategory;
  if (prefsOverrideLocationCategory == v3) {
    goto LABEL_18;
  }
  if (dword_100011DA0 <= 10)
  {
    if (dword_100011DA0 != -1)
    {
LABEL_10:
      id v6 = "yes";
      if (prefsOverrideLocationCategory) {
        v7 = "yes";
      }
      else {
        v7 = "no";
      }
      if (!v3) {
        id v6 = "no";
      }
      LogPrintF( &dword_100011DA0,  "-[SPXPCService _prefsChanged]",  10LL,  "prefs - override location category: %s --> %s",  v7,  v6);
      goto LABEL_17;
    }

    if (_LogCategory_Initialize(&dword_100011DA0, 10LL))
    {
      prefsOverrideLocationCategory = self->_prefsOverrideLocationCategory;
      goto LABEL_10;
    }
  }

LABEL_17:
  self->_prefsOverrideLocationCategory = v3;
  -[SPXPCService scheduleLocationCategoryUpdate](self, "scheduleLocationCategoryUpdate");
LABEL_18:
  Int64 = CFPrefs_GetInt64(@"com.apple.SensingPredict", @"locationCategory", &v13);
  if (v13) {
    v9 = 0LL;
  }
  else {
    v9 = Int64;
  }
  prefsLocationCategory = self->_prefsLocationCategory;
  if (v9 != prefsLocationCategory)
  {
    if (dword_100011DA0 <= 10)
    {
      if (dword_100011DA0 != -1)
      {
LABEL_24:
        else {
          v11 = off_10000C540[(char)prefsLocationCategory];
        }
        else {
          v12 = off_10000C540[(char)v9];
        }
        LogPrintF( &dword_100011DA0,  "-[SPXPCService _prefsChanged]",  10LL,  "prefs - location category: %@ --> %@",  v11,  v12);
        goto LABEL_33;
      }

      if (_LogCategory_Initialize(&dword_100011DA0, 10LL))
      {
        LODWORD(prefsLocationCategory) = self->_prefsLocationCategory;
        goto LABEL_24;
      }
    }

LABEL_33:
    self->_prefsLocationCategory = v9;
    -[SPXPCService scheduleLocationCategoryUpdate](self, "scheduleLocationCategoryUpdate");
  }

  if (v9) {
    -[SPXPCService _update](self, "_update");
  }
}

id sub_100006FCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContextEventSignal];
}

id sub_10000703C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLocationCategory];
}

void sub_100007574( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_1000075A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000075B8(uint64_t a1)
{
}

uint64_t sub_1000075C0(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 40LL);
  if (v1)
  {
    uint64_t v2 = result;
    if (dword_100011DA0 > 90) {
      goto LABEL_6;
    }
    if (dword_100011DA0 == -1)
    {
      if (!_LogCategory_Initialize(&dword_100011DA0, 90LL))
      {
LABEL_6:
        id result = *(void *)(v2 + 32);
        if (result) {
          return (*(uint64_t (**)(uint64_t, void))(result + 16))( result,  *(void *)(*(void *)(*(void *)(v2 + 40) + 8LL) + 40LL));
        }
        return result;
      }

      uint64_t v1 = *(void *)(*(void *)(*(void *)(v2 + 40) + 8LL) + 40LL);
    }

    LogPrintF( &dword_100011DA0,  "-[SPServicesXPCConnection contextMonitorActivate:completion:]_block_invoke",  90LL,  "### Context Monitor Activate failed: %{error}",  v1);
    goto LABEL_6;
  }

  return result;
}

void sub_100007850( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100007888(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 40LL);
  if (v1 && dword_100011DA0 <= 90)
  {
    if (dword_100011DA0 != -1) {
      return LogPrintF( &dword_100011DA0,  "-[SPServicesXPCConnection contextMonitorUpdate:]_block_invoke",  90LL,  "### ContextMonitor update failed: %{error}",  v1);
    }
    uint64_t v2 = result;
    id result = _LogCategory_Initialize(&dword_100011DA0, 90LL);
    if ((_DWORD)result)
    {
      uint64_t v1 = *(void *)(*(void *)(*(void *)(v2 + 32) + 8LL) + 40LL);
      return LogPrintF( &dword_100011DA0,  "-[SPServicesXPCConnection contextMonitorUpdate:]_block_invoke",  90LL,  "### ContextMonitor update failed: %{error}",  v1);
    }
  }

  return result;
}

void *sub_100007BD8()
{
  return &unk_10000C618;
}

unint64_t sub_100007BE4()
{
  return 0xD000000000000018LL;
}

uint64_t sub_100007C00()
{
  uint64_t result = OS_os_log.init(subsystem:category:)(0xD000000000000018LL, 0x800000010000BCE0LL, 95LL, 0xE100000000000000LL);
  qword_100011F68 = result;
  return result;
}

uint64_t *sub_100007C50()
{
  if (qword_100011F58 != -1) {
    swift_once(&qword_100011F58, sub_100007C00);
  }
  return &qword_100011F68;
}

id sub_100007C90()
{
  return sub_100007D6C(&qword_100011F58, (id *)&qword_100011F68);
}

uint64_t sub_100007CAC()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000018LL,  0x800000010000BCE0LL,  0xD000000000000017LL,  0x800000010000BD00LL);
  qword_100011F70 = result;
  return result;
}

uint64_t *sub_100007D10()
{
  if (qword_100011F60 != -1) {
    swift_once(&qword_100011F60, sub_100007CAC);
  }
  return &qword_100011F70;
}

id sub_100007D50()
{
  return sub_100007D6C(&qword_100011F60, (id *)&qword_100011F70);
}

id sub_100007D6C(void *a1, id *a2)
{
  if (*a1 != -1LL) {
    swift_once();
  }
  return *a2;
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

unint64_t sub_100007DB4()
{
  unint64_t result = qword_100011F30;
  if (!qword_100011F30)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100011F30);
  }

  return result;
}

id objc_msgSend_xpcConnectionInvalidated(void *a1, const char *a2, ...)
{
  return [a1 xpcConnectionInvalidated];
}