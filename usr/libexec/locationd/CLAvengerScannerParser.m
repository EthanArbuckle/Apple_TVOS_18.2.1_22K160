@interface CLAvengerScannerParser
+ (id)convertToObjectDiscoveryDataWithAdvertisementData:(id)a3 rssi:(id)a4;
@end

@implementation CLAvengerScannerParser

+ (id)convertToObjectDiscoveryDataWithAdvertisementData:(id)a3 rssi:(id)a4
{
  if (!a3
    || ![a3 objectForKey:CBAdvertisementDataDeviceAddress]
    || ![a3 objectForKey:CBAdvertisementDataTimestamp])
  {
    if (qword_101934840 != -1) {
      dispatch_once(&qword_101934840, &stru_1018985D0);
    }
    v6 = (os_log_s *)qword_101934848;
    if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289539;
      int v86 = 0;
      __int16 v87 = 2082;
      v88 = "";
      __int16 v89 = 2113;
      id v90 = a3;
      __int16 v91 = 2113;
      id v92 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:CLAvengerScannerParser missing data, advertisementData:%{private, location:escape_o nly}@, rssi:%{private, location:escape_only}@}",  buf,  0x26u);
      if (qword_101934840 != -1) {
        dispatch_once(&qword_101934840, &stru_1018985D0);
      }
    }

    v7 = (os_log_s *)qword_101934848;
    if (os_signpost_enabled((os_log_t)qword_101934848))
    {
      *(_DWORD *)buf = 68289539;
      int v86 = 0;
      __int16 v87 = 2082;
      v88 = "";
      __int16 v89 = 2113;
      id v90 = a3;
      __int16 v91 = 2113;
      id v92 = a4;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CLAvengerScannerParser missing data",  "{msg%{public}.0s:CLAvengerScannerParser missing data, advertisementData:%{private, location:escape_o nly}@, rssi:%{private, location:escape_only}@}",  buf,  0x26u);
    }
  }

  id v8 = [a3 objectForKey:CBAdvertisementDataDeviceAddressType];
  if (!v8)
  {
    if (qword_101934840 != -1) {
      dispatch_once(&qword_101934840, &stru_1018985D0);
    }
    v15 = (os_log_s *)qword_101934848;
    if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289539;
      int v86 = 0;
      __int16 v87 = 2082;
      v88 = "";
      __int16 v89 = 2113;
      id v90 = a3;
      __int16 v91 = 2113;
      id v92 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:CLAvengerScannerParser missing address type, advertisementData:%{private, location: escape_only}@, rssi:%{private, location:escape_only}@}",  buf,  0x26u);
      if (qword_101934840 != -1) {
        dispatch_once(&qword_101934840, &stru_1018985D0);
      }
    }

    v12 = (os_log_s *)qword_101934848;
    if (!os_signpost_enabled((os_log_t)qword_101934848)) {
      return 0LL;
    }
    *(_DWORD *)buf = 68289539;
    int v86 = 0;
    __int16 v87 = 2082;
    v88 = "";
    __int16 v89 = 2113;
    id v90 = a3;
    __int16 v91 = 2113;
    id v92 = a4;
    v13 = "CLAvengerScannerParser missing address type";
    v14 = "{msg%{public}.0s:CLAvengerScannerParser missing address type, advertisementData:%{private, locatio"
          "n:escape_only}@, rssi:%{private, location:escape_only}@}";
    goto LABEL_35;
  }

  if ([v8 integerValue] != (id)1)
  {
    if (qword_101934840 != -1) {
      dispatch_once(&qword_101934840, &stru_1018985D0);
    }
    uint64_t v16 = qword_101934848;
    if (!os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_DEBUG)) {
      return 0LL;
    }
    *(_DWORD *)buf = 68289539;
    int v86 = 0;
    __int16 v87 = 2082;
    v88 = "";
    __int16 v89 = 2113;
    id v90 = a3;
    __int16 v91 = 2113;
    id v92 = a4;
    v17 = "{msg%{public}.0s:CLAvengerScannerParser address type must be random, advertisementData:%{private, "
          "location:escape_only}@, rssi:%{private, location:escape_only}@}";
    goto LABEL_40;
  }

  if (!_os_feature_enabled_impl("CoreLocation", "StandardUT")
    || (v9 = CBAdvertisementDataManufacturerDataKey,
        [a3 objectForKey:CBAdvertisementDataManufacturerDataKey])
    || (v10 = CBAdvertisementDataServiceDataKey, ![a3 objectForKey:CBAdvertisementDataServiceDataKey]))
  {
    if (!_os_feature_enabled_impl("CoreLocation", "StandardUT")
      || (v9 = CBAdvertisementDataManufacturerDataKey,
          ![a3 objectForKey:CBAdvertisementDataManufacturerDataKey])
      || (v10 = CBAdvertisementDataServiceDataKey, [a3 objectForKey:CBAdvertisementDataServiceDataKey]))
    {
      if ((_os_feature_enabled_impl("CoreLocation", "StandardUT") & 1) != 0
        || (v9 = CBAdvertisementDataManufacturerDataKey,
            ![a3 objectForKey:CBAdvertisementDataManufacturerDataKey])
        || (v10 = CBAdvertisementDataServiceDataKey, [a3 objectForKey:CBAdvertisementDataServiceDataKey]))
      {
        if (qword_101934840 != -1) {
          dispatch_once(&qword_101934840, &stru_1018985D0);
        }
        v11 = (os_log_s *)qword_101934848;
        if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289539;
          int v86 = 0;
          __int16 v87 = 2082;
          v88 = "";
          __int16 v89 = 2113;
          id v90 = a3;
          __int16 v91 = 2113;
          id v92 = a4;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:CLAvengerScannerParser missing data or Posh feature flag needs to be enabled/disabled , advertisementData:%{private, location:escape_only}@, rssi:%{private, location:escape_only}@}",  buf,  0x26u);
          if (qword_101934840 != -1) {
            dispatch_once(&qword_101934840, &stru_1018985D0);
          }
        }

        v12 = (os_log_s *)qword_101934848;
        if (!os_signpost_enabled((os_log_t)qword_101934848)) {
          return 0LL;
        }
        *(_DWORD *)buf = 68289539;
        int v86 = 0;
        __int16 v87 = 2082;
        v88 = "";
        __int16 v89 = 2113;
        id v90 = a3;
        __int16 v91 = 2113;
        id v92 = a4;
        v13 = "CLAvengerScannerParser missing data or Posh feature flag needs to be enabled/disabled";
        v14 = "{msg%{public}.0s:CLAvengerScannerParser missing data or Posh feature flag needs to be enabled/disabl"
              "ed, advertisementData:%{private, location:escape_only}@, rssi:%{private, location:escape_only}@}";
        goto LABEL_35;
      }
    }
  }

  if ([a3 objectForKey:v9])
  {
    id v22 = [a3 objectForKeyedSubscript:v9];
    if ((unint64_t)[v22 length] <= 3)
    {
      if (qword_101934840 != -1) {
        dispatch_once(&qword_101934840, &stru_1018985D0);
      }
      v23 = (os_log_s *)qword_101934848;
      if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289539;
        int v86 = 0;
        __int16 v87 = 2082;
        v88 = "";
        __int16 v89 = 2113;
        id v90 = a3;
        __int16 v91 = 2113;
        id v92 = a4;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:CLAvengerScannerParser length not long enough to extract preamble, advertisementDat a:%{private, location:escape_only}@, rssi:%{private, location:escape_only}@}",  buf,  0x26u);
        if (qword_101934840 != -1) {
          dispatch_once(&qword_101934840, &stru_1018985D0);
        }
      }

      v12 = (os_log_s *)qword_101934848;
      if (!os_signpost_enabled((os_log_t)qword_101934848)) {
        return 0LL;
      }
      *(_DWORD *)buf = 68289539;
      int v86 = 0;
      __int16 v87 = 2082;
      v88 = "";
      __int16 v89 = 2113;
      id v90 = a3;
      __int16 v91 = 2113;
      id v92 = a4;
      v13 = "CLAvengerScannerParser length not long enough to extract preamble";
      v14 = "{msg%{public}.0s:CLAvengerScannerParser length not long enough to extract preamble, advertisementD"
            "ata:%{private, location:escape_only}@, rssi:%{private, location:escape_only}@}";
      goto LABEL_35;
    }

    v29 = [v22 bytes];
    if (*(_WORD *)v29 == 76 && (v30 = v29, v29[2] == 18))
    {
      id v31 = [v22 length];
      uint64_t v32 = v30[3];
      if (v31 == (id)(v32 + 4))
      {
        if (v32 <= 0x19 && ((1 << v32) & 0x3000004) != 0)
        {
          id v33 = [a3 objectForKeyedSubscript:CBAdvertisementDataDeviceAddress];
          if (v33)
          {
            if (*(unsigned __int8 *)[v33 bytes] > 0xBFu)
            {
              int v34 = v30[3];
              if (v34 != 25)
              {
                if (v34 == 24)
                {
                  v67 = (unsigned __int8 *)[v22 bytes];
                  unsigned int v83 = v67[4];
                  v37 = +[NSMutableData dataWithBytes:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytes:length:",  v67 + 27,  1LL);
                  v38 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v67 + 5, 22LL);
                  char v36 = 0;
                  goto LABEL_192;
                }

                if (v34 == 2)
                {
                  v35 = (unsigned __int8 *)[v22 bytes];
                  unsigned int v83 = v35[4];
                  char v36 = 1;
                  v37 = +[NSMutableData dataWithBytes:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytes:length:",  v35 + 5,  1LL);
                  v38 = +[NSData data](&OBJC_CLASS___NSData, "data");
LABEL_192:
                  v84 = 0LL;
                  int v60 = 2;
                  goto LABEL_193;
                }

                if (qword_101934840 != -1) {
                  dispatch_once(&qword_101934840, &stru_1018985D0);
                }
                uint64_t v81 = qword_101934848;
                if (!os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_INFO)) {
                  return 0LL;
                }
                *(_DWORD *)buf = 68289539;
                int v86 = 0;
                __int16 v87 = 2082;
                v88 = "";
                __int16 v89 = 2113;
                id v90 = a3;
                __int16 v91 = 2113;
                id v92 = a4;
                v17 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser length check should not have allowed this else case\""
                      ", advertisementData:%{private, location:escape_only}@, rssi:%{private, location:escape_only}@}";
                v18 = (os_log_s *)v81;
                os_log_type_t v19 = OS_LOG_TYPE_INFO;
                goto LABEL_41;
              }

              v66 = (unsigned __int8 *)[v22 bytes];
              unsigned int v83 = v66[4];
              int v60 = 2;
              v37 = +[NSMutableData dataWithBytes:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytes:length:",  v66 + 27,  2LL);
              v38 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v66 + 5, 22LL);
              char v36 = 0;
              v84 = 0LL;
LABEL_193:
              int v61 = 1;
              goto LABEL_194;
            }

            if (qword_101934840 != -1) {
              dispatch_once(&qword_101934840, &stru_1018985D0);
            }
            uint64_t v16 = qword_101934848;
            if (!os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_DEBUG)) {
              return 0LL;
            }
            *(_DWORD *)buf = 68289539;
            int v86 = 0;
            __int16 v87 = 2082;
            v88 = "";
            __int16 v89 = 2113;
            id v90 = a3;
            __int16 v91 = 2113;
            id v92 = a4;
            v17 = "{msg%{public}.0s:CLAvengerScannerParser address type must be random static, advertisementDat"
                  "a:%{private, location:escape_only}@, rssi:%{private, location:escape_only}@}";
LABEL_40:
            v18 = (os_log_s *)v16;
            os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
LABEL_41:
            uint32_t v20 = 38;
LABEL_42:
            _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, v20);
            return 0LL;
          }

          if (qword_101934840 != -1) {
            dispatch_once(&qword_101934840, &stru_1018985D0);
          }
          v62 = (os_log_s *)qword_101934848;
          if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68289539;
            int v86 = 0;
            __int16 v87 = 2082;
            v88 = "";
            __int16 v89 = 2113;
            id v90 = a3;
            __int16 v91 = 2113;
            id v92 = a4;
            _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:CLAvengerScannerParser missing address, advertisementData:%{private, location :escape_only}@, rssi:%{private, location:escape_only}@}",  buf,  0x26u);
            if (qword_101934840 != -1) {
              dispatch_once(&qword_101934840, &stru_1018985D0);
            }
          }

          v12 = (os_log_s *)qword_101934848;
          if (!os_signpost_enabled((os_log_t)qword_101934848)) {
            return 0LL;
          }
          *(_DWORD *)buf = 68289539;
          int v86 = 0;
          __int16 v87 = 2082;
          v88 = "";
          __int16 v89 = 2113;
          id v90 = a3;
          __int16 v91 = 2113;
          id v92 = a4;
          v13 = "CLAvengerScannerParser missing address";
          v14 = "{msg%{public}.0s:CLAvengerScannerParser missing address, advertisementData:%{private, locati"
                "on:escape_only}@, rssi:%{private, location:escape_only}@}";
        }

        else
        {
          if (qword_101934840 != -1) {
            dispatch_once(&qword_101934840, &stru_1018985D0);
          }
          v63 = (os_log_s *)qword_101934848;
          if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68289539;
            int v86 = 0;
            __int16 v87 = 2082;
            v88 = "";
            __int16 v89 = 2113;
            id v90 = a3;
            __int16 v91 = 2113;
            id v92 = a4;
            _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:CLAvengerScannerParser unrecognized length, advertisementData:%{private, loca tion:escape_only}@, rssi:%{private, location:escape_only}@}",  buf,  0x26u);
            if (qword_101934840 != -1) {
              dispatch_once(&qword_101934840, &stru_1018985D0);
            }
          }

          v12 = (os_log_s *)qword_101934848;
          if (!os_signpost_enabled((os_log_t)qword_101934848)) {
            return 0LL;
          }
          *(_DWORD *)buf = 68289539;
          int v86 = 0;
          __int16 v87 = 2082;
          v88 = "";
          __int16 v89 = 2113;
          id v90 = a3;
          __int16 v91 = 2113;
          id v92 = a4;
          v13 = "CLAvengerScannerParser unrecognized length";
          v14 = "{msg%{public}.0s:CLAvengerScannerParser unrecognized length, advertisementData:%{private, lo"
                "cation:escape_only}@, rssi:%{private, location:escape_only}@}";
        }
      }

      else
      {
        if (qword_101934840 != -1) {
          dispatch_once(&qword_101934840, &stru_1018985D0);
        }
        v53 = (os_log_s *)qword_101934848;
        if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289539;
          int v86 = 0;
          __int16 v87 = 2082;
          v88 = "";
          __int16 v89 = 2113;
          id v90 = a3;
          __int16 v91 = 2113;
          id v92 = a4;
          _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:CLAvengerScannerParser stated length doesnt match actual data length, advertiseme ntData:%{private, location:escape_only}@, rssi:%{private, location:escape_only}@}",  buf,  0x26u);
          if (qword_101934840 != -1) {
            dispatch_once(&qword_101934840, &stru_1018985D0);
          }
        }

        v12 = (os_log_s *)qword_101934848;
        if (!os_signpost_enabled((os_log_t)qword_101934848)) {
          return 0LL;
        }
        *(_DWORD *)buf = 68289539;
        int v86 = 0;
        __int16 v87 = 2082;
        v88 = "";
        __int16 v89 = 2113;
        id v90 = a3;
        __int16 v91 = 2113;
        id v92 = a4;
        v13 = "CLAvengerScannerParser stated length doesnt match actual data length";
        v14 = "{msg%{public}.0s:CLAvengerScannerParser stated length doesnt match actual data length, advertise"
              "mentData:%{private, location:escape_only}@, rssi:%{private, location:escape_only}@}";
      }
    }

    else
    {
      if (qword_101934840 != -1) {
        dispatch_once(&qword_101934840, &stru_1018985D0);
      }
      v39 = (os_log_s *)qword_101934848;
      if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289539;
        int v86 = 0;
        __int16 v87 = 2082;
        v88 = "";
        __int16 v89 = 2113;
        id v90 = a3;
        __int16 v91 = 2113;
        id v92 = a4;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:CLAvengerScannerParser companyID and type mismatch, advertisementData:%{private, location:escape_only}@, rssi:%{private, location:escape_only}@}",  buf,  0x26u);
        if (qword_101934840 != -1) {
          dispatch_once(&qword_101934840, &stru_1018985D0);
        }
      }

      v12 = (os_log_s *)qword_101934848;
      if (!os_signpost_enabled((os_log_t)qword_101934848)) {
        return 0LL;
      }
      *(_DWORD *)buf = 68289539;
      int v86 = 0;
      __int16 v87 = 2082;
      v88 = "";
      __int16 v89 = 2113;
      id v90 = a3;
      __int16 v91 = 2113;
      id v92 = a4;
      v13 = "CLAvengerScannerParser companyID and type mismatch";
      v14 = "{msg%{public}.0s:CLAvengerScannerParser companyID and type mismatch, advertisementData:%{private"
            ", location:escape_only}@, rssi:%{private, location:escape_only}@}";
    }

@end