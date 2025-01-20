void sub_100004050( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000406C(uint64_t a1, int token)
{
  uint64_t state64 = 0LL;
  uint64_t result = notify_get_state(token, &state64);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  return result;
}

uint64_t sub_1000040B8(uint64_t a1)
{
  return notify_cancel(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
}

NSDictionary *sub_1000043A8(unsigned int *a1)
{
  v5[0] = @"TSWu";
  v6[0] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[8]);
  v5[1] = @"TSFP";
  v6[1] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[9]);
  v5[2] = @"PMU_Tdev4";
  v6[2] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[10]);
  v5[3] = @"PMU_Tdev5";
  v6[3] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[11]);
  v5[4] = @"Die_Temp_MaxAverage";
  v6[4] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[12]);
  v5[5] = @"Pressure_Level";
  v6[5] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[13]);
  v5[6] = @"TPSD";
  v6[6] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[14]);
  v5[7] = @"PD4R";
  LODWORD(v2) = a1[15];
  v6[7] = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v2);
  v5[8] = @"PP0R";
  LODWORD(v3) = a1[16];
  v6[8] = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v3);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  9LL);
}

void sub_100004830(_Unwind_Exception *a1)
{
}

float sub_100004890(uint64_t a1, uint64_t a2)
{
  uint64_t state64 = 0LL;
  id Weak = objc_loadWeak((id *)(a1 + 32));
  objc_msgSend( Weak,  "handleStateChangeNotification:temperatureSensorIndex:",  a2,  objc_msgSend(Weak, "rearCameraSensorIdx"));
  if (!notify_get_state(a2, &state64))
  {
    float result = (float)(int)state64;
    *(float *)&dword_10007D1BC = (float)(int)state64;
  }

  return result;
}

id sub_1000048FC(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend( Weak,  "handleTemperatureChangeNotification:temperatureSensorIndex:",  a2,  objc_msgSend(Weak, "rearCameraSensorIdx"));
}

float sub_100004934(uint64_t a1, uint64_t a2)
{
  uint64_t state64 = 0LL;
  id Weak = objc_loadWeak((id *)(a1 + 32));
  objc_msgSend( Weak,  "handleStateChangeNotification:temperatureSensorIndex:",  a2,  objc_msgSend(Weak, "frontCameraSensorIdx"));
  if (!notify_get_state(a2, &state64))
  {
    float result = (float)(int)state64;
    *(float *)&dword_10007D1C8 = (float)(int)state64;
  }

  return result;
}

id sub_1000049A0(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend( Weak,  "handleTemperatureChangeNotification:temperatureSensorIndex:",  a2,  objc_msgSend(Weak, "frontCameraSensorIdx"));
}

id sub_1000049D8(uint64_t a1, int a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  uint64_t state64 = 0LL;
  id result = (id)notify_get_state(a2, &state64);
  if (!(_DWORD)result)
  {
    [Weak setTorchState:state64];
    *(float *)&dword_10007D190 = (float)(int)state64;
    v5 = +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance");
    if (state64) {
      uint64_t v6 = 100LL;
    }
    else {
      uint64_t v6 = 0LL;
    }
    return -[TGraphSampler updatePowerlogMiscState:value:](v5, "updatePowerlogMiscState:value:", 4LL, v6);
  }

  return result;
}

void sub_100004B6C(_Unwind_Exception *a1)
{
}

float sub_100004B98(uint64_t a1, uint64_t a2)
{
  uint64_t state64 = 0LL;
  id Weak = objc_loadWeak((id *)(a1 + 32));
  objc_msgSend( Weak,  "handleStateChangeNotification:temperatureSensorIndex:",  a2,  objc_msgSend(Weak, "rearCameraTeleSensorIdx"));
  if (!notify_get_state(a2, &state64))
  {
    float result = (float)(int)state64;
    *(float *)&dword_10007D1C0 = (float)(int)state64;
  }

  return result;
}

id sub_100004C04(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend( Weak,  "handleTemperatureChangeNotification:temperatureSensorIndex:",  a2,  objc_msgSend(Weak, "rearCameraTeleSensorIdx"));
}

void sub_100004D48(_Unwind_Exception *a1)
{
}

float sub_100004D74(uint64_t a1, uint64_t a2)
{
  uint64_t state64 = 0LL;
  id Weak = objc_loadWeak((id *)(a1 + 32));
  objc_msgSend( Weak,  "handleStateChangeNotification:temperatureSensorIndex:",  a2,  objc_msgSend(Weak, "rearCameraSuperWideSensorIdx"));
  if (!notify_get_state(a2, &state64))
  {
    float result = (float)(int)state64;
    *(float *)&dword_10007D1C4 = (float)(int)state64;
  }

  return result;
}

id sub_100004DE0(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend( Weak,  "handleTemperatureChangeNotification:temperatureSensorIndex:",  a2,  objc_msgSend(Weak, "rearCameraSuperWideSensorIdx"));
}

void sub_100004F24(_Unwind_Exception *a1)
{
}

float sub_100004F50(uint64_t a1, uint64_t a2)
{
  uint64_t state64 = 0LL;
  id Weak = objc_loadWeak((id *)(a1 + 32));
  objc_msgSend( Weak,  "handleStateChangeNotification:temperatureSensorIndex:",  a2,  objc_msgSend(Weak, "rearCameraJasperSensorIdx"));
  if (!notify_get_state(a2, &state64))
  {
    float result = (float)(int)state64;
    *(float *)&dword_10007D1CC = (float)(int)state64;
  }

  return result;
}

id sub_100004FBC(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend( Weak,  "handleTemperatureChangeNotification:temperatureSensorIndex:",  a2,  objc_msgSend(Weak, "rearCameraJasperSensorIdx"));
}

void sub_100005100(_Unwind_Exception *a1)
{
}

id sub_10000512C(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend( Weak,  "handleTemperatureChangeNotification:temperatureSensorIndex:",  a2,  objc_msgSend(Weak, "frontIRCameraSensorIdx"));
}

id sub_100005164(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend( Weak,  "handleStateChangeNotification:temperatureSensorIndex:",  a2,  objc_msgSend(Weak, "frontIRCameraSensorIdx"));
}

void sub_1000052A8(_Unwind_Exception *a1)
{
}

id sub_1000052D4(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend( Weak,  "handleTemperatureChangeNotification:temperatureSensorIndex:",  a2,  objc_msgSend(Weak, "frontRomeoNTCSensorIdx"));
}

id sub_10000530C(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend( Weak,  "handleStateChangeNotification:temperatureSensorIndex:",  a2,  objc_msgSend(Weak, "frontRomeoNTCSensorIdx"));
}

void sub_100005450(_Unwind_Exception *a1)
{
}

id sub_10000547C(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend( Weak,  "handleTemperatureChangeNotification:temperatureSensorIndex:",  a2,  objc_msgSend(Weak, "frontRigelDieSensorIdx"));
}

id sub_1000054B4(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend( Weak,  "handleStateChangeNotification:temperatureSensorIndex:",  a2,  objc_msgSend(Weak, "frontRigelDieSensorIdx"));
}
}

id sub_100005864(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (IOHIDEventGetType(a4) == 15 || (id result = (id)IOHIDEventGetType(a4), (_DWORD)result == 31))
  {
    uint64_t v8 = (int)(IOHIDEventGetFloatValue(a4, 983040LL) * 100.0);
    return [a1 handleTemperatureEvent:v8 service:a3];
  }

  return result;
}

void sub_100005924(id a1)
{
  qword_100074AA0 = objc_alloc_init(&OBJC_CLASS___HidSensors);
}

void sub_10000665C(id a1)
{
  dword_100074AB0 = sub_100020E9C("AppleVTempDispatcher", 0LL, 0LL);
  if (!dword_100074AB0)
  {
    v1 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100038470(v1, v2, v3);
    }
  }

LABEL_2:
  if (-[NSMutableArray count](v3, "count"))
  {
    v4 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "<Notice> List of sensors received: %@",  buf,  0xCu);
    }
  }

  if (self->_count >= 1)
  {
    v5 = 0LL;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(self->_tempSensors, v5);
      Value = (void *)CFDictionaryGetValue(self->_serviceToName, ValueAtIndex);
      if (!Value)
      {
        v12 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = ValueAtIndex;
          _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "<Error> Cannot find matching key for 0x%p",  buf,  0xCu);
        }

        goto LABEL_46;
      }

      if (!-[HidSensors shouldRetrieveSensor:]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "shouldRetrieveSensor:",  Value))
      {
        *(_DWORD *)buf = -12700;
        v13 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, buf);
        CFDictionarySetValue(self->_sensorDict, Value, v13);
        if (v13) {
          CFRelease(v13);
        }
        goto LABEL_46;
      }

      v49 = 0;
      if (self->_callbackTemperaturesQueue)
      {
        callbackTemperatures = self->_callbackTemperatures;
        if (callbackTemperatures)
        {
          if (CFDictionaryContainsKey(callbackTemperatures, Value))
          {
            *(void *)buf = 0LL;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000LL;
            LODWORD(v52) = 0;
            callbackTemperaturesQueue = (dispatch_queue_s *)self->_callbackTemperaturesQueue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100007B64;
            block[3] = &unk_100060CA8;
            block[5] = buf;
            block[6] = Value;
            block[4] = self;
            dispatch_sync(callbackTemperaturesQueue, block);
            v10 = -[HidSensors isTempSensorDataValid:value:]( self,  "isTempSensorDataValid:value:",  Value,  *(unsigned int *)(*(void *)&buf[8] + 24LL));
            sensorDict = self->_sensorDict;
            if (v10)
            {
              sub_1000211FC(sensorDict, Value, kCFNumberSInt32Type, (void *)(*(void *)&buf[8] + 24LL));
            }

            else
            {
              CFDictionaryRemoveValue(sensorDict, Value);
              self->_isSensorDataValid = 0;
            }

            _Block_object_dispose(buf, 8);
            goto LABEL_41;
          }
        }
      }

      if (byte_10007CB32 && -[HidSensors isBatterySensor:](self, "isBatterySensor:", Value)) {
        break;
      }
      v14 = -[SensorDispatcherHelper getTemperatureFromSMCForKey:]( +[SensorDispatcherHelper sharedInstance](&OBJC_CLASS___SensorDispatcherHelper, "sharedInstance"),  "getTemperatureFromSMCForKey:",  Value);
      v49 = v14;
      if ((_DWORD)v14 == -12800)
      {
        v21 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = Value;
          _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "<Error> Could not get value from SMC (%@)",  buf,  0xCu);
        }

        goto LABEL_34;
      }

      if ((_DWORD)v14 != -1)
      {
        v22 = -[HidSensors isTempSensorDataValid:value:](self, "isTempSensorDataValid:value:", Value, v14);
        v23 = self->_sensorDict;
        if (v22)
        {
          sub_1000211FC(v23, Value, kCFNumberSInt32Type, &v49);
          goto LABEL_41;
        }

        CFDictionaryRemoveValue(v23, Value);
LABEL_40:
        self->_isSensorDataValid = 0;
        goto LABEL_41;
      }

      v15 = -[HidSensors isPowerSensor:]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "isPowerSensor:",  Value);
      if (v15) {
        v16 = 25LL;
      }
      else {
        v16 = 15LL;
      }
      v17 = IOHIDServiceClientCopyEvent(ValueAtIndex, v16, 0LL, 0LL);
      v18 = (const void *)v17;
      if (v17)
      {
        if (v15) {
          v19 = 1638400LL;
        }
        else {
          v19 = 983040LL;
        }
        FloatValue = IOHIDEventGetFloatValue(v17, v19);
        valuePtr = FloatValue;
        if (!v15)
        {
          v46 = (int)(FloatValue * 100.0);
          v45 = 0LL;
          if (sub_100020FE0(self->_potentiallyStaleSensorTimestamps, Value, kCFNumberLongType, &v45))
          {
            TimeStamp = IOHIDEventGetTimeStamp(v18);
            if (TimeStamp == v45) {
              goto LABEL_54;
            }
            if (!v45 && !mach_timebase_info(&info))
            {
              denom = info.denom;
              numer = info.numer;
              v31 = mach_absolute_time();
              log = (os_log_s *)qword_10007CF50;
              if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138413058;
                *(void *)&buf[4] = Value;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v45;
                *(_WORD *)&buf[22] = 2048;
                v52 = TimeStamp;
                v53 = 2048;
                v54 = v31;
                _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "<Notice> Sensor reset for %@, prior %lld, event %lld, now %lld",  buf,  0x2Au);
              }

              if (TimeStamp + 60000000000LL * denom / numer < v31) {
LABEL_54:
              }
                sub_100020FE0(self->_potentiallyStaleSensorDefaults, Value, kCFNumberSInt32Type, &v46);
            }

            if (TimeStamp != v45) {
              sub_1000211FC(self->_potentiallyStaleSensorTimestamps, Value, kCFNumberLongType, &TimeStamp);
            }
          }

          CFRelease(v18);
          if (-[HidSensors staleValueExpected:]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "staleValueExpected:",  Value)
            || -[HidSensors isTempSensorDataValid:value:](self, "isTempSensorDataValid:value:", Value, v46))
          {
            sub_1000211FC(self->_sensorDict, Value, kCFNumberSInt32Type, &v46);
            goto LABEL_41;
          }

LABEL_34:
          CFDictionaryRemoveValue(self->_sensorDict, Value);
          goto LABEL_40;
        }

        sub_1000211FC(self->_sensorDict, Value, kCFNumberDoubleType, &valuePtr);
        CFRelease(v18);
      }

      else
      {
        LODWORD(valuePtr) = 0;
        v28 = sub_100020FE0(self->_potentiallyStaleSensorDefaults, Value, kCFNumberSInt32Type, &valuePtr);
        v29 = +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance");
        if (v28)
        {
          if (!-[HidSensors staleValueExpected:](v29, "staleValueExpected:", Value)
            && !-[HidSensors isTempSensorDataValid:value:]( self,  "isTempSensorDataValid:value:",  Value,  LODWORD(valuePtr)))
          {
            goto LABEL_34;
          }

          sub_1000211FC(self->_sensorDict, Value, kCFNumberSInt32Type, &valuePtr);
LABEL_41:
          tempOffsetDict = self->_tempOffsetDict;
          if (tempOffsetDict)
          {
            if (CFDictionaryContainsKey(tempOffsetDict, Value))
            {
              v25 = self->_sensorDict;
              if (v25)
              {
                if (CFDictionaryContainsKey(v25, Value))
                {
                  v26 = (const __CFNumber *)CFDictionaryGetValue(self->_sensorDict, Value);
                  CFNumberGetValue(v26, kCFNumberSInt32Type, buf);
                  v27 = (const __CFNumber *)CFDictionaryGetValue(self->_tempOffsetDict, Value);
                  CFNumberGetValue(v27, kCFNumberSInt32Type, &valuePtr);
                  *(_DWORD *)buf += LODWORD(valuePtr);
                  sub_1000211FC(self->_sensorDict, Value, kCFNumberSInt32Type, buf);
                }
              }
            }
          }

          goto LABEL_46;
        }

        if (!-[HidSensors readFailuresExpected:](v29, "readFailuresExpected:", Value))
        {
          v30 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = Value;
            _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "<Error> Could not get event from service (%@)",  buf,  0xCu);
          }

          goto LABEL_34;
        }
      }

  if (LOBYTE(self->_chargerType) != v14 && -[LinkChargerCC updateCloakingState:](self, "updateCloakingState:", v14))
  {
    LOBYTE(self->_chargerType) = v14;
    v26 = +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance");
    else {
      v27 = 0LL;
    }
    -[TGraphSampler updatePowerlogMiscState:value:](v26, "updatePowerlogMiscState:value:", 3LL, v27);
  }

  v28 = self->_skipFirstChargeThreshold;
  v29 = 1;
  if (v28 != 20) {
    v29 = v28 == 40;
  }
  BYTE1(self->_chargerType) = v29;
  if (byte_10007CB30)
  {
    v30 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      previousValue = self->super.previousValue;
      v32 = LOBYTE(self->_chargerType);
      v33 = *(void *)((char *)&self->_targetTimeWirelessMatCharging + 4);
      v34 = 136316162;
      v35 = "-[LinkChargerCC defaultAction]";
      v36 = 1024;
      *(_DWORD *)v37 = v29;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = previousValue;
      *(_WORD *)v38 = 1024;
      *(_DWORD *)&v38[2] = v32;
      *(_WORD *)v39 = 2048;
      *(void *)&v39[2] = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "<Notice> %s: onCharger %d, releaseMax LI %d, cloak status %d, time left %f",  (uint8_t *)&v34,  0x28u);
    }
  }

LABEL_46:
      if (self->_count <= ++v5) {
        return self->_sensorDict;
      }
    }

    *(_DWORD *)buf = 3000;
    sub_1000211FC(self->_sensorDict, Value, kCFNumberSInt32Type, buf);
    goto LABEL_41;
  }

  return self->_sensorDict;
}

void sub_1000077E0(_Unwind_Exception *a1)
{
}

BOOL sub_100007800(uint64_t a1, IOHIDServiceClientRef service)
{
  CFTypeRef v4 = IOHIDServiceClientCopyProperty(service, @"Product");
  int valuePtr = -1;
  v5 = (const __CFNumber *)IOHIDServiceClientCopyProperty(service, @"LocationID");
  if (v5)
  {
    uint64_t v6 = v5;
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr);
      CFRelease(v6);
      if (valuePtr != -1) {
        [*(id *)(a1 + 32) addObject:sub_1000212A0(valuePtr)];
      }
    }
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v8 = *(void **)(a1 + 40);
  id v9 = [v8 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v27;
LABEL_7:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
      if (v4)
      {
        CFTypeID v14 = CFGetTypeID(v4);
      }

      if ([v13 length] == (id)4)
      {
        v15 = (const char *)[v13 cStringUsingEncoding:4];
        if (v15)
        {
          v16 = v15;
          if (strlen(v15) == 4)
          {
            uint64_t v17 = 0LL;
            int v18 = 0;
            do
              int v18 = v16[v17++] + (v18 << 8);
            while ((_DWORD)v17 != 4);
            if (v18 == valuePtr) {
              goto LABEL_22;
            }
          }
        }
      }

      if ((id)++v12 == v10)
      {
        id v10 = [v8 countByEnumeratingWithState:&v26 objects:v35 count:16];
        if (v10) {
          goto LABEL_7;
        }
        break;
      }
    }
  }

  v13 = 0LL;
LABEL_22:
  if (v4) {
LABEL_23:
  }
    CFRelease(v4);
  if (v13)
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 48) + 672LL), service, v13);
    id v19 = [*(id *)(a1 + 48) callbackSensorInterval:v13];
    if ((int)v19 >= 1)
    {
      id v20 = v19;
      v21 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v32 = v13;
        __int16 v33 = 1024;
        int v34 = (int)v20;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "<Notice> callback interval for %@: %d",  buf,  0x12u);
      }

      IOHIDServiceClientSetProperty( service,  @"ReportInterval",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v20));
      uint64_t v22 = *(void *)(a1 + 48);
      v23 = *(dispatch_queue_s **)(v22 + 104);
      if (v23)
      {
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_100007B04;
        v25[3] = &unk_100060C58;
        v25[4] = v22;
        v25[5] = v13;
        dispatch_async(v23, v25);
      }
    }
  }

  return v13 != 0LL;
}

CFNumberRef sub_100007B04(uint64_t a1)
{
  int valuePtr = -12700;
  if (-[HidSensors readFailuresExpected:]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "readFailuresExpected:",  *(void *)(a1 + 40)))
  {
    int valuePtr = 3000;
  }

  return sub_1000211FC( *(__CFDictionary **)(*(void *)(a1 + 32) + 80LL),  *(const void **)(a1 + 40),  kCFNumberSInt32Type,  &valuePtr);
}

void sub_100007B64(uint64_t a1)
{
}

CFNumberRef sub_100007F54(uint64_t a1)
{
  CFNumberRef result = (CFNumberRef)CFDictionaryGetValue( *(CFDictionaryRef *)(*(void *)(a1 + 32) + 672LL),  *(const void **)(a1 + 40));
  if (result) {
    return sub_1000211FC( *(__CFDictionary **)(*(void *)(a1 + 32) + 80LL),  result,  kCFNumberSInt32Type,  (void *)(a1 + 48));
  }
  return result;
}

void sub_100008340(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10000834C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

_BYTE *sub_100008358(_BYTE *result, _BYTE *a2)
{
  *CFNumberRef result = 0;
  *a2 = 0;
  return result;
}

  ;
}

  ;
}

  ;
}

NSDictionary *sub_1000087F4(unsigned int *a1)
{
  v3[0] = @"TSWu";
  v4[0] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[8]);
  v3[1] = @"TU0Q";
  v4[1] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[9]);
  v3[2] = @"TS0L";
  v4[2] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[10]);
  v3[3] = @"TSFP";
  v4[3] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[11]);
  v3[4] = @"PS1E";
  v4[4] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[12]);
  v3[5] = @"PS0Q";
  v4[5] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[13]);
  v3[6] = @"PSWu";
  v4[6] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[14]);
  v3[7] = @"PSTu";
  v4[7] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[15]);
  v3[8] = @"PS1P";
  v4[8] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[16]);
  v3[9] = @"TP2d";
  v4[9] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[17]);
  v3[10] = @"TS0A";
  v4[10] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[18]);
  v3[11] = @"Die_Temp_MaxAverage";
  v4[11] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[19]);
  v3[12] = @"Die_Temp_MaxMax";
  v4[12] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[20]);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  13LL);
}

void sub_100008E60( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

LABEL_35:
      CFRelease(v6);
LABEL_36:
    }

    Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v6, @"brightness");
    id v9 = CFDictionaryGetValue((CFDictionaryRef)v6, @"BrightnessMilliNits");
    if (Value && (id v10 = CFGetTypeID(Value), v10 == CFDictionaryGetTypeID()))
    {
      if (sub_100020FE0(Value, @"value", kCFNumberIntType, &v25)
        && sub_100020FE0(Value, @"max", kCFNumberIntType, &v24))
      {
        uint64_t v11 = v24;
        if (v24)
        {
          if (v24 >= 0) {
            uint64_t v12 = v24;
          }
          else {
            uint64_t v12 = v24 + 1;
          }
          uint64_t v11 = (100 * v25 + (v12 >> 1)) / v24;
        }

        *(int *)((char *)&i->_brightnessMilliNitsCurrent[1] + 2) = v11;
        if (!v9) {
          goto LABEL_33;
        }
LABEL_24:
        v13 = CFGetTypeID(v9);
        if (v13 == CFDictionaryGetTypeID())
        {
          if (!sub_100020FE0( (CFDictionaryRef)v9,  @"value",  kCFNumberIntType,  (char *)i->gPowerServiceBL + 2)
            || (sub_100020FE0((CFDictionaryRef)v9, @"max", kCFNumberIntType, &i->displayCount + 2) & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
              sub_100038A78(&v18, v19);
            }
            *(unsigned int *)((char *)i->gPowerServiceBL + 2) = -1;
            *(_DWORD *)(&i->displayCount + 2) = -1;
          }

          goto LABEL_35;
        }

        goto LABEL_33;
      }

      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        sub_100038AC8(&v22, v23);
        if (v9) {
          goto LABEL_24;
        }
LABEL_33:
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_100038A50(&v16, v17);
        }
        goto LABEL_35;
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_100038AA0(&v20, v21);
      if (v9) {
        goto LABEL_24;
      }
      goto LABEL_33;
    }

    if (v9) {
      goto LABEL_24;
    }
    goto LABEL_33;
  }

void sub_100009900(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
}

void sub_100009910( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

LABEL_19:
    CFTypeRef v4 = off_100060550;
LABEL_25:
    self->product = (CommonProduct *)[objc_alloc(*v4) initProduct:self];
    return;
  }

  switch(productName)
  {
    case 15017680:
LABEL_20:
      CFTypeRef v4 = off_100060528;
      goto LABEL_25;
    case 15312800:
      CFTypeRef v4 = off_100060538;
      goto LABEL_25;
    case 15917920:
      goto LABEL_19;
  }

  if (!self->super.previousValue)
  {
    *(double *)((char *)&self->_targetTimeWirelessMatCharging + 4) = *(double *)(&self->pmuPowerService + 1);
    CFTypeID v14 = 1LL;
  }

  v16 = *(double *)((char *)&self->_remainingTimeInterval + 4);
  if (v16 > 0.0)
  {
    uint64_t v17 = sub_100021CC8();
    remainingInitialNoCloakTime_high = HIDWORD(self->_remainingInitialNoCloakTime);
    if (v17 > remainingInitialNoCloakTime_high)
    {
      id v19 = v17;
      id v20 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(void *)((char *)&self->_remainingTimeInterval + 4);
        int v34 = 136315906;
        v35 = "-[LinkChargerCC defaultAction]";
        v36 = 2048;
        *(void *)v37 = v21;
        *(_WORD *)&v37[8] = 1024;
        *(_DWORD *)v38 = v19;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)v39 = remainingInitialNoCloakTime_high;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "<Notice> %s: bypassing remaining %f seconds (%d above %d)",  (uint8_t *)&v34,  0x22u);
      }

      *(double *)((char *)&self->_remainingTimeInterval + 4) = 0.0;
      goto LABEL_34;
    }

    v16 = *(double *)((char *)&self->_remainingTimeInterval + 4);
  }

  if (v16 > 0.0)
  {
    uint64_t v22 = v16 - v6;
    v23 = v6 < v16;
    v24 = 0.0;
    if (v23) {
      v24 = v22;
    }
    *(double *)((char *)&self->_remainingTimeInterval + 4) = v24;
    if (*(double *)((char *)&self->_remainingTimeInterval + 4) == 0.0)
    {
      v25 = (os_log_s *)qword_10007CF50;
      CFTypeID v14 = 0LL;
      if (!os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      int v34 = 136315138;
      v35 = "-[LinkChargerCC defaultAction]";
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "<Notice> %s: initial interval complete",  (uint8_t *)&v34,  0xCu);
    }

    CFTypeID v14 = 0LL;
  }

LABEL_98:
    v75 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v101[0] = v98;
      _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEFAULT,  "<Notice> Camera strobe max load overriden to %lld",  buf,  0xCu);
    }

    goto LABEL_100;
  }

LABEL_108:
  v77 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kBatteryRaKey");
  if (v77)
  {
    v78 = v77;
    v79 = CFGetTypeID(v77);
    if (v79 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v78, kCFNumberIntType, buf);
      sub_100022854(*(int *)buf);
    }

    if (SCPreferencesGetValue(a3, @"kBatteryRaKeyPersistentlyEnabled") != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, @"kBatteryRaKey");
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_100038BC0();
      }
    }
  }

  v80 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kBatteryWRaKey");
  if (v80)
  {
    v81 = v80;
    v82 = CFGetTypeID(v80);
    if (v82 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v81, kCFNumberIntType, buf);
      sub_10002290C(*(int *)buf);
    }

    if (SCPreferencesGetValue(a3, @"kBatteryWRaKeyPersistentlyEnabled") != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, @"kBatteryWRaKey");
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_100038BC0();
      }
    }
  }

  v83 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kBatteryUPOCountKey");
  if (v83)
  {
    v84 = v83;
    v85 = CFGetTypeID(v83);
    if (v85 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v84, kCFNumberIntType, buf);
      sub_100022B4C(*(unsigned int *)buf);
    }

    if (SCPreferencesGetValue(a3, @"kBatteryUPOCountKeyPersistentlyEnabled") != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, @"kBatteryUPOCountKey");
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_100038BC0();
      }
    }
  }

  v86 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kStepperDisabledKey");
  if (v86)
  {
    v87 = v86;
    v88 = CFGetTypeID(v86);
    if (v88 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v87, kCFNumberIntType, buf);
      sub_100022B64(*(_DWORD *)buf != 0);
    }

    SCPreferencesRemoveValue(a3, @"kStepperDisabledKey");
    if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100038BC0();
    }
  }

  v89 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kUseNewMitigationsKey");
  if (v89)
  {
    v90 = v89;
    v91 = CFGetTypeID(v89);
    if (v91 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v90, kCFNumberIntType, buf);
      sub_100022B70(*(_DWORD *)buf == 1);
    }

    if (SCPreferencesGetValue(a3, @"kUseNewMitigationsPersistentlyEnabled") != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, @"kUseNewMitigationsKey");
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_100038BC0();
      }
    }
  }

  v92 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kAgingControllerDisabledKey");
  if (v92)
  {
    v93 = v92;
    v94 = CFGetTypeID(v92);
    if (v94 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v93, kCFNumberIntType, buf);
      sub_100022B94(*(_DWORD *)buf != 0);
    }

    if (SCPreferencesGetValue(a3, @"kAgingControllerDisabledPersistentKey") != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, @"kAgingControllerDisabledKey");
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_100038BC0();
      }
    }
  }

  v95 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kOnChargerStatusKey");
  if (v95)
  {
    v96 = v95;
    v97 = CFGetTypeID(v95);
    if (v97 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v96, kCFNumberIntType, buf);
      sub_100022BD4(*(unsigned int *)buf);
    }

    if (SCPreferencesGetValue(a3, @"kOnChargerStatusKeyPersistentlyEnabled") != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, @"kOnChargerStatusKey");
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_100038BC0();
      }
    }
  }

void sub_10000B190( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_10000B1B0()
{
  return SCError();
}

  ;
}

LABEL_9:
  sunlightLoadingIndexValue = 100;
  self->sunlightLoadingIndexValue = 100;
LABEL_18:
  if (sunlightLoadingIndexValue == self->previousSunlightLoadingIndexValue
    || ((uint64_t v12 = +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance"),
         self->sunlightLoadingIndexValue)
      ? (v13 = 100LL)
      : (v13 = 0LL),
        -[TGraphSampler updatePowerlogMiscState:value:](v12, "updatePowerlogMiscState:value:", 2LL, v13),
        !notify_set_state(self->thermalSunlightStateToken, self->sunlightLoadingIndexValue)))
  {
    LOBYTE(v10) = 1;
    return v10;
  }

  id v10 = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
  if (v10)
  {
    sub_100038CDC();
    goto LABEL_11;
  }

  return v10;
}

  CFRelease(v3);
LABEL_10:
  [Weak setChargerState:v5];
  CFTypeID v7 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Charger type is %d", buf, 8u);
  }

LABEL_18:
      if (v6 == self->pressureLevel_previous || byte_1000748C0 == 0) {
        goto LABEL_23;
      }
      if (notify_set_state(self->thermalPressureLevelToken, v6))
      {
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_100038DAC();
        }
        return -1LL;
      }

      uint64_t v11 = notify_post(kOSThermalNotificationPressureLevelName);
      uint64_t v12 = (os_log_s *)qword_10007CF50;
      if (v11)
      {
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_100038D80();
        }
        return -1LL;
      }

      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        CFTypeID v14 = 134218240;
        v15 = v6;
        v16 = 2048;
        uint64_t v17 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "<Notice> Thermal pressure level %llu thermal level %llu",  (uint8_t *)&v14,  0x16u);
      }

LABEL_23:
      kdebug_trace(728039436LL, self->pressureLevel_previous, v6, a3, 0LL);
      self->pressureLevel_previous = v6;
      return v6;
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
      CFTypeID v7 = self->pressureLevel_previous > 0x14;
      uint64_t v8 = 20LL;
      id v9 = 30LL;
      goto LABEL_15;
    case 0xAuLL:
      uint64_t v6 = 30LL;
      goto LABEL_18;
    case 0xBuLL:
      CFTypeID v7 = self->pressureLevel_previous > 0x1E;
      uint64_t v8 = 30LL;
      id v9 = 40LL;
      goto LABEL_15;
    case 0xCuLL:
      uint64_t v6 = 40LL;
      goto LABEL_18;
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
      CFTypeID v7 = self->pressureLevel_previous > 0x28;
      uint64_t v8 = 40LL;
      id v9 = 50LL;
      goto LABEL_15;
    case 0x10uLL:
      goto LABEL_18;
    default:
      if (a4 || self->lightPressureOverride)
      {
        uint64_t v6 = 10LL;
      }

      else if (self->pressureLevel_previous <= 0xA)
      {
        uint64_t v6 = 0LL;
      }

      else
      {
        uint64_t v6 = 10LL;
      }

      goto LABEL_18;
  }

  pthread_mutex_unlock(p_lock);
}

    v7->_originalThresholdModuleTemperature = thresholdModuleTemperature;
    v7->_originalThresholdVirtualTemperature = v25;
    -[TGraphSampler addtGraphDataSource:]( +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance", v22, v23),  "addtGraphDataSource:",  v7);
  }

  return v7;
}

void sub_10000C4A0(id a1)
{
  if (byte_10007D4DA) {
    qword_100074AC8 = objc_alloc_init(&OBJC_CLASS___PowerZoneTelemetry);
  }
}

LABEL_8:
    IOObjectRelease(v2->appleCLPCService);
    goto LABEL_38;
  }

  if (IOConnectCallMethod(v2->clpcConnect, 6u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, &address, &size))
  {
    IOObjectRelease(v2->appleCLPCService);
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100039234();
    }
    goto LABEL_38;
  }

  if (size <= 0x6F)
  {
    IOObjectRelease(v2->appleCLPCService);
    vm_deallocate(mach_task_self_, address, size);
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100039184();
    }
    goto LABEL_38;
  }

  v5 = address;
  if (*(void *)(address + 8) != size)
  {
    IOObjectRelease(v2->appleCLPCService);
    vm_deallocate(mach_task_self_, address, size);
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100039208();
    }
LABEL_38:

    return 0LL;
  }

  uint64_t v6 = *(void *)(address + 24);
  for (v2->lastCLPCReadingTimestamp = mach_absolute_time(); v6 < *(void *)(v5 + 8); v6 += *(void *)(v7 + 8))
  {
    CFTypeID v7 = address + v6;
    uint64_t v8 = *(_DWORD *)(address + v6);
    if (v8 == 14)
    {
      uint64_t v11 = *(_DWORD *)(v7 + 16);
      if (v11 == 1)
      {
        v13 = *(_OWORD *)(v7 + 16);
        xmmword_1000747D8 = *(_OWORD *)v7;
        *(_OWORD *)algn_1000747E8 = v13;
      }

      else if (!v11)
      {
        uint64_t v12 = *(_OWORD *)(v7 + 16);
        xmmword_1000747B8 = *(_OWORD *)v7;
        *(_OWORD *)algn_1000747C8 = v12;
      }
    }

    else
    {
      if (v8 != 13)
      {
        IOObjectRelease(v2->appleCLPCService);
        vm_deallocate(mach_task_self_, address, size);
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_1000391B0();
        }
        goto LABEL_38;
      }

      id v9 = *(_OWORD *)v7;
      id v10 = *(_OWORD *)(v7 + 16);
      qword_1000747B0 = *(void *)(v7 + 32);
      xmmword_100074790 = v9;
      *(_OWORD *)&qword_1000747A0 = v10;
    }
  }

  if (address) {
    vm_deallocate(mach_task_self_, address, size);
  }
  CFTypeID v14 = IOServiceMatching("AGXAccelerator");
  v15 = (const void *)IOReportCopyChannelsWithID(v14, 0x505A454E47414745LL, 0LL);
  CFRelease(v14);
  if (!v15)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_1000391DC();
    }
    goto LABEL_8;
  }

  v2->gpuSubscription = (__IOReportSubscriptionCF *)IOReportCreateSubscription(0LL, v15, &v2->gpuChannels, 0LL, 0LL);
  CFRelease(v15);
  if (v2->gpuChannels && v2->gpuSubscription)
  {
    v2->lastGPUReading = (__CFDictionary *)IOReportCreateSamples();
    v2->lastGPUReadingTimestamp = mach_absolute_time();
  }

  if (byte_10007D470)
  {
    -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  17LL,  @"zETM",  17LL);
    dword_10007D1B4 = 0;
  }

  -[TGraphSampler addtGraphDataSource:]( +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance"),  "addtGraphDataSource:",  v2);
  mach_timebase_info(&info);
  LODWORD(v16) = info.numer;
  LODWORD(v17) = info.denom;
  v2->tbfactor = (double)v16 / (double)v17;
  return v2;
}

  self->brightnessLevelDown[6] = self->brightnessLevelDown[5];
  uint64_t v6 = self->brightnessLevelUp[*((unsigned __int8 *)&self->super.currentPower + 6) + 5];
  self->brightnessLevelDown[5] = v6;
  CFTypeID v7 = *(_DWORD *)&self->brightnessLevelDown[7];
  if (v7 < (int)v6)
  {
    uint64_t v6 = *(_DWORD *)&self->brightnessLevelDown[7];
    self->brightnessLevelDown[5] = v7;
  }

  if (!LOBYTE(self->powerLevelDown[8]))
  {
    if ((_DWORD)v6 != self->brightnessLevelDown[6])
    {
      uint64_t v8 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = 67109120;
        uint64_t v12 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<Notice> set Backlight: %d",  (uint8_t *)&v11,  8u);
        uint64_t v6 = self->brightnessLevelDown[5];
      }

      -[BackLightCC setBrightnessKey:value:](self, "setBrightnessKey:value:", @"MaxBrightness", v6);
    }

    maxLICeiling = self->_maxLICeiling;
    if ((_DWORD)maxLICeiling != self->_maxLICeilingSoft)
    {
      id v10 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = 67109120;
        uint64_t v12 = maxLICeiling;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> BL soft: %d", (uint8_t *)&v11, 8u);
        maxLICeiling = self->_maxLICeiling;
      }

      -[BackLightCC setBrightnessKey:value:](self, "setBrightnessKey:value:", @"BrightnessWeakCap", maxLICeiling);
      self->_maxLICeilingSoft = self->_maxLICeiling;
    }
  }

LABEL_17:
      v4 += *(void *)(v10 + 8);
      if (v4 >= *(void *)(v3 + 8)) {
        goto LABEL_23;
      }
    }
  }

  vm_deallocate(mach_task_self_, outputStruct, v33);
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_100039208();
  }
}

    if (self->gotDataToLogToLiteMode)
    {
      -[PowerlogSubkeyController setIntValue:forKey:]( self->_powerlogSubkeyController_Sensors_Components,  "setIntValue:forKey:",  sub_100021C84(),  @"PG0B");
      -[PowerlogSubkeyController printPowerLogDictionary]( self->_powerlogSubkeyController_Sensors_Components,  "printPowerLogDictionary");
    }
  }

uint64_t sub_10000CC64(uint64_t a1, uint64_t a2)
{
  uint64_t ChannelID = IOReportChannelGetChannelID(a2);
  unint64_t IntegerValue = IOReportSimpleGetIntegerValue(a2, 0LL);
  if (ChannelID == 0x505A454E47414745LL) {
    *(float *)(*(void *)(a1 + 32) + 96LL) = (float)IntegerValue / (float)*(unint64_t *)(a1 + 40);
  }
  return 0LL;
}

void sub_10000D438(id a1)
{
  qword_100074AE0 = objc_alloc_init(&OBJC_CLASS___CPMSHelper);
}

void sub_10000D6A0(void *a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 == -528318202)
  {
    if (byte_10007CB30)
    {
      uint64_t v8 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v13 = a4;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<Notice> CPMS Helper, peak pressure %lld",  buf,  0xCu);
      }
    }

    uint64_t v6 = (dispatch_queue_s *)[a1 cpmsHelperQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000E4A4;
    v9[3] = &unk_100060C58;
    v9[4] = a1;
    v9[5] = a4;
    CFTypeID v7 = v9;
  }

  else
  {
    if (a3 != -528318205) {
      return;
    }
    uint64_t v6 = (dispatch_queue_s *)[a1 cpmsHelperQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10000E34C;
    v10[3] = &unk_100061348;
    char v11 = a4;
    v10[4] = a1;
    CFTypeID v7 = v10;
  }

  dispatch_async(v6, v7);
}

void sub_10000E068(void *a1, uint64_t a2, unsigned __int8 *a3, int a4)
{
  if (a4 == 4)
  {
    if ((_DWORD)a2)
    {
      v5 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003962C(a2, v5, v6, v7, v8, v9, v10, v11);
      }
    }

    else
    {
      unsigned int v16 = [a1 getMitigationTypeForClientID:*a3];
      if (v16 != -1)
      {
        unsigned int v17 = v16;
        int v18 = (void *)a1[63];
        if (v18) {
          objc_msgSend( objc_msgSend(v18, "findComponent:"),  "setCurrentPower:",  *(void *)&a3[8 * *(int *)&byte_100061190[24 * v17 + 16]]);
        }
      }
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100039690(a4, v13);
    }
  }

void *sub_10000E34C(void *result, __n128 a2)
{
  uint64_t v2 = result;
  uint64_t v3 = 0LL;
  CFTypeRef v4 = &off_100061198;
  a2.n128_u64[0] = 67109634LL;
  __n128 v9 = a2;
  do
  {
    if (*((unsigned __int8 *)v4 - 8) == *((unsigned __int8 *)v2 + 40))
    {
      CFNumberRef result = [*(id *)(v2[4] + 504) findComponent:v3];
      if (result)
      {
        v5 = result;
        if (byte_10007CB30)
        {
          uint64_t v6 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            int v7 = *((unsigned __int8 *)v2 + 40);
            uint64_t v8 = *v4;
            *(_DWORD *)buf = v9.n128_u32[0];
            int v11 = v7;
            __int16 v12 = 1024;
            int v13 = v3;
            __int16 v14 = 2080;
            v15 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "<Notice> registration call back for clientID: %u MitigationType:%d clientName:%s",  buf,  0x18u);
          }
        }

        CFNumberRef result = objc_msgSend(v5, "setCPMSMitigationState:", objc_msgSend(v5, "isCPMSControlEnabled", *(_OWORD *)&v9));
      }
    }

    v4 += 3;
    ++v3;
  }

  while (v3 != 18);
  return result;
}

void sub_10000E4A4(uint64_t a1)
{
  if (byte_1000748C0)
  {
    -[TGraphSampler updateAppleCareState:value:]( +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance"),  "updateAppleCareState:value:",  4LL,  *(unsigned int *)(a1 + 40));
    if (notify_set_state(*(_DWORD *)(*(void *)(a1 + 32) + 512LL), *(void *)(a1 + 40)))
    {
      uint64_t v2 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_1000397CC(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }

    else if (notify_post("com.apple.system.peakpowerpressurelevel"))
    {
      uint64_t v10 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003979C(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }

void sub_10000E558( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000E568(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose((const void *)(v1 - 176), 8) = a1;
}

  ;
}

void sub_1000100E4(id a1)
{
  qword_10007C438 = objc_alloc_init(&OBJC_CLASS___TGraphSampler);
}

void sub_100011288(__CFArray *a1, CFStringRef format, uint64_t a3)
{
  CFStringRef v4 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, format, a3);
  CFArrayAppendValue(a1, v4);
  if (v4) {
    CFRelease(v4);
  }
}

void sub_1000112F4(__CFArray *a1, CFStringRef format, double a3)
{
  CFStringRef v4 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, format, *(void *)&a3);
  CFArrayAppendValue(a1, v4);
  if (v4) {
    CFRelease(v4);
  }
}

id sub_1000114C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIntValue:*(unsigned int *)(a1 + 48) forKey:*(void *)(a1 + 40)];
}

id sub_1000115C4(uint64_t a1)
{
  return objc_msgSend( objc_msgSend(*(id *)(*(void *)(a1 + 32) + 368), "cacheArray"),  "addObject:",  *(void *)(a1 + 40));
}

id sub_100011718(uint64_t a1)
{
  return objc_msgSend( *(id *)(*(void *)(a1 + 32) + 392),  "setObject:atIndexedSubscript:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44)),  *(unsigned int *)(a1 + 40));
}

id sub_1000118AC(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 392) isEqualToArray:*(void *)(*(void *)(a1 + 32) + 400)];
  if ((result & 1) == 0)
  {
    uint64_t v3 = -[NSMutableArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithObjects:",  &off_100067C20,  @"ThermalMiscState",  0LL);
    -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", *(void *)(*(void *)(a1 + 32) + 392LL));
    logEventForAppleCare(v3);
    if (byte_10007CB30)
    {
      CFStringRef v4 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v6 = v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> Logged for AC: %@", buf, 0xCu);
      }
    }

    id result = [*(id *)(*(void *)(a1 + 32) + 392) copy];
    *(void *)(*(void *)(a1 + 32) + 400LL) = result;
  }

  return result;
}

id sub_1000119D4(void *a1)
{
  id result = objc_msgSend(objc_msgSend(*(id *)(a1[4] + 368), "cacheArray"), "count");
  if (a1[5]) {
    BOOL v3 = result == 0LL;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    id result = [*(id *)(a1[4] + 368) logToPowerlogLite];
    *(void *)(a1[4] + 56LL) = a1[6];
  }

  return result;
}

void sub_100011A28(uint64_t a1)
{
  int v2 = PLShouldLogRegisteredEvent(18LL, @"TGraph");
  if (v2 || *(_BYTE *)(*(void *)(a1 + 32) + 49LL))
  {
    if (!gettimeofday(&v8, 0LL))
    {
      CFStringRef v3 = CFStringCreateWithFormat(0LL, 0LL, @"%0.2f", (double)v8.tv_usec / 1000000.0 + (double)v8.tv_sec);
      if (v3)
      {
        CFStringRef v4 = v3;
        if (v2)
        {
          uint64_t v5 = *(void *)(a1 + 32);
          if (*(_BYTE *)(v5 + 48))
          {
            [(id)v5 updateSubkeyController:*(void *)(v5 + 328) forControlList:*(void *)(v5 + 24)];
            [*(id *)(a1 + 32) updateSubkeyController:*(void *)(*(void *)(a1 + 32) + 336) forControlList:*(void *)(*(void *)(a1 + 32) + 16)];
            [*(id *)(*(void *)(a1 + 32) + 328) logToPowerlog:v4];
            [*(id *)(*(void *)(a1 + 32) + 336) logToPowerlog:v4];
            [*(id *)(*(void *)(a1 + 32) + 352) logToPowerlog:v4];
            uint64_t v5 = *(void *)(a1 + 32);
          }

          [(id)v5 updatePowerLogDictionaryForSensors];
          [*(id *)(*(void *)(a1 + 32) + 344) logToPowerlog:v4];
          [*(id *)(*(void *)(a1 + 32) + 360) logToPowerlog:v4];
        }

        uint64_t v6 = *(void *)(a1 + 32);
        if (*(_BYTE *)(v6 + 49))
        {
          [*(id *)(v6 + 384) logToPowerlog:v4];
          *(_BYTE *)(*(void *)(a1 + 32) + 49LL) = 0;
        }

        CFRelease(v4);
      }
    }
  }

  else if (byte_10007CB30)
  {
    uint64_t v7 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v8.tv_sec) = 136315138;
      *(__darwin_time_t *)((char *)&v8.tv_sec + 4) = (__darwin_time_t)"-[TGraphSampler logToPowerlog]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> %s: denied", (uint8_t *)&v8, 0xCu);
    }
  }

LABEL_11:
  uint64_t v7 = (int)directMapIntercept_low - 1LL;
  timeval v8 = v3[v7];
  uint64_t v9 = v3[directMapIntercept_low];
  if (LODWORD(v9) == LODWORD(v8)) {
    return 0;
  }
  else {
    return (int)(float)((float)((float)((float)(LODWORD(v9) - v4) * (float)self->_maxLoadIndexLimits[v7 + 7])
  }
                              + (float)((float)self->_maxLoadIndexLimits[directMapIntercept_low + 7]
}

  uint64_t v7 = (int)rowCount - 1LL;
  timeval v8 = temperatures[v7];
  uint64_t v9 = temperatures[rowCount];
  id result = 0.0;
  if (v9 != v8) {
    return (float)((float)(self->_accelerationFactors[v7] * (float)(v9 - v3))
  }
  return result;
}

      CFStringRef v3 = +[NSDictionary dictionaryWithContentsOfFile:]( NSDictionary,  "dictionaryWithContentsOfFile:",  objc_msgSend( objc_msgSend( @"/System/Library/ThermalMonitor/",  "stringByAppendingString:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", cStr)),  "stringByAppendingString:",  @"-Info.plist"));
      if (v3) {
        CFStringRef v3 = v3;
      }
      qword_10007C618 = (uint64_t)v3;
      *(_OWORD *)&buf.version = xmmword_100048350;
      *(_OWORD *)&buf.retain = xmmword_100048360;
      buf.copyDescription = (CFStringRef (__cdecl *)(const void *))0x100000000CLL;
      Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
      for (i = 0LL; i != 40; i += 4LL)
      {
        uint64_t v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&buf + i);
        CFArrayAppendValue(Mutable, v6);
        if (v6) {
          CFRelease(v6);
        }
      }

      if (Mutable)
      {
        uint64_t v7 = CFGetTypeID(Mutable);
        if (v7 == CFArrayGetTypeID())
        {
          Count = CFArrayGetCount(Mutable);
          if (Count >= 1)
          {
            uint64_t v9 = Count;
            uint64_t v10 = 0LL;
            uint64_t v11 = 0LL;
            uint64_t v12 = 0LL;
            do
            {
              int valuePtr = -1;
              ValueAtIndex = CFArrayGetValueAtIndex(Mutable, v10);
              uint64_t v14 = CFGetTypeID(ValueAtIndex);
              if (v14 == CFNumberGetTypeID()
                && (CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberIntType, &valuePtr),
                    _OSThermalNotificationSetLevelForBehavior(valuePtr, v11),
                    uint64_t v15 = _OSThermalNotificationLevelForBehavior(v11),
                    uint64_t v16 = valuePtr,
                    v15 != valuePtr))
              {
                int v18 = (os_log_s *)qword_10007CF50;
                if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(v51.version) = 67109376;
                  HIDWORD(v51.version) = v11;
                  LOWORD(v51.info) = 1024;
                  *(_DWORD *)((char *)&v51.info + 2) = v16;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "<Error> Failed to set OSThermalNotificationLevel %d with %d",  (uint8_t *)&v51,  0xEu);
                }

                uint64_t v17 = (v12 + 1);
                if ((int)v12 > 10)
                {
                  id v19 = (os_log_s *)qword_10007CF50;
                  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
                    sub_10003B210(&v47, v48, v19);
                  }
                }

                else
                {
                  LODWORD(v11) = v11 - 1;
                }
              }

              else
              {
                uint64_t v17 = v12;
              }

              uint64_t v11 = (v11 + 1);
              uint64_t v10 = (int)v11;
              uint64_t v12 = v17;
            }

            while (v9 > (int)v11);
          }

          if (byte_10007CB30)
          {
            id v20 = (os_log_s *)qword_10007CF50;
            if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v51.version) = 138412290;
              *(CFIndex *)((char *)&v51.version + 4) = (CFIndex)Mutable;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "<Notice> mitigation levels: %@",  (uint8_t *)&v51,  0xCu);
            }
          }
        }

        CFRelease(Mutable);
      }

      v21 = qword_10007C618;
      if (qword_10007C618)
      {
        uint64_t v22 = CFStringCreateWithCStringNoCopy(0LL, cStr, 0x8000100u, kCFAllocatorNull);
        if (v22)
        {
          v23 = v22;
          Length = CFStringGetLength(v22);
          if (Length < 1)
          {
            __int128 v27 = 0LL;
          }

          else
          {
            v25 = Length;
            __int128 v26 = 0LL;
            LODWORD(v27) = 0;
            __int128 v28 = 1;
            do
            {
              CharacterAtIndex = CFStringGetCharacterAtIndex(v23, v26);
              if ((v28 & 1) != 0) {
                __int128 v27 = (v27 + CharacterAtIndex);
              }
              else {
                __int128 v27 = (CharacterAtIndex * (_DWORD)v27);
              }
              v28 ^= 1u;
              ++v26;
            }

            while (v25 != v26);
          }

          CFRelease(v23);
          qword_10007C4A8 = -[ThermalManager initWithConfig:]( objc_alloc(&OBJC_CLASS___ThermalManager),  "initWithConfig:",  v21);
          [(id)qword_10007C4A8 SaveProductString:v27];
          sub_10001C93C(3);
        }

        if (byte_10007CB32) {
          qword_10007C600 = -1LL;
        }
        v31 = (const char *)sub_1000196B8();
        byte_1000748C2 = strstr(v31, "wdt_test=thermal") == 0LL;
        qword_10007C5E8 = (uint64_t)off_1000748C8;
        Current = CFRunLoopGetCurrent();
        qword_10007CB20 = (uint64_t)CFRetain(Current);
        sub_10001A120((const __SCPreferences *)qword_10007D168);
        memset(&v51, 0, sizeof(v51));
        if (SCPreferencesSetCallback((SCPreferencesRef)qword_10007D168, (SCPreferencesCallBack)sub_10001D29C, &v51))
        {
          if (SCPreferencesScheduleWithRunLoop( (SCPreferencesRef)qword_10007D168,  (CFRunLoopRef)qword_10007CB20,  kCFRunLoopDefaultMode))
          {
            *(double *)&qword_10007C5E0 = -kCFAbsoluteTimeIntervalSince1970;
            [(id)qword_10007C4A8 updatePrefs:qword_10007D168 :0];
            [(id)qword_10007C4A8 createNewProduct:qword_10007CB20];
            [(id)qword_10007C4A8 initDataCollection];
            sub_10001B940((const __SCPreferences *)qword_10007D168);
            __int16 v33 = +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance");
            if (byte_1000748C0) {
              int v34 = 100LL;
            }
            else {
              int v34 = 0LL;
            }
            -[TGraphSampler updatePowerlogMiscState:value:](v33, "updatePowerlogMiscState:value:", 5LL, v34);
            if (dword_10007C700)
            {
              if (byte_10007CB30)
              {
                v35 = (os_log_s *)qword_10007CF50;
                if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(buf.version) = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "<Notice> deregistering for wake notification before re-registering",  (uint8_t *)&buf,  2u);
                }
              }

              if (qword_10007C718)
              {
                CFRunLoopRemoveSource( (CFRunLoopRef)qword_10007CB20,  (CFRunLoopSourceRef)qword_10007C718,  kCFRunLoopDefaultMode);
                qword_10007C718 = 0LL;
              }

              if (dword_10007C710)
              {
                IODeregisterForSystemPower((io_object_t *)&dword_10007C710);
                dword_10007C710 = 0;
              }

              if (dword_10007C700)
              {
                IOServiceClose(dword_10007C700);
                dword_10007C700 = 0;
              }

              if (qword_10007C708)
              {
                IONotificationPortDestroy((IONotificationPortRef)qword_10007C708);
                qword_10007C708 = 0LL;
              }

              if (byte_10007CB30)
              {
                v36 = (os_log_s *)qword_10007CF50;
                if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(buf.version) = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "<Notice> deregistered for wake notification",  (uint8_t *)&buf,  2u);
                }
              }

              sub_100019FCC();
            }

            dword_10007C700 = IORegisterForSystemPower( 0LL,  (IONotificationPortRef *)&qword_10007C708,  (IOServiceInterestCallback)sub_10001D8D4,  (io_object_t *)&dword_10007C710);
            if (dword_10007C700 && qword_10007C708)
            {
              qword_10007C718 = (uint64_t)IONotificationPortGetRunLoopSource((IONotificationPortRef)qword_10007C708);
              CFRunLoopAddSource( (CFRunLoopRef)qword_10007CB20,  (CFRunLoopSourceRef)qword_10007C718,  kCFRunLoopDefaultMode);
              if (byte_10007CB30)
              {
                v37 = (os_log_s *)qword_10007CF50;
                if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(buf.version) = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "<Notice> registered for wake notification",  (uint8_t *)&buf,  2u);
                }
              }
            }

            else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
            {
              sub_10003B1E4();
            }

            [(id)qword_10007C4A8 createConnectionToCT];
            v38 = [(id)qword_10007C4A8 getProductTotalSensors];
            dword_10007C5C4 = v38;
            if (v38)
            {
              if (v38 >= 65 && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
                sub_10003B1B8();
              }
            }

            else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
            {
              sub_10003B18C();
            }

            if ((int)[(id)qword_10007C4A8 getProductTotalPowerSensors] >= 11
              && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
            {
              sub_10003B160();
            }

            qword_10007D160 = 0LL;
            dword_10007C720 = dword_10007C5C4 - 1;
            if (dword_10007C5C4 >= 1)
            {
              v40 = 4LL * dword_10007C5C4;
              memset_pattern16(dword_10007D05C, &unk_100048370, v40);
              memset_pattern16(dword_10007CF5C, &unk_100048370, v40);
              memset_pattern16(dword_10007C4C0, &unk_100048370, v40);
            }

            qword_10007C5F8 = -[HidSensors getWatchDogMask]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "getWatchDogMask");
            qword_10007C638 = qword_10007C5F8;
            dword_10007C4B0 = [(id)qword_10007C4A8 getProductCalibrationSensorID];
            dword_10007C4B4 = [(id)qword_10007C4A8 getProductCalibrationDefault];
            dword_10007C5D8 = [(id)qword_10007C4A8 getRequiredCalibrationResistorSamples];
            qword_10007C5C8 = (uint64_t)[(id)qword_10007C4A8 getProductFilterValues];
            if (!qword_10007C5C8 && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
              sub_10003B134();
            }
            if (!byte_10007CB32) {
              qword_10007C600 = 1LL;
            }
            v41 = -[ContextAwareThermalManager getContextState:]( +[ContextAwareThermalManager sharedInstance]( &OBJC_CLASS___ContextAwareThermalManager,  "sharedInstance"),  "getContextState:",  0LL) != -1;
            v42 = [(id)qword_10007C4A8 getModeratePressureVersion];
            v43 = objc_alloc(&OBJC_CLASS___NotificationManager);
            qword_10007CB38 = -[NotificationManager init:withSolarInfo:withModeratePressureVersion:]( v43,  "init:withSolarInfo:withModeratePressureVersion:",  dword_10007C720,  v41,  v42);
            [(id)qword_10007C4A8 initializeReadPrefs:qword_10007D168];
            sub_100023260((uint64_t)@"/Library/Preferences/SystemConfiguration/OSThermalStatus.plist");
            v44 = (void *)qword_10007C4A8;
            v45 = CFAbsoluteTimeGetCurrent();
            buf.version = 0LL;
            memset(&buf.retain, 0, 24);
            buf.info = v44;
            if (qword_10007C728)
            {
              CFRunLoopTimerInvalidate((CFRunLoopTimerRef)qword_10007C728);
              CFRelease((CFTypeRef)qword_10007C728);
            }

            qword_10007C728 = (uint64_t)CFRunLoopTimerCreate( kCFAllocatorDefault,  v45,  5.0,  0LL,  0LL,  (CFRunLoopTimerCallBack)sub_10001D2D0,  &buf);
            CFRunLoopAddTimer((CFRunLoopRef)qword_10007CB20, (CFRunLoopTimerRef)qword_10007C728, kCFRunLoopDefaultMode);
          }

          else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
          {
            sub_10003B0C8();
          }
        }

        else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
        {
          sub_10003B05C();
        }
      }

      else
      {
        v30 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf.version) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "<Notice> no thermal model for device",  (uint8_t *)&buf,  2u);
        }

        qword_10007C600 = -1LL;
        sub_10001C93C(0);

        qword_10007CF50 = 0LL;
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003AFC4();
  }

    if (byte_10007CB30)
    {
      uint64_t v10 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "<Notice> No chargeLimit table defined in the plist, using the default one",  buf,  2u);
      }
    }

    *(void *)&v5->familyCode = &off_100067DD8;
    *(NSArray **)((char *)&v5->maxLITable + 4) = (NSArray *)&off_100067DF0;
    goto LABEL_15;
  }

  return v5;
}

void sub_100012578(id a1)
{
  qword_10007C450 = (uint64_t)os_log_create("com.apple.thermalmonitor", "agingcontroller");
}

void sub_100012E38( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_100012E68(uint64_t a1, uint64_t a2)
{
}

void sub_100012E78(uint64_t a1)
{
}

void sub_100012E84(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + 32;
  CFStringRef v3 = (os_log_s *)objc_msgSend( (id)objc_opt_class(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2),  "log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [*(id *)(*(void *)(*(void *)v2 + 8) + 40) mitigationState];
    int v9 = 136315394;
    uint64_t v10 = "-[AgingController initWithParams:currentWRa:currentUPOCount:]_block_invoke";
    __int16 v11 = 1024;
    unsigned int v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Notification callback called. Mitigation state %d\n",  (uint8_t *)&v9,  0x12u);
  }

  if ([*(id *)(*(void *)(*(void *)v2 + 8) + 40) mitigationState] != (id)1)
  {
    uint64_t v6 = (os_log_s *)objc_msgSend((id)objc_opt_class(*(void *)(*(void *)(*(void *)v2 + 8) + 40), v5), "log");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100039D98(v2, v6);
    }
  }

  [*(id *)(*(void *)(*(void *)v2 + 8) + 40) updateMitigationStateAndNotify:3];
  objc_msgSend( objc_msgSend(*(id *)(*(void *)(*(void *)v2 + 8) + 40), "defaults"),  "setObject:forKey:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(*(id *)(*(void *)(*(void *)v2 + 8) + 40), "mitigationState")),  @"MitigationState");
  timeval v8 = (os_log_s *)objc_msgSend((id)objc_opt_class(*(void *)(*(void *)(*(void *)v2 + 8) + 40), v7), "log");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100039CFC(v2);
  }
}

void sub_1000136C4(uint64_t a1)
{
  uint64_t v2 = IOServiceMatching("ApplePPM");
  *(_DWORD *)(*(void *)(a1 + 32) + 16LL) = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v4 + 16))
  {
    uint64_t v5 = (os_log_s *)objc_msgSend((id)objc_opt_class(v4, v3), "log");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003A2D8();
    }
  }

void sub_100013794(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (os_log_s *)objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32), a2), "log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10003A35C(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  mach_service = xpc_connection_create_mach_service( "com.apple.thermalMonitor.displayMitigationsEnabledNote",  *(dispatch_queue_t *)(*(void *)(a1 + 32) + 32LL),  2uLL);
  xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v12, "postNotification", 1);
  uint64_t v13 = dispatch_semaphore_create(0LL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10001394C;
  handler[3] = &unk_1000615C0;
  handler[4] = *(void *)(a1 + 32);
  xpc_connection_set_event_handler(mach_service, handler);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(dispatch_queue_s **)(v14 + 32);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000139A0;
  v20[3] = &unk_1000615E8;
  v20[4] = v13;
  v20[5] = v14;
  xpc_connection_send_message_with_reply(mach_service, v12, v15, v20);
  xpc_connection_activate(mach_service);
  uint64_t v17 = (os_log_s *)objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32), v16), "log");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10003A330();
  }
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  id v19 = (os_log_s *)objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32), v18), "log");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_10003A304();
  }
  xpc_connection_cancel(mach_service);
  if (v12) {
    xpc_release(v12);
  }
  if (v13) {
    dispatch_release(v13);
  }
  if (mach_service) {
    xpc_release(mach_service);
  }
}

void sub_10001394C(uint64_t a1, void *a2)
{
  if (a2 == &_xpc_error_connection_interrupted)
  {
    uint64_t v2 = (os_log_s *)objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32), a2), "log");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10003A3CC();
    }
  }

void sub_1000139A0(uint64_t a1)
{
  uint64_t v3 = (os_log_s *)objc_msgSend((id)objc_opt_class(*(void *)(a1 + 40), v2), "log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10003A3F8();
  }
}

void sub_100013AE8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100013AF8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100013B08( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

LABEL_13:
    ++v3;
  }

  while (v3 != 17);
  if (byte_10007CB30)
  {
    uint64_t v10 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67113216;
      v12[1] = v45[3];
      uint64_t v13 = 1024;
      uint64_t v14 = v45[4];
      uint64_t v15 = 1024;
      uint64_t v16 = v45[0];
      uint64_t v17 = 1024;
      uint64_t v18 = v45[1];
      id v19 = 1024;
      id v20 = v45[2];
      v21 = 1024;
      uint64_t v22 = v45[5];
      v23 = 1024;
      v24 = v45[6];
      v25 = 1024;
      __int128 v26 = v45[7];
      __int128 v27 = 1024;
      __int128 v28 = v45[8];
      __int128 v29 = 1024;
      v30 = v45[9];
      v31 = 1024;
      v32 = v45[10];
      __int16 v33 = 1024;
      int v34 = v45[11];
      v35 = 1024;
      v36 = v45[12];
      v37 = 1024;
      v38 = v45[13];
      v39 = 1024;
      v40 = v45[15];
      v41 = 1024;
      v42 = v45[14];
      v43 = 1024;
      v44 = v45[16];
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "<Notice> ReleaseMaxLI DT: BL %d Charge %d CPU %d SOC %d Radio %d ThermalLevel %d RefreshRate %d Fan %d WiFi %d A udioAmp %d Arc %d Speaker %d Package %d RadioModemBand %d RadioFR2RFCG %d RadioFR2RFBC %d RadioFR2RFBand %d",  (uint8_t *)v12,  0x68u);
    }
  }

  if (byte_10007CB30)
  {
    uint64_t v16 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "<Notice> Copied LTS IS data from PMP",  buf,  2u);
    }
  }

  LOBYTE(v17) = 1;
  return v17;
}

id sub_100013F04(uint64_t a1)
{
  for (uint64_t i = 0LL; i != 17; ++i)
  {
    id result = [*(id *)(a1 + 32) getReleaseRateForComponent:i];
    *(_DWORD *)(*(void *)(a1 + 32) + 4 * i + 60) = (_DWORD)result;
  }

  return result;
}

LABEL_12:
  xpc_object_t v12 = &afLUTColumns[v11];
  uint64_t v13 = -[LifetimeServoAFLUTColumn voltage](*(v12 - 1), "voltage");
  uint64_t v14 = -[LifetimeServoAFLUTColumn voltage](afLUTColumns[v11], "voltage");
  -[LifetimeServoAFLUTColumn accelerationFactor:](*(v12 - 1), "accelerationFactor:", v4);
  uint64_t v16 = v15;
  -[LifetimeServoAFLUTColumn accelerationFactor:](afLUTColumns[v11], "accelerationFactor:", v4);
  uint64_t v18 = 0.0;
  if (v14 != v13) {
  return v18;
  }
}

  uint64_t v10 = [(id)qword_10007D4E0 getCurrentCPULoadingIndex:v4];
  LODWORD(v2) = objc_msgSend( -[NSArray objectAtIndex:](v2->_maxLoadIndexTable, "objectAtIndex:", 0),  "getControlEffortForMaxLI:",  v10);
  if (byte_10007CB30)
  {
    uint64_t v8 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      xpc_object_t v12 = 67109632;
      uint64_t v13 = (int)v4;
      uint64_t v14 = 1024;
      uint64_t v15 = v10;
      uint64_t v16 = 1024;
      uint64_t v17 = (int)v2;
      uint64_t v9 = "<Notice> Seeding from CPU power %d, seed maxLI %d, CE %d";
      goto LABEL_15;
    }
  }

  return v2;
}

CFNumberRef sub_1000151A0(uint64_t a1)
{
  return sub_1000211FC( *(__CFDictionary **)(*(void *)(a1 + 32) + 140LL),  kCTThermalTxBackoff,  kCFNumberSInt32Type,  (void *)(*(void *)(a1 + 32) + 172LL));
}

id sub_10001541C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unsigned int v2 = *(_DWORD *)(v1 + 84) & ~(*(int *)(v1 + 84) >> 31);
  if (v2 >= 0x64) {
    unsigned int v2 = 100;
  }
  *(_DWORD *)(v1 + 172) = dword_10004812C[v2];
  return [*(id *)(a1 + 32) calculateAdditionalRadioMitigations];
}

void sub_1000155F8(int a1, CFStringRef theString1, uint64_t a3, void *a4)
{
  if (CFStringCompare(theString1, kCTDaemonReadyNotification, 0LL))
  {
    uint64_t v6 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003A658((uint64_t)theString1, v6, v7);
    }
  }

  else
  {
    if (byte_10007CB30)
    {
      uint64_t v8 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> CoreTelephony is ready", v9, 2u);
      }
    }

    [a4 initializeRadio];
  }

void sub_1000157CC(uint64_t a1)
{
  uint64_t v2 = _CTServerConnectionConfigMaxRadioPower( *(void *)(*(void *)(a1 + 32) + 156LL),  *(void *)(*(void *)(a1 + 32) + 140LL));
  if ((_DWORD)v2)
  {
    uint64_t v3 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003A6F0(v2, SHIDWORD(v2), v3);
    }
  }

id sub_100015E8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleBrightnessClientNotification:a2 value:a3];
}

id sub_100016118(uint64_t a1)
{
  return [*(id *)(a1 + 32) processPotentialSolarStateChange:1];
}

float sub_100016188(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 28LL) = *(_DWORD *)(a1 + 40);
  if (byte_10007CB30)
  {
    uint64_t v2 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 28LL);
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "<Notice> _currentSemanticAmbientLightLevel %d",  (uint8_t *)v5,  8u);
    }
  }

  [*(id *)(a1 + 32) processPotentialSolarStateChange:0];
  float result = (float)*(unsigned int *)(*(void *)(a1 + 32) + 28LL);
  *(float *)&dword_10007D1A0 = result;
  return result;
}

void sub_100016810( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id sub_100016834(void *a1, uint64_t a2, void *a3)
{
  id result = [a3 BOOLValue];
  uint64_t v5 = *(void *)(a1[5] + 8LL);
  if (*(unsigned __int8 *)(v5 + 24) != (_DWORD)result || !*(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL))
  {
    *(_BYTE *)(v5 + 24) = (_BYTE)result;
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
    return (id)(*(uint64_t (**)(void))(a1[4] + 16LL))();
  }

  return result;
}

id sub_100016964(uint64_t a1)
{
  return [*(id *)(a1 + 32) unregisterNotificationForKeys:*(void *)(a1 + 40)];
}

uint64_t sub_100016A40(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), a2 != 0);
}

void sub_100016AA4(id a1)
{
  qword_10007C480 = objc_alloc_init(&OBJC_CLASS___ContextAwareThermalManager);
}

NSDictionary *sub_100017070(unsigned int *a1)
{
  v3[0] = @"TSLE";
  v4[0] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[8]);
  v3[1] = @"TN0n";
  v4[1] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[9]);
  v3[2] = @"Die_Temp_MaxAverage";
  v4[2] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[10]);
  v3[3] = @"Die_Temp_MaxMax";
  v4[3] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[11]);
  v3[4] = @"FanRPM";
  v4[4] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[12]);
  v3[5] = @"Pressure_Level";
  v4[5] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[13]);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  6LL);
}

void sub_100018630(id a1)
{
  qword_10007C490 = objc_alloc_init(&OBJC_CLASS___RadioTS);
}

void sub_1000186D8(id a1)
{
  qword_10007C4A0 = objc_alloc_init(&OBJC_CLASS___SensorExchangeHelper);
}

LABEL_14:
      a3->SensorExchangeUpdateNeeded = 0;
      ++a3->data.BYTES.p1[2];
    }
  }

  else
  {
    uint64_t v22 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003AA90(v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }

void sub_10001968C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void *sub_1000196B8()
{
  size_t v7 = 1024LL;
  int v0 = sysctlbyname("kern.bootargs", &unk_10007CB50, &v7, 0LL, 0LL);
  uint64_t v1 = (os_log_s *)qword_10007CF50;
  BOOL v2 = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v2)
    {
      int v3 = __error();
      uint64_t v4 = strerror(*v3);
      *(_DWORD *)buf = 136315138;
      uint64_t v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "<Notice> could not retrieve device boot-args, failed with error: %s",  buf,  0xCu);
    }

    return &unk_100048334;
  }

  else
  {
    uint64_t v5 = &unk_10007CB50;
    if (v2)
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v9 = (char *)&unk_10007CB50;
      _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "<Notice> retrieved current device boot-args: %s",  buf,  0xCu);
    }
  }

  return v5;
}

id sub_1000197DC(uint64_t a1)
{
  id v2 = [(id)qword_10007C4A8 getMaxSensorValue];
  [(id)qword_10007CB38 updateMaxValueToken:v2];
  return [(id)qword_10007CB38 updateThermalNotification:a1];
}

id sub_100019824(uint64_t a1)
{
  return objc_msgSend( (id)qword_10007CB38,  "updateThermalPressureLevelNotification:shouldForceThermalPressure:",  a1,  objc_msgSend((id)qword_10007C4A8, "getPotentialForcedThermalPressureLevel"));
}

id sub_100019860(uint64_t a1)
{
  return [(id)qword_10007CB38 setThermalPressureLevelNotification:a1];
}

id sub_100019870(uint64_t a1)
{
  return [(id)qword_10007CB38 updateThermalNotification:a1];
}

id sub_100019880(uint64_t a1)
{
  return [(id)qword_10007CB38 sendRadioNotification:a1];
}

uint64_t sub_100019890(uint64_t result, int a2, int a3, int a4)
{
  qword_10007C630 |= 1LL << result;
  if (dword_10007C4B0 == (_DWORD)result)
  {
    dword_10007C4B8 = dword_10007C4B4 - a2;
  }

  else if (a4)
  {
    a2 += dword_10007C4B8;
  }

  if (byte_10007C4BC) {
    int v4 = a3;
  }
  else {
    int v4 = a2;
  }
  if (byte_10007CF58) {
    dword_10007CF5C[(int)result] = v4;
  }
  else {
    a3 = v4;
  }
  if (byte_10007CB40)
  {
    uint64_t v5 = (int)result;
    if ((qword_10007D160 & (1LL << result)) != 0) {
      a3 = dword_10007D05C[(int)result];
    }
    else {
      dword_10007D05C[(int)result] = a3;
    }
  }

  else
  {
    uint64_t v5 = (int)result;
    dword_10007D05C[(int)result] = a3;
  }

  dword_10007C4C0[v5] = a3;
  return result;
}

uint64_t sub_100019974(uint64_t a1, uint64_t a2)
{
  return a2;
}

BOOL sub_1000199BC(CFStringRef key, const char *a2)
{
  io_registry_entry_t v4 = dword_10007C5C0;
  if (!dword_10007C5C0)
  {
    io_registry_entry_t v4 = sub_100020E9C(a2, 0LL, 0LL);
    dword_10007C5C0 = v4;
    if (!v4)
    {
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003ACB8();
      }
      return 0LL;
    }
  }

  uint64_t v5 = (const __CFBoolean *)sub_100020F34(key, v4);
  if (!v5) {
    return 0LL;
  }
  uint64_t v6 = v5;
  CFTypeID v7 = CFGetTypeID(v5);
  BOOL v9 = v7 == CFBooleanGetTypeID() && kCFBooleanTrue == v6;
  CFRelease(v6);
  return v9;
}

uint64_t sub_100019A70()
{
  return byte_10007CB4A;
}

BOOL sub_100019A7C()
{
  time_t v0 = time(0LL);
  if (v0 == -1) {
    return 0LL;
  }
  uint64_t v1 = v0;
  uint64_t v2 = qword_1000748D0;
  BOOL v4 = v0 < qword_1000748D0 || v0 > qword_1000748D0 + 59;
  if (v4)
  {
    uint64_t v5 = dword_10007C5C4;
    if (dword_10007C5C4 >= 1)
    {
      uint64_t v6 = 0LL;
      int v7 = byte_10007CB40;
      uint64_t v8 = (_DWORD *)(qword_10007C5C8 + 4);
      unint64_t v9 = qword_10007D160;
      do
      {
        if (!v7 || ((v9 >> v6) & 1) == 0)
        {
          dword_10007D05C[v6] = -32768;
          dword_10007CF5C[v6] = -32768;
          *uint64_t v8 = 0x80000000;
        }

        dword_10007C4C0[v6] = dword_10007D05C[v6];
        ++v6;
        v8 += 2;
      }

      while (v5 != v6);
    }

    qword_10007C630 = 0LL;
    dword_10007C5D0 = 0;
    dword_10007C5D4 = 0;
    if (byte_10007CB30)
    {
      uint64_t v10 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134218240;
        uint64_t v13 = v1;
        __int16 v14 = 2048;
        uint64_t v15 = v2;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "<Notice> resetting temps: now = %ld, last update = %ld",  (uint8_t *)&v12,  0x16u);
      }
    }
  }

  qword_1000748D0 = v1;
  return v4;
}

uint64_t sub_100019C18(uint64_t a1, int a2, int a3)
{
  int v4 = a2;
  if (!qword_10007C5C8 || (int v5 = *(_DWORD *)(qword_10007C5C8 + 8LL * (int)a1)) == 0)
  {
LABEL_14:
    int v11 = v4;
    return sub_100019890(a1, v11, v4, a3);
  }

  uint64_t v6 = qword_10007C5C8 + 8LL * (int)a1;
  int v9 = *(_DWORD *)(v6 + 4);
  int v7 = (int *)(v6 + 4);
  int v8 = v9;
  if (v9 == 0x80000000)
  {
    if (dword_10007C4B0 == (_DWORD)a1)
    {
      if (dword_10007C5D8)
      {
        ++dword_10007C5D0;
        dword_10007C5D4 += a2;
      }

      else
      {
        int v4 = dword_10007C4B4;
      }
    }

    *int v7 = v4 << 16;
    goto LABEL_14;
  }

  if (dword_10007C4B0 == (_DWORD)a1 && (int v10 = dword_10007C5D0, dword_10007C5D0 < dword_10007C5D8))
  {
    ++dword_10007C5D0;
    dword_10007C5D4 += a2;
    int v11 = dword_10007C5D4 / (v10 + 1);
    *int v7 = v11 << 16;
    int v4 = v11;
  }

  else
  {
    int v12 = v8 + (unsigned __int16)(327680 / (v5 + 5)) * (a2 - (v8 >> 16));
    *int v7 = v12;
    int v11 = v12 >> 16;
  }

  return sub_100019890(a1, v11, v4, a3);
}

uint64_t sub_100019D18()
{
  return byte_10007C5DC;
}

void sub_100019D24()
{
  if ((int)qword_10007CB28 < 12)
  {
    sub_100019FCC();
    sub_1000219C8(0LL, (const __CFString *)qword_10007C5E8, @"wake", (CFTimeInterval *)&qword_10007C5E0);
  }

  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (*(double *)&qword_10007C5E0 >= Current + 60.0)
    {
      if (byte_10007CB30)
      {
        int v3 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 138412290;
          int v9 = 0LL;
          _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "<Notice> not setting timer: already set to wake at %@",  (uint8_t *)&v8,  0xCu);
        }
      }
    }

    else
    {
      *(double *)&qword_10007C5E0 = Current + 600.0;
      if (byte_10007CB30)
      {
        uint64_t v1 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          if (byte_1000748C0) {
            uint64_t v2 = "";
          }
          else {
            uint64_t v2 = "Disabled: ";
          }
          int v8 = 136315394;
          int v9 = v2;
          __int16 v10 = 1024;
          int v11 = 600;
          _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "<Notice> %ssetting wake up timer for %d secs from now",  (uint8_t *)&v8,  0x12u);
        }
      }

      if (byte_1000748C0) {
        sub_100021910(0LL, (const __CFString *)qword_10007C5E8, @"wake", *(CFAbsoluteTime *)&qword_10007C5E0);
      }
    }

    if ((int)qword_10007CB28 < 16)
    {
      sub_100019FCC();
    }

    else
    {
      int v4 = (os_log_s *)qword_10007CF50;
      BOOL v5 = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT);
      int v6 = byte_1000748C0;
      if (v5)
      {
        if (byte_1000748C0) {
          int v7 = "";
        }
        else {
          int v7 = "Disabled: ";
        }
        int v8 = 136315138;
        int v9 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "<Notice> %sthermal status level critical -- cooling down",  (uint8_t *)&v8,  0xCu);
        int v6 = byte_1000748C0;
      }

      if (v6)
      {
        qword_10007C630 = 0LL;
        if (byte_10007CB40)
        {
          byte_10007CB40 = 0;
          qword_10007D160 = 0LL;
        }

        if (byte_10007D471) {
          byte_10007D471 = 0;
        }
        sub_10002187C();
      }
    }
  }

void sub_100019FCC()
{
  if (dword_10007C644)
  {
    IOReturn v0 = IOPMAssertionRelease(dword_10007C644);
    if (v0)
    {
      int v1 = v0;
      uint64_t v2 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003ACE4(v1, v2, v3);
      }
    }

    else if (byte_10007CB30)
    {
      int v4 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        v5[0] = 67109120;
        v5[1] = dword_10007C644;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "<Notice> cleared idle sleep assertion: 0x%08x",  (uint8_t *)v5,  8u);
      }
    }

    dword_10007C644 = 0;
  }

id sub_10001A0C4()
{
  if (byte_10007C5F0) {
    uint64_t v0 = 0LL;
  }
  else {
    uint64_t v0 = byte_10007C5DC;
  }
  -[HidSensors setInfoOnlySensorsActive:]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "setInfoOnlySensorsActive:",  v0);
  return -[ContextAwareThermalManager setInfoOnlySensorsActive:]( +[ContextAwareThermalManager sharedInstance](&OBJC_CLASS___ContextAwareThermalManager, "sharedInstance"),  "setInfoOnlySensorsActive:",  v0);
}

uint64_t sub_10001A118()
{
  return 0LL;
}

void sub_10001A120(const __SCPreferences *a1)
{
  if (SCPreferencesGetValue(a1, @"thermalUseRawValuesPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"thermalUseRawValues", kCFBooleanFalse);
  }
  if (SCPreferencesGetValue(a1, @"forceSkipInfoOnlySensorsPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"forceSkipInfoOnlySensors", kCFBooleanFalse);
  }
  if (SCPreferencesGetValue(a1, @"hipPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"hipOverride", kCFBooleanTrue);
  }
  SCPreferencesSetValue(a1, @"simulateHip", kCFBooleanFalse);
  SCPreferencesSetValue(a1, @"forceHIPWhenConnected", kCFBooleanFalse);
  SCPreferencesSetValue(a1, @"BacklightStatus", kCFBooleanTrue);
  if (SCPreferencesGetValue(a1, @"sunlightOverridePersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"sunlightOverride");
  }
  if (SCPreferencesGetValue(a1, @"OSThermalNotificationPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"OSThermalNotificationEnabled", kCFBooleanTrue);
  }
  if (SCPreferencesGetValue(a1, @"candidateControlLoopsEnabledPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"candidateControlLoopsEnabled", kCFBooleanFalse);
  }
  if (SCPreferencesGetValue(a1, @"engageBehaviorPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"engageBehavior", kCFBooleanTrue);
  }
  if (SCPreferencesGetValue(a1, @"overrideControlEffortPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"overrideControlEffort", kCFBooleanFalse);
  }
  if (SCPreferencesGetValue(a1, @"overrideSensorLIPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"overrideSensorLI", kCFBooleanFalse);
  }
  if (SCPreferencesGetValue(a1, @"overrideTxMaxLimitPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"overrideTxMaxLimitKey", kCFBooleanFalse);
  }
  if (SCPreferencesGetValue(a1, @"tGraphTestCaseNumberPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"tGraphTestCaseNumber");
  }
  if (SCPreferencesGetValue(a1, @"tGraphTestCaseNamePersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"tGraphTestCaseName");
  }
  if (SCPreferencesGetValue(a1, @"LifetimeServoIntegratorState_P_PersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"LifetimeServoIntegratorState_P");
  }
  if (SCPreferencesGetValue(a1, @"LifetimeServoDieTempMaxMaxPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"LifetimeServoDieTempMaxMax");
  }
  if (SCPreferencesGetValue(a1, @"LifetimeServoDieTempMaxAveragePersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"LifetimeServoDieTempMaxAverage");
  }
  if (SCPreferencesGetValue(a1, @"LifetimeServoInstantaneousAF_P_PersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"LifetimeServoInstantaneousAF_P");
  }
  if (SCPreferencesGetValue(a1, @"LifetimeServoIntegratorState_E_PersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"LifetimeServoIntegratorState_E");
  }
  if (SCPreferencesGetValue(a1, @"LifetimeServoInstantaneousAF_E_PersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"LifetimeServoInstantaneousAF_E");
  }
  if (SCPreferencesGetValue(a1, @"LifetimeServoIntegratorState_G_PersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"LifetimeServoIntegratorState_G");
  }
  if (SCPreferencesGetValue(a1, @"LifetimeServoInstantaneousAF_G_PersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"LifetimeServoInstantaneousAF_G");
  }
  if (SCPreferencesGetValue(a1, @"LifetimeServoDieTempTarget_PersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"LifetimeServoDieTempTarget");
  }
  if (SCPreferencesGetValue(a1, @"ArcModuleThresholdKeyPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"ArcModuleThresholdKey");
  }
  if (SCPreferencesGetValue(a1, @"ArcVirtualThresholdKeyPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesRemoveValue(a1, @"ArcVirtualThresholdKey");
  }
  if (SCPreferencesGetValue(a1, @"OSThermalNotificationLoggingEnabledPersistentlyEnabled") != kCFBooleanTrue) {
    SCPreferencesSetValue(a1, @"OSThermalNotificationLoggingEnabled", kCFBooleanFalse);
  }
  uint64_t v2 = (const char *)sub_1000196B8();
  if (strstr(v2, "default_tgraph_disabled"))
  {
    uint64_t v3 = a1;
LABEL_58:
    SCPreferencesRemoveValue(v3, @"tGraphLogFile");
    goto LABEL_59;
  }

  if (!sub_100022CCC())
  {
    uint64_t v3 = a1;
    goto LABEL_58;
  }

  Value = (const __CFString *)SCPreferencesGetValue(a1, @"tGraphLogFile");
  if (!Value
    || (v5 = Value, CFTypeID v6 = CFGetTypeID(Value), v6 != CFStringGetTypeID())
    || SCPreferencesGetValue(a1, @"tGraphLogFilePersistentlyEnabled") != kCFBooleanTrue
    || CFStringCompare(v5, @"/var/log/tgraph.csv", 0LL) == kCFCompareEqualTo)
  {
    SCPreferencesSetValue(a1, @"tGraphLogFilePersistentlyEnabled", kCFBooleanTrue);
    SCPreferencesSetValue(a1, @"tGraphLogFile", @"/var/log/tgraph.csv");
    SCPreferencesSetValue(a1, @"forceSkipInfoOnlySensors", kCFBooleanTrue);
    char v7 = 1;
    goto LABEL_60;
  }

LABEL_59:
  char v7 = 0;
LABEL_60:
  byte_10007C5F1 = v7;
  int v8 = (const __CFBoolean *)SCPreferencesGetValue(a1, @"OSThermalNotificationLoggingEnabled");
  byte_10007CB30 = v8 == kCFBooleanTrue;
  if (v8 == kCFBooleanTrue)
  {
    int v9 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "en";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "<Notice> sensor status logging %sabled",  (uint8_t *)&v10,  0xCu);
    }
  }

  if (!SCPreferencesCommitChanges(a1) && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_100038BC0();
  }
}

void sub_10001A838(SCPreferencesRef prefs, uint64_t a2, int a3)
{
  BOOL v5 = &byte_100074AE8[29976];
  if (a3)
  {
    byte_10007CB30 = SCPreferencesGetValue(prefs, @"OSThermalNotificationLoggingEnabled") == kCFBooleanTrue;
    if (byte_10007CB30)
    {
      CFTypeID v6 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "en";
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "<Notice> sensor status logging %sabled",  buf,  0xCu);
      }
    }

    CFBooleanRef Value = (CFBooleanRef)SCPreferencesGetValue(prefs, @"overrideSensor");
    int v8 = Value == kCFBooleanTrue;
    byte_10007CB40 = Value == kCFBooleanTrue;
    if (byte_10007CB30)
    {
      int v9 = Value;
      int v10 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = "dis";
        if (v9 == kCFBooleanTrue) {
          int v11 = "en";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "<Notice> sensor status thermalOverrideSensor %sabled",  buf,  0xCu);
        int v8 = byte_10007CB40;
      }
    }

    if (v8)
    {
      LODWORD(valuePtr) = 0;
      LODWORD(values) = 0;
      CFPropertyListRef v12 = SCPreferencesGetValue(prefs, @"setSensorID");
      uint64_t v13 = (const __CFBoolean *)SCPreferencesGetValue(prefs, @"overrideSensorPersistentlyEnabled");
      if (v12)
      {
        __int16 v14 = v13;
        CFTypeID v15 = CFGetTypeID(v12);
        if (v15 == CFArrayGetTypeID() && CFArrayGetCount((CFArrayRef)v12) == 2)
        {
          ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)v12, 0LL);
          CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr);
          uint64_t v17 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)v12, 1LL);
          CFNumberGetValue(v17, kCFNumberIntType, &values);
          int v18 = (int)valuePtr;
          if (valuePtr <= 0x3F)
          {
            int v19 = (int)values;
            dword_10007D05C[valuePtr] = (int)values;
            uint64_t v20 = qword_10007D160 | (1LL << v18);
            qword_10007D160 = v20;
            log = (os_log_s *)qword_10007CF50;
            if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)&uint8_t buf[4] = v18;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v19;
              *(_WORD *)&buf[14] = 2048;
              *(void *)&__int128 v106 = v20;
              _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "<Notice> sensor ID: %d set with temperature: %d - Overridemask %llx",  buf,  0x18u);
            }
          }

          if (v14 != kCFBooleanTrue)
          {
            SCPreferencesRemoveValue(prefs, @"setSensorID");
            if (!SCPreferencesCommitChanges(prefs) && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
              sub_100038BC0();
            }
          }
        }
      }

      CFPropertyListRef v21 = SCPreferencesGetValue(prefs, @"setSensor4CCID");
      CFPropertyListRef v22 = SCPreferencesGetValue(prefs, @"setSensor4CCVAL");
      if (v21)
      {
        v23 = v22;
        CFTypeID v24 = CFGetTypeID(v21);
        if (v24 == CFStringGetTypeID() && v23 != 0LL)
        {
          CFTypeID v26 = CFGetTypeID(v23);
          if (v26 == CFNumberGetTypeID())
          {
            CFNumberGetValue((CFNumberRef)v23, kCFNumberIntType, &values);
            sub_1000220E0((uint64_t)v21, (int)values);
            if (SCPreferencesGetValue(prefs, @"override4CCPersistentlyEnabled") != kCFBooleanTrue)
            {
              SCPreferencesRemoveValue(prefs, @"setSensor4CCID");
              SCPreferencesRemoveValue(prefs, @"setSensor4CCVAL");
              if (!SCPreferencesCommitChanges(prefs)
                && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
              {
                sub_100038BC0();
              }
            }
          }
        }
      }

      BOOL v5 = byte_100074AE8 + 29976;
    }

    else
    {
      sub_1000221F8();
    }
  }

  CFBooleanRef v27 = (CFBooleanRef)SCPreferencesGetValue(prefs, @"hipOverride");
  byte_1000748C1 = v27 != kCFBooleanFalse;
  if (byte_10007CB30)
  {
    __int128 v28 = v27;
    __int128 v29 = (os_log_s *)*((void *)v5 + 490);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = "dis";
      if (v28 != kCFBooleanFalse) {
        v30 = "en";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "<Notice> HIP feature %sabled", buf, 0xCu);
    }
  }

  CFBooleanRef v31 = (CFBooleanRef)SCPreferencesGetValue(prefs, @"simulateHip");
  byte_10007CB41 = v31 != kCFBooleanFalse;
  if (byte_10007CB30)
  {
    v32 = v31;
    __int16 v33 = (os_log_s *)*((void *)v5 + 490);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = "dis";
      if (v32 != kCFBooleanFalse) {
        int v34 = "en";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "<Notice> HIP simulation %sabled", buf, 0xCu);
    }
  }

  CFBooleanRef v35 = (CFBooleanRef)SCPreferencesGetValue(prefs, @"forceHIPWhenConnected");
  byte_10007CB42 = v35 != kCFBooleanFalse;
  if (byte_10007CB30)
  {
    v36 = v35;
    v37 = (os_log_s *)*((void *)v5 + 490);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = "dis";
      if (v36 != kCFBooleanFalse) {
        v38 = "en";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "<Notice> HIP force when connected %sabled",  buf,  0xCu);
    }
  }

  CFBooleanRef v39 = (CFBooleanRef)SCPreferencesGetValue(prefs, @"engageBehavior");
  byte_1000748C0 = v39 != kCFBooleanFalse;
  if (byte_10007CB30)
  {
    v40 = v39;
    v41 = (os_log_s *)*((void *)v5 + 490);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = "dis";
      if (v40 != kCFBooleanFalse) {
        v42 = "en";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v42;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "<Notice> mitigation behavior %sabled",  buf,  0xCu);
    }
  }

  CFBooleanRef v43 = (CFBooleanRef)SCPreferencesGetValue(prefs, @"candidateControlLoopsEnabled");
  byte_10007CB4A = v43 == kCFBooleanTrue;
  if (byte_10007CB30)
  {
    v44 = v43;
    v45 = (os_log_s *)*((void *)v5 + 490);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = "dis";
      if (v44 == kCFBooleanTrue) {
        v46 = "en";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v46;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "<Notice> candidate control loops %sabled",  buf,  0xCu);
    }
  }

  v47 = (const __CFBoolean *)SCPreferencesGetValue(prefs, @"OSThermalNotificationEnabled");
  if (byte_10007CB30)
  {
    v48 = v47;
    v49 = (os_log_s *)*((void *)v5 + 490);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = "dis";
      if (v48 == kCFBooleanTrue) {
        v50 = "en";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v50;
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "<Notice> thermal monitoring %sabled",  buf,  0xCu);
    }
  }

  if (a3)
  {
    v51 = (const __CFNumber *)SCPreferencesGetValue(prefs, @"tGraphTestCaseNumber");
    v52 = (const __CFString *)SCPreferencesGetValue(prefs, @"tGraphTestCaseName");
    if (v51 && (CFTypeID v53 = CFGetTypeID(v51), v53 == CFNumberGetTypeID()))
    {
      CFNumberGetValue(v51, kCFNumberIntType, &dword_10007C648);
      if (!v52) {
        goto LABEL_73;
      }
    }

    else
    {
      dword_10007C648 = 0;
      if (!v52) {
        goto LABEL_73;
      }
    }

    if (CFStringGetCString(v52, &byte_10007C64C, 32LL, 0))
    {
LABEL_74:
      sub_10001B940(prefs);
      v54 = +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance");
      if (byte_1000748C0) {
        uint64_t v55 = 100LL;
      }
      else {
        uint64_t v55 = 0LL;
      }
      -[TGraphSampler updatePowerlogMiscState:value:](v54, "updatePowerlogMiscState:value:", 5LL, v55);
      goto LABEL_78;
    }

    if (os_log_type_enabled(*((os_log_t *)v5 + 490), OS_LOG_TYPE_ERROR)) {
      sub_10003AE94();
    }
LABEL_73:
    byte_10007C64C = 0;
    goto LABEL_74;
  }

LABEL_78:
  v56 = (const __CFBoolean *)SCPreferencesGetValue(prefs, @"sunlightOverride");
  if (!v56)
  {
    int v59 = 0;
LABEL_84:
    dword_10007CB4C = v59;
    goto LABEL_85;
  }

  v57 = v56;
  CFTypeID v58 = CFGetTypeID(v56);
  if (v58 == CFBooleanGetTypeID())
  {
    if (v57 == kCFBooleanTrue) {
      int v59 = 1;
    }
    else {
      int v59 = -1;
    }
    goto LABEL_84;
  }

LABEL_85:
  if (byte_10007CB30)
  {
    v60 = (os_log_s *)*((void *)v5 + 490);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = dword_10007CB4C;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "<Notice> sunlight override: %d", buf, 8u);
    }
  }

  CFBooleanRef v61 = (CFBooleanRef)SCPreferencesGetValue(prefs, @"thermalUseRawValues");
  byte_10007C4BC = v61 == kCFBooleanTrue;
  if (byte_10007CB30)
  {
    v62 = v61;
    v63 = (os_log_s *)*((void *)v5 + 490);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      v64 = "dis";
      if (v62 == kCFBooleanTrue) {
        v64 = "en";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v64;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "<Notice> Raw Value Mode %sabled", buf, 0xCu);
    }
  }

  CFBooleanRef v65 = (CFBooleanRef)SCPreferencesGetValue(prefs, @"forceSkipInfoOnlySensors");
  if (v65)
  {
    v66 = v65;
    int v67 = v65 == kCFBooleanTrue;
    byte_10007C5F0 = v65 == kCFBooleanTrue;
    if (byte_10007CB30)
    {
      v68 = (os_log_s *)*((void *)v5 + 490);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        v69 = "off";
        if (v66 == kCFBooleanTrue) {
          v69 = "on";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v69;
        _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "<Notice> Force Skip Info Only Sensors %s",  buf,  0xCu);
        int v67 = byte_10007C5F0;
      }
    }

    if (v67) {
      uint64_t v70 = 0LL;
    }
    else {
      uint64_t v70 = byte_10007C5DC;
    }
    -[HidSensors setInfoOnlySensorsActive:]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "setInfoOnlySensorsActive:",  v70);
    -[ContextAwareThermalManager setInfoOnlySensorsActive:]( +[ContextAwareThermalManager sharedInstance](&OBJC_CLASS___ContextAwareThermalManager, "sharedInstance"),  "setInfoOnlySensorsActive:",  v70);
  }

  if (!byte_1000748C0 || !notify_post(kOSThermalNotificationName))
  {
    v71 = (const __CFNumber *)SCPreferencesGetValue(prefs, @"setExpectedSensorMask");
    if (v71)
    {
      v72 = v71;
      CFTypeID v73 = CFGetTypeID(v71);
      if (v73 == CFNumberGetTypeID())
      {
        v74 = (os_log_s *)*((void *)v5 + 490);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = qword_10007C5F8;
          _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEFAULT,  "<Notice> Old Expected Sensor Mask: %llx ",  buf,  0xCu);
        }

        CFNumberGetValue(v72, kCFNumberLongLongType, &qword_10007C5F8);
        v75 = (os_log_s *)*((void *)v5 + 490);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = qword_10007C5F8;
          _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEFAULT,  "<Notice> New Expected Sensor Mask: %llx ",  buf,  0xCu);
        }

        if (SCPreferencesGetValue(prefs, @"setExpectedSensorMaskPersistentlyEnabled") != kCFBooleanTrue)
        {
          SCPreferencesRemoveValue(prefs, @"setExpectedSensorMask");
          if (!SCPreferencesCommitChanges(prefs) && os_log_type_enabled(*((os_log_t *)v5 + 490), OS_LOG_TYPE_ERROR)) {
            sub_100038BC0();
          }
        }
      }
    }

    if (SCPreferencesGetValue(prefs, @"getCurrentSensorSet") == kCFBooleanTrue)
    {
      SCPreferencesSetValue(prefs, @"getCurrentSensorSet", kCFBooleanFalse);
      *(void *)buf = qword_10007C610;
      CFNumberRef v76 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongLongType, buf);
      SCPreferencesSetValue(prefs, @"expectedSensorMaskValue", v76);
      if (!SCPreferencesCommitChanges(prefs) && os_log_type_enabled(*((os_log_t *)v5 + 490), OS_LOG_TYPE_ERROR)) {
        sub_100038BC0();
      }
      CFRelease(v76);
    }

    if (SCPreferencesGetValue(prefs, @"hipStates") == kCFBooleanTrue)
    {
      SCPreferencesSetValue(prefs, @"hipStates", kCFBooleanFalse);
      CFBooleanRef v77 = byte_10007CB43 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, @"BacklightStatus", v77);
      CFBooleanRef v78 = byte_10007CB44 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, @"ConnectedExternallyStatus", v78);
      CFBooleanRef v79 = byte_10007CB45 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, @"SystemToppingOffStatus", v79);
      CFBooleanRef v80 = byte_10007CB46 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, @"AaudioStatus", v80);
      CFBooleanRef v81 = byte_10007CB47 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, @"CarSessionStatus", v81);
      CFBooleanRef v82 = byte_10007CB48 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, @"WakeInProgressStatus", v82);
      CFBooleanRef v83 = byte_10007CB49 ? kCFBooleanTrue : kCFBooleanFalse;
      SCPreferencesSetValue(prefs, @"StockholmFieldDetectInProgressStatus", v83);
      if (!SCPreferencesCommitChanges(prefs) && os_log_type_enabled(*((os_log_t *)v5 + 490), OS_LOG_TYPE_ERROR)) {
        sub_100038BC0();
      }
    }

    v84 = (const __CFBoolean *)SCPreferencesGetValue(prefs, @"overrideTxMaxLimitKey");
    if (byte_10007CB30)
    {
      v85 = (os_log_s *)*((void *)v5 + 490);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        v86 = "dis";
        if (v84 == kCFBooleanTrue) {
          v86 = "en";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v86;
        _os_log_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_DEFAULT,  "<Notice> Override Tx Max Limit %sabled",  buf,  0xCu);
      }
    }

    if (v84 != kCFBooleanTrue) {
      goto LABEL_153;
    }
    v87 = (const __CFArray *)SCPreferencesGetValue(prefs, @"setTxMaxLimit");
    if (!v87) {
      goto LABEL_153;
    }
    v88 = v87;
    CFTypeID v89 = CFGetTypeID(v87);
    if (v89 != CFArrayGetTypeID()) {
      goto LABEL_153;
    }
    int v100 = 0;
    int v101 = 0;
    v90 = (const __CFNumber *)CFArrayGetValueAtIndex(v88, 0LL);
    CFNumberGetValue(v90, kCFNumberIntType, &v101);
    v91 = (const __CFNumber *)CFArrayGetValueAtIndex(v88, 1LL);
    CFNumberGetValue(v91, kCFNumberIntType, &v100);
    int v92 = v101;
    int v102 = v100;
    values = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v102);
    switch(v92)
    {
      case 0:
        int v93 = 0;
        int valuePtr = (const void *)kCTMaxTransmitPowerPercentage2G;
        break;
      case 1:
        int valuePtr = (const void *)kCTMaxTransmitPowerPercentageC2K;
        int v93 = 1;
        break;
      case 2:
        int valuePtr = (const void *)kCTMaxTransmitPowerPercentageUMTS;
        int v93 = 2;
        break;
      case 4:
        int valuePtr = (const void *)kCTMaxTransmitPowerPercentageUTRAN2;
        int v93 = 4;
        break;
      case 5:
        int valuePtr = (const void *)kCTMaxThroughputPercentageUTRAN3;
        int v93 = 5;
        break;
      case 6:
        int valuePtr = (const void *)kCTThermalTxBackoff;
        int v93 = 6;
        break;
      case 7:
        int valuePtr = (const void *)kCTThermalTxDutyCycle;
        int v93 = 7;
        break;
      default:
        int valuePtr = (const void *)kCTMaxThroughputPercentageLTE;
        int v93 = 3;
        break;
    }

    CFDictionaryRef v94 = CFDictionaryCreate( kCFAllocatorDefault,  &valuePtr,  (const void **)&values,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    CFRelease(values);
    uint64_t v107 = 0LL;
    *(_OWORD *)buf = 0u;
    __int128 v106 = 0u;
    v95 = (const void *)_CTServerConnectionCreateWithIdentifier( kCFAllocatorDefault,  @"thermtune",  sub_10001D268,  buf);
    if (!v95) {
      fwrite("_CTServerConnectionCreate() failed", 0x22uLL, 1uLL, __stderrp);
    }
    uint64_t v96 = _CTServerConnectionConfigMaxRadioPower(v95, v94);
    v97 = (os_log_s *)*((void *)v5 + 490);
    BOOL v98 = os_log_type_enabled(v97, OS_LOG_TYPE_ERROR);
    if ((_DWORD)v96)
    {
      if (v98)
      {
        sub_10003ADE4(v96, SHIDWORD(v96));
        if (!v95) {
          goto LABEL_175;
        }
        goto LABEL_174;
      }
    }

    else if (v98)
    {
      sub_10003AD64(&v102, v93, v97);
      if (!v95) {
        goto LABEL_175;
      }
      goto LABEL_174;
    }

    if (!v95)
    {
LABEL_175:
      CFRelease(v94);
      if (SCPreferencesGetValue(prefs, @"overrideTxMaxLimitPersistentlyEnabled") != kCFBooleanTrue)
      {
        SCPreferencesRemoveValue(prefs, @"setTxMaxLimit");
        if (!SCPreferencesCommitChanges(prefs) && os_log_type_enabled(*((os_log_t *)v5 + 490), OS_LOG_TYPE_ERROR)) {
          sub_100038BC0();
        }
      }

LABEL_153:
      SCPreferencesSynchronize(prefs);
      return;
    }

LABEL_174:
    CFRelease(v95);
    goto LABEL_175;
  }

  if (os_log_type_enabled(*((os_log_t *)v5 + 490), OS_LOG_TYPE_ERROR)) {
    sub_10003AE68();
  }
}

void sub_10001B940(const __SCPreferences *a1)
{
  CFBooleanRef Value = (const __CFString *)SCPreferencesGetValue(a1, @"tGraphLogFile");
  if (!Value)
  {
    int v6 = dword_1000748D8;
    if (dword_1000748D8 < 0)
    {
      if (byte_10007CB30)
      {
        int v8 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buffer = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> no tGraph log", buffer, 2u);
        }
      }
    }

    else
    {
      if (byte_10007CB30)
      {
        char v7 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buffer = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> Closing tGraph log file",  buffer,  2u);
          int v6 = dword_1000748D8;
        }
      }

      byte_10007C5DC = 0;
      close(v6);
      dword_1000748D8 = -1;
    }

LABEL_31:
    if (byte_10007C5F0) {
      uint64_t v10 = 0LL;
    }
    else {
      uint64_t v10 = byte_10007C5DC;
    }
    -[HidSensors setInfoOnlySensorsActive:]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "setInfoOnlySensorsActive:",  v10);
    -[ContextAwareThermalManager setInfoOnlySensorsActive:]( +[ContextAwareThermalManager sharedInstance](&OBJC_CLASS___ContextAwareThermalManager, "sharedInstance"),  "setInfoOnlySensorsActive:",  v10);
    if (byte_10007CB30)
    {
      int v11 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        if (byte_10007C5DC) {
          CFPropertyListRef v12 = "en";
        }
        else {
          CFPropertyListRef v12 = "dis";
        }
        *(_DWORD *)buf = 136315138;
        CFTypeID v15 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<Notice> tGraph log %sabled", buf, 0xCu);
      }
    }

    return;
  }

  if (CFStringGetFileSystemRepresentation(Value, (char *)buffer, 1024LL))
  {
    int v2 = open((const char *)buffer, 522, 420LL);
    if ((v2 & 0x80000000) == 0)
    {
      int v3 = v2;
      if (fstat(v2, &v13) < 0)
      {
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003AF58();
        }
        goto LABEL_25;
      }

      int v4 = dword_1000748D8;
      if ((dword_1000748D8 & 0x80000000) == 0)
      {
        if (*(_DWORD *)byte_10007C670 == v13.st_dev && *(void *)&byte_10007C670[8] == v13.st_ino)
        {
          if (byte_10007CB30)
          {
            BOOL v5 = (os_log_s *)qword_10007CF50;
            if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> tGraph log to same file",  buf,  2u);
            }
          }

LABEL_25:
          close(v3);
          return;
        }

        if (byte_10007CB30)
        {
          int v9 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "<Notice> tGraph log to new file",  buf,  2u);
            int v4 = dword_1000748D8;
          }
        }

        close(v4);
      }

      dword_1000748D8 = v3;
      *(stat *)byte_10007C670 = v13;
      byte_10007C5DC = 1;
      sub_10001D0C8(1LL);
      goto LABEL_31;
    }

    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003AEEC();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003AEC0();
  }

uint64_t getThermalSensorSet()
{
  return qword_10007C610;
}

uint64_t getThermalWatchdogState()
{
  return qword_10007C600;
}

uint64_t getThermalUpdateTime()
{
  if (byte_1000748C2) {
    return qword_10007C608;
  }
  else {
    return 0LL;
  }
}

const char *sub_10001BD2C(const char *a1)
{
  int v2 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<Notice> Model name = %s", (uint8_t *)&v5, 0xCu);
  }

  int v3 = "mac";
  if (!strstr(a1, "Mac") && strcmp(a1, "eperm-d995af6e429c4224")) {
    return "";
  }
  return v3;
}

void thermalMonitor_init()
{
  size_t v46 = 64LL;
  qword_10007D168 = (uint64_t)SCPreferencesCreate(0LL, @"OSThermalStatus", @"OSThermalStatus.plist");
  if (qword_10007D168)
  {
    if (sysctlbyname("hw.model", cStr, &v46, 0LL, 0LL) < 0)
    {
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003AFF0();
      }
    }

    else
    {
      uint64_t v0 = os_log_create("com.apple.cltm", "thermalmonitor");
      qword_10007CF50 = (uint64_t)v0;
      if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.version) = 136315138;
        *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)cStr;
        _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEFAULT,  "<Notice> Model name = %s",  (uint8_t *)&buf,  0xCu);
      }

      unint64_t v1 = 0LL;
      BOOL v2 = 1;
      while (v1 > 0x3C || cStr[v1] != 68 || cStr[v1 + 1] != 69 || cStr[v1 + 2] != 86)
      {
        BOOL v2 = v1++ < 0x3F;
        if (v1 == 64) {
          goto LABEL_11;
        }
      }

      strcpy(&cStr[v1], "AP");
      if (v2)
      {
        byte_10007CB32 = 1;
        CFBooleanRef v39 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf.version) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "<Notice> Detected Dev board.",  (uint8_t *)&buf,  2u);
        }
      }

uint64_t sub_10001C93C(int a1)
{
  int valuePtr = a1;
  CFNumberRef v1 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (v1)
  {
    CFNumberRef v2 = v1;
    SCPreferencesSetValue((SCPreferencesRef)qword_10007D168, @"CLTMStatus", v1);
    CFRelease(v2);
  }

  return SCPreferencesCommitChanges((SCPreferencesRef)qword_10007D168);
}

uint64_t sub_10001C9AC()
{
  uint64_t v0 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  mach_timebase_info((mach_timebase_info_t)&dword_10007C624);
  CFNumberRef v1 = (const char *)sub_1000196B8();
  if (strstr(v1, "tmd_disable_111276880")) {
    byte_10007C620 = 1;
  }
  wd_endpoint_register("com.apple.thermalmonitord.watchdog");
  wd_endpoint_add_queue(&_dispatch_main_q);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001CA5C;
  v4[3] = &unk_1000617B0;
  v4[4] = v0;
  uint64_t v2 = wd_endpoint_set_alive_func(v4);
  return wd_endpoint_activate(v2);
}

uint64_t sub_10001CA5C(uint64_t a1, char **a2)
{
  if (byte_10007CB30)
  {
    int v4 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "<Notice> wd_endpoint getalive_func\n",  (uint8_t *)&buf,  2u);
    }
  }

  qword_10007C610 = qword_10007C630;
  if (qword_10007C600 != 1 || (qword_10007C638 & qword_10007C630) == qword_10007C5F8)
  {
    byte_10007C640 = 0;
    uint64_t result = 1LL;
LABEL_46:
    qword_10007C630 = 0LL;
    return result;
  }

  if ((byte_10007C620 & 1) != 0)
  {
LABEL_28:
    unint64_t v33 = qword_10007C630;
    unint64_t v34 = qword_10007C5F8;
    CFIndex Count = CFArrayGetCount( -[HidSensors sensorFourCharCode]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "sensorFourCharCode"));
    if (Count >= 1)
    {
      CFIndex v36 = Count;
      for (CFIndex i = 0LL; i != v36; ++i)
      {
        if ((v34 & 1) != 0 && (v33 & 1) == 0) {
          objc_msgSend( *(id *)(a1 + 32),  "addObject:",  CFArrayGetValueAtIndex( -[HidSensors sensorFourCharCode]( +[HidSensors sharedInstance](HidSensors, "sharedInstance"),  "sensorFourCharCode"),  i));
        }
        v33 >>= 1;
        v34 >>= 1;
      }
    }

    unsigned int v38 = [*(id *)(a1 + 32) count];
    int v39 = v38;
    if (v38)
    {
      size_t v40 = (char *)malloc((int)(5 * v38) + 1LL);
      if (v40)
      {
        BOOL v41 = v40;
        char *v40 = 0;
        if (v39 >= 1)
        {
          for (uint64_t j = 0LL; j != v39; ++j)
          {
            CFBooleanRef v43 = strcat( v41,  (const char *)objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", j),  "cStringUsingEncoding:",  4));
            *(_WORD *)&v41[strlen(v43)] = 32;
          }
        }

        WORD4(buf) = 0;
        *(void *)&__int128 buf = 540689491LL;
        if (-[HidSensors isSensorDataValid]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "isSensorDataValid"))
        {
          v44 = "1";
        }

        else
        {
          v44 = "0";
        }

        __strcat_chk(&buf, v44, 10LL);
        __int16 v62 = 0;
        uint64_t v61 = 540689218LL;
        int v45 = sub_100023AD0();
        int v46 = sub_100023AFC();
        asprintf( a2,  "current %llx, mask %llx, expected %llx. %s %s RC: %d BS: %d, Missing sensor(s): %s",  qword_10007C630,  qword_10007C638,  qword_10007C5F8,  (const char *)&buf,  (const char *)&v61,  v45,  v46,  v41);
        free(v41);
      }

      else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        sub_10003B24C();
      }
    }

    [*(id *)(a1 + 32) removeAllObjects];
    uint64_t result = 0LL;
    goto LABEL_46;
  }

  size_t v59 = 8LL;
  uint64_t v60 = 0LL;
  if (sysctlbyname("kern.wake_abs_time", &v60, &v59, 0LL, 0LL))
  {
    CFNumberRef v6 = __error();
    CFTypeID v7 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003B340((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  uint64_t v14 = IOPMGetLastWakeTime(&v58, &v57);
  if ((_DWORD)v14)
  {
    uint64_t v15 = v14;
    unsigned int v16 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003B2DC(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }

  else
  {
    uint64_t v24 = v60;
    if (v60)
    {
      unint64_t v25 = (unint64_t)(v57 * 1000000000.0) * *(unsigned int *)algn_10007C628 / dword_10007C624;
      mach_get_times(&buf, &v61, 0LL);
      unint64_t v23 = v25 - (v24 + v61) + buf;
      goto LABEL_17;
    }

    double v47 = v58;
    uint64_t times = mach_get_times(0LL, &v61, &buf);
    if (!(_DWORD)times)
    {
      unint64_t v23 = (unint64_t)(((double)(uint64_t)buf
                              - kCFAbsoluteTimeIntervalSince1970
                              + (double)*((uint64_t *)&buf + 1) / 1000000000.0
                              - v47)
                             * (double)(1000000000
                                      * (unint64_t)*(unsigned int *)algn_10007C628
      goto LABEL_17;
    }

    uint64_t v49 = times;
    v50 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003B278(v49, v50, v51, v52, v53, v54, v55, v56);
    }
  }

  unint64_t v23 = 0LL;
LABEL_17:
  uint64_t v26 = mach_continuous_time();
  uint64_t v28 = dword_10007C624;
  unint64_t v27 = *(unsigned int *)algn_10007C628;
  int v29 = byte_10007C640;
  v30 = (os_log_s *)qword_10007CF50;
  BOOL v31 = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT);
  if ((v29 & 1) != 0 || (unint64_t v32 = (v26 + v23) * v28 / v27, v32 > 0x2540BE3FFLL))
  {
    if (v29)
    {
      if (v31)
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "<Notice> thermalmonitord: found previous error sensor result, do not ignore",  (uint8_t *)&buf,  2u);
      }
    }

    else
    {
      if (v31)
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "<Notice> thermalmonitord: found error sensor result",  (uint8_t *)&buf,  2u);
      }

      byte_10007C640 = 1;
    }

    goto LABEL_28;
  }

  if (v31)
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v32 / 0x3B9ACA00;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "<Notice> thermalmonitord: ignore current sensor result cause system just woke up %lld second(s)ago",  (uint8_t *)&buf,  0xCu);
  }

  return 1LL;
}

void start()
{
  uint64_t v0 = objc_autoreleasePoolPush();
  pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED, 0);
  sub_10001C9AC();
  thermalMonitor_init();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &stru_1000617F0);
  objc_autoreleasePoolPop(v0);
  CFRunLoopRun();
  CFNumberRef v1 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "<Error> main thread exiting", v2, 2u);
  }

  exit(0);
}

void sub_10001D06C(id a1, OS_xpc_object *a2)
{
  if (a2)
  {
    string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
    if (string)
    {
      if (!strcasecmp("com.apple.ManagedConfiguration.profileListChanged", string))
      {
        sleep(2u);
        sub_10001A120((const __SCPreferences *)qword_10007D168);
      }
    }
  }

void sub_10001D0C8(uint64_t a1)
{
  if ((_DWORD)a1 == 1)
  {
    uint64_t v2 = kCFAllocatorDefault;
    int v3 = @"Time, Epoch Time, Mach Absolute Time, TestCase Number, TestCase Name, Gas gauge average power, Battery capacity, ";
  }

  else
  {
    time_t v17 = time(0LL);
    int v4 = ctime(&v17);
    v4[24] = 0;
    uint64_t v2 = kCFAllocatorDefault;
    time_t v5 = v17;
    uint64_t v6 = mach_absolute_time();
    uint64_t v7 = dword_10007C648;
    uint64_t v8 = sub_100021C84();
    uint64_t v9 = sub_100021CC8();
    CFStringRef v10 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s, %ld, %llu, %d, %s, %lld, %d",  v4,  v5,  v6,  v7,  &byte_10007C64C,  v8,  v9);
    if (!v10) {
      return;
    }
    int v3 = v10;
  }

  uint64_t v11 = CFStringCreateWithFormat(v2, 0, @"%@%@", v3, [(id)qword_10007C4A8 getTGraphData:a1]);
  CFRelease(v3);
  if (v11)
  {
    ExternalRepresentation = CFStringCreateExternalRepresentation(v2, v11, 0, 0x3Fu);
    if (ExternalRepresentation)
    {
      uint64_t v13 = ExternalRepresentation;
      int v14 = dword_1000748D8;
      BytePtr = CFDataGetBytePtr(ExternalRepresentation);
      size_t Length = CFDataGetLength(v13);
      if (write(v14, BytePtr, Length) < 0 && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003B3A8();
      }
      write(dword_1000748D8, "\n", 1uLL);
      CFRelease(v13);
    }

    CFRelease(v11);
  }

uint64_t sub_10001D268(uint64_t a1, const void *a2)
{
  return fprintf(__stderrp, "unknown CT notification: %p", a2);
}

void sub_10001D29C(const __SCPreferences *a1)
{
}

void sub_10001D2D0()
{
  if (dword_10007C734 >= 1)
  {
    qword_10007C608 = mach_absolute_time();
    unsigned int v0 = [(id)qword_10007C4A8 canaryTempSensorIndex];
    if ((v0 & 0x80000000) == 0)
    {
      unsigned int v1 = v0;
      uint64_t v2 = -[HidSensors hidSensorKeys]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "hidSensorKeys");
      if (v2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v2, v1);
        if (ValueAtIndex)
        {
          int v4 = -[HidSensors temperatureForKey:]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "temperatureForKey:",  ValueAtIndex);
          if (byte_10007CB30)
          {
            time_t v5 = (os_log_s *)qword_10007CF50;
            if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 136315394;
              *(void *)&uint8_t buf[4] = "timerCallBackHID";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v4;
              _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> %s: canary %d", buf, 0x12u);
            }
          }

          if (v4 > (int)[(id)qword_10007C4A8 canaryTempThreshold])
          {
            [(id)qword_10007C4A8 canaryModeExitEarly:dword_10007C734];
            dword_10007C734 = 0;
            goto LABEL_16;
          }
        }

        else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
        {
          sub_10003B42C();
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        sub_10003B400();
      }
    }

    if (dword_10007C734 >= 1)
    {
      --dword_10007C734;
      return;
    }
  }

LABEL_16:
  -[SensorDispatcherHelper readKeysFromSensorDispatcher]( +[SensorDispatcherHelper sharedInstance](&OBJC_CLASS___SensorDispatcherHelper, "sharedInstance"),  "readKeysFromSensorDispatcher");
  uint64_t v6 = -[HidSensors getHIDSensorDict]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "getHIDSensorDict");
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = -[HidSensors hidSensorKeys]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "hidSensorKeys");
    if (v8 && (uint64_t v9 = v8, v10 = CFGetTypeID(v8), v10 == CFArrayGetTypeID()))
    {
      BOOL v33 = sub_100019A7C();
      CFIndex Count = CFArrayGetCount(v9);
      if (Count >= 1)
      {
        CFIndex v13 = Count;
        CFIndex v14 = 0LL;
        *(void *)&__int128 v12 = 138412290LL;
        __int128 v32 = v12;
        do
        {
          uint64_t v15 = (void *)CFArrayGetValueAtIndex(v9, v14);
          if (-[HidSensors isPowerSensor:]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "isPowerSensor:",  v15))
          {
            *(void *)__int128 buf = 0LL;
            sub_100020FE0(v7, v15, kCFNumberDoubleType, buf);
            signed int v16 = -[HidSensors getPowerSensorIndex:]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "getPowerSensorIndex:",  v15);
            *((void *)&xmmword_10007D478 + v16) = *(void *)buf;
          }

          else
          {
            CFBooleanRef Value = (const __CFNumber *)CFDictionaryGetValue(v7, v15);
            if (Value)
            {
              CFNumberGetValue(Value, kCFNumberSInt32Type, buf);
              int v18 = [(id)qword_10007C4A8 useTcalAdjust:v14];
              sub_100019C18(v14, *(int *)buf, v18);
            }

            else
            {
              uint64_t v19 = (os_log_s *)qword_10007CF50;
              if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)__int128 buf = v32;
                *(void *)&uint8_t buf[4] = v15;
                _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "<Error> Could not get value for %@",  buf,  0xCu);
              }
            }
          }

          ++v14;
        }

        while (v13 != v14);
      }

      uint64_t v20 = qword_10007C630;
      uint64_t v21 = qword_10007C638;
      uint64_t v22 = qword_10007C5F8;
      if ((qword_10007C638 & qword_10007C630) == qword_10007C5F8)
      {
        if (byte_10007CB30)
        {
          unint64_t v23 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            sub_10001DBD4(dword_10007C5C4);
            *(_DWORD *)__int128 buf = 136315138;
            *(void *)&uint8_t buf[4] = byte_10007C738;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "<Notice> sensors: %s", buf, 0xCu);
          }
        }

        dword_10007C730 = 0;
        qword_10007C608 = mach_absolute_time();
        [(id)qword_10007C4A8 updateSystemLoad:v33];
        [(id)qword_10007C4A8 probeAllSupervisorControlLoadingIndex];
        sub_100019D24();
        int v24 = [(id)qword_10007C4A8 desiredLoopInterval];
        if (v24 >= 1)
        {
          unsigned int v25 = v24 / 5u;
          unsigned int v26 = v25 - 1;
          dword_10007C734 = v25 - 1;
          if (byte_10007CB30)
          {
            unint64_t v27 = (os_log_s *)qword_10007CF50;
            if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 136315394;
              *(void *)&uint8_t buf[4] = "timerCallBackHID";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v26;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "<Notice> %s: setting numCanaryOnlyPeriodsRemaining to %d",  buf,  0x12u);
            }
          }
        }
      }

      else
      {
        int v28 = dword_10007C730 + 1;
        dword_10007C730 = v28;
        if ((v28 & 3) == 0)
        {
          int v29 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 67109888;
            *(_DWORD *)&uint8_t buf[4] = v28;
            *(_WORD *)&buf[8] = 2048;
            *(void *)&buf[10] = v20;
            __int16 v35 = 2048;
            uint64_t v36 = v21;
            __int16 v37 = 2048;
            uint64_t v38 = v22;
            _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "<Error> partial sensors: count %d, current %llx, mask %llx, expected %llx",  buf,  0x26u);
          }

          -[HidSensors resetHIDSensorDictionary]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance", v32),  "resetHIDSensorDictionary");
        }
      }

      objc_msgSend((id)qword_10007C4A8, "hintComponentControlTakeAction", v32);
      -[ContextAwareThermalManager iterateAndUpdateContexts]( +[ContextAwareThermalManager sharedInstance](&OBJC_CLASS___ContextAwareThermalManager, "sharedInstance"),  "iterateAndUpdateContexts");
      if (byte_10007D470)
      {
        -[SensorExchangeHelper updateAllSensorExchangeData]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "updateAllSensorExchangeData");
        -[SensorExchangeHelper sendSensorExchangeDataToSMC]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "sendSensorExchangeDataToSMC");
      }

      if (byte_10007C5DC == 1) {
        sub_10001D0C8(2LL);
      }
      -[TGraphSampler logToPowerlog]( +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance"),  "logToPowerlog");
      if (byte_10007C5F1 == 1)
      {
        CStringPtr = CFStringGetCStringPtr(@"/var/log/tgraph.csv", 0);
        if (sub_1000235EC(CStringPtr) > 5.0)
        {
          BOOL v31 = CFStringGetCStringPtr(@"/var/log/tgraph.csv", 0);
          remove(v31);
          sub_10001B940((const __SCPreferences *)qword_10007D168);
        }
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003B3D4();
    }
  }

void sub_10001D8D4(uint64_t a1, uint64_t a2, int a3, intptr_t a4)
{
  HIDWORD(v6) = a3;
  LODWORD(v6) = a3 + 536870288;
  int v5 = v6 >> 4;
  if (v5)
  {
    if (v5 == 11)
    {
      CFTypeID v10 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "<Notice> <PMCallback> System Will Power On",  (uint8_t *)&v24,  2u);
      }

      if ((int)qword_10007CB28 >= 12)
      {
        int v11 = dword_10007C644;
        if (dword_10007C644)
        {
          __int128 v12 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            int v24 = 67109120;
            int v25 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "<Notice> clearing orphaned sleep assertion: 0x%08x",  (uint8_t *)&v24,  8u);
          }

          sub_100019FCC();
        }

        uint64_t v13 = IOPMAssertionCreateWithName( @"NoIdleSleepAssertion",  0xFFu,  (CFStringRef)qword_10007C5E8,  (IOPMAssertionID *)&dword_10007C644);
        if ((_DWORD)v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
            sub_10003B458(v14, v15, v16, v17, v18, v19, v20, v21);
          }
        }

        else if (byte_10007CB30)
        {
          unint64_t v23 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            int v24 = 67109120;
            int v25 = dword_10007C644;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "<Notice> created idle sleep assertion 0x%08x",  (uint8_t *)&v24,  8u);
          }
        }
      }

      [(id)qword_10007C4A8 updateSystemPowerState:1];
    }

    else if (v5 == 1)
    {
      uint64_t v7 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> <PMCallback> System Will Sleep",  (uint8_t *)&v24,  2u);
      }

      [(id)qword_10007C4A8 updateSystemPowerState:0];
LABEL_10:
      IOAllowPowerChange(dword_10007C700, a4);
    }
  }

  else
  {
    unsigned int v8 = [(id)qword_10007C4A8 canSystemSleep];
    uint64_t v9 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 67109120;
      int v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "<Notice> <PMCallback> Can System Sleep (reply: %d)",  (uint8_t *)&v24,  8u);
    }

    if (v8) {
      goto LABEL_10;
    }
    if (byte_10007CB30)
    {
      uint64_t v22 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "<Notice> Preventing system sleep",  (uint8_t *)&v24,  2u);
      }
    }

    IOCancelPowerChange(dword_10007C700, a4);
  }

size_t sub_10001DBD4(int a1)
{
  uint64_t v2 = &byte_10007C738[__sprintf_chk(byte_10007C738, 0, 0x340uLL, "[")];
  int v3 = &v2[sprintf(v2, "%d", dword_10007C4C0[0])];
  if (a1 >= 2)
  {
    uint64_t v4 = a1 - 1LL;
    int v5 = &dword_10007C4C4;
    do
    {
      strcpy(v3, ", ");
      int v6 = *v5++;
      v3 += sprintf(v3 + 2, "%d", v6) + 2;
      --v4;
    }

    while (v4);
  }

  size_t result = strlen(v3);
  *(_WORD *)&v3[result] = 93;
  return result;
}

char *sub_10001DCA8(int *a1)
{
  return strerror(*a1);
}

void sub_10001DCB0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

int *sub_10001DCBC()
{
  return __error();
}

id sub_10001E47C(uint64_t a1, void *a2)
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id result = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    id v5 = result;
    int v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      unsigned int v8 = 0LL;
      int v9 = v6;
      uint64_t v10 = a1 + 4LL * v6;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a2);
        }
        *(_DWORD *)(v10 + 4 * (void)v_Block_object_dispose((const void *)(v9 - 48), 8) = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) intValue];
        unsigned int v8 = (char *)v8 + 1;
      }

      while (v5 != v8);
      id result = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v5 = result;
      int v6 = v9 + (_DWORD)v8;
    }

    while (result);
  }

  return result;
}

id sub_10001E57C(uint64_t a1, void *a2)
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id result = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    id v5 = result;
    int v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      unsigned int v8 = 0LL;
      int v9 = v6;
      uint64_t v10 = a1 + 4LL * v6;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a2);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) floatValue];
        *(_DWORD *)(v10 + 4LL * (void)v_Block_object_dispose((const void *)(v9 - 48), 8) = v11;
        unsigned int v8 = (char *)v8 + 1;
      }

      while (v5 != v8);
      id result = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      id v5 = result;
      int v6 = v9 + (_DWORD)v8;
    }

    while (result);
  }

  return result;
}

void sub_10001EBCC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

float sub_10001EC08(uint64_t a1, int a2)
{
  uint64_t state64 = 0LL;
  id Weak = objc_loadWeak((id *)(a1 + 32));
  if (!notify_get_state(a2, &state64))
  {
    [Weak setPowerSaveActive:state64 != 0];
    float result = (float)[Weak powerSaveActive];
    *(float *)&dword_10007D1B8 = result;
  }

  return result;
}

float sub_10001EC78(uint64_t a1, int a2)
{
  uint64_t state64 = 0LL;
  id Weak = objc_loadWeak((id *)(a1 + 32));
  if (!notify_get_state(a2, &state64))
  {
    [Weak setProModeActive:state64 != 0];
    float result = (float)[Weak proModeActive];
    *(float *)&dword_10007D1DC = result;
  }

  return result;
}

void sub_10001F25C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 229))
  {
    *(_BYTE *)(*(void *)(a1 + 32) + 329LL) = -[ContextAwareThermalManager isContextTriggered:]( +[ContextAwareThermalManager sharedInstance]( &OBJC_CLASS___ContextAwareThermalManager,  "sharedInstance"),  "isContextTriggered:",  1LL);
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 100;
    uint64_t v5 = 64LL;
    do
    {
      if (v4 >= *(_DWORD *)(v3 + v5)) {
        int v4 = *(_DWORD *)(v3 + v5);
      }
      v5 += 4LL;
    }

    while ((_DWORD)v5 != 88);
    int v6 = 0;
    uint64_t v7 = 136LL;
    do
    {
      if (v6 <= *(_DWORD *)(v3 + v7)) {
        int v6 = *(_DWORD *)(v3 + v7);
      }
      v7 += 4LL;
    }

    while ((_DWORD)v7 != 160);
    if (v4 <= v6) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = v4;
    }
    if (*(_BYTE *)(v3 + 296))
    {
      int v9 = *(dispatch_queue_s **)(v3 + 320);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_10001F5C4;
      v37[3] = &unk_100061638;
      v37[4] = v3;
      int v38 = v8;
      dispatch_async(v9, v37);
      return;
    }

    if (*(_BYTE *)(v3 + 209)) {
      uint64_t v11 = *(unsigned int *)(v3 + 216);
    }
    else {
      uint64_t v11 = 65000LL;
    }
    [(id)v3 setCPULowPowerTarget:v11];
    uint64_t v36 = *(int **)(a1 + 32);
    if ((_DWORD)v8 != v36[84])
    {
      v36[84] = v8;
      [*(id *)(a1 + 32) setCPUPowerZoneTarget:v8];
      uint64_t v36 = *(int **)(a1 + 32);
    }

    uint64_t v31 = v36[60];
    uint64_t v34 = v36[62];
    uint64_t v35 = 728039444LL;
    uint64_t v25 = 0LL;
    uint64_t v28 = 0LL;
  }

  else
  {
    if (*(_BYTE *)(v2 + 209)) {
      int v10 = *(_DWORD *)(v2 + 212);
    }
    else {
      int v10 = 101;
    }
    uint64_t v12 = 0LL;
    signed int v13 = 0;
    *(_DWORD *)(v2 + 28_Block_object_dispose((const void *)(v9 - 48), 8) = v10;
    uint64_t v14 = *(void *)(a1 + 32);
    do
    {
      if (v13 <= *(_DWORD *)(v14 + 136 + v12)) {
        signed int v13 = *(_DWORD *)(v14 + 136 + v12);
      }
      v12 += 4LL;
    }

    while ((_DWORD)v12 != 24);
    *(_DWORD *)(v14 + 332) = 101;
    uint64_t v15 = &stru_100000100.sectname[12];
    do
    {
      uint64_t v16 = *(unsigned int **)(a1 + 32);
      unsigned int v17 = *(unsigned int *)((char *)v16 + v15 - 4);
      else {
        uint64_t v18 = v17;
      }
      if ((int)v16[83] > (int)v18)
      {
        v16[83] = v18;
        uint64_t v16 = *(unsigned int **)(a1 + 32);
      }

      if (*(unsigned int *)((char *)v16 + v15) != (_DWORD)v18)
      {
        [v16 setServiceProperty:v16[8] key:*(__CFString **)((char *)&off_100061810[-33] + v15 - 4) value:v18 scaleToFixedPoint:1];
        *(_DWORD *)(*(void *)(a1 + 32) + v15) = v18;
      }

      v15 += 8LL;
    }

    while (v15 != 300);
    int v19 = *(_DWORD *)(*(void *)(a1 + 32) + 332LL);
    if (v19 >= 100) {
      uint64_t v20 = 0x10000LL;
    }
    else {
      uint64_t v20 = (v19 << 16) / 100;
    }
    kdebug_trace(728039424LL, v20, 0LL, 0LL, 0LL);
    uint64_t v21 = *(_DWORD **)(a1 + 32);
    int v22 = v21[67];
    BOOL v23 = v22 <= 99;
    uint64_t v24 = (v22 << 16) / 100;
    if (v23) {
      uint64_t v25 = v24;
    }
    else {
      uint64_t v25 = 0x10000LL;
    }
    int v26 = v21[69];
    BOOL v23 = v26 <= 99;
    uint64_t v27 = (v26 << 16) / 100;
    if (v23) {
      uint64_t v28 = v27;
    }
    else {
      uint64_t v28 = 0x10000LL;
    }
    int v29 = v21[71];
    BOOL v23 = v29 <= 99;
    uint64_t v30 = (v29 << 16) / 100;
    if (v23) {
      uint64_t v31 = v30;
    }
    else {
      uint64_t v31 = 0x10000LL;
    }
    int v32 = v21[73];
    BOOL v23 = v32 <= 99;
    uint64_t v33 = (v32 << 16) / 100;
    if (v23) {
      uint64_t v34 = v33;
    }
    else {
      uint64_t v34 = 0x10000LL;
    }
    uint64_t v35 = 728039440LL;
  }

  kdebug_trace(v35, v25, v28, v31, v34);
}

uint64_t sub_10001F57C(int *a1, int a2, uint64_t a3)
{
  if (a2 >= 1)
  {
    do
    {
      int v4 = *a1++;
      unsigned int v3 = v4;
      else {
        a3 = a3;
      }
      --a2;
    }

    while (a2);
  }

  return a3;
}

uint64_t sub_10001F5A0(int *a1, int a2, uint64_t a3)
{
  if (a2 >= 1)
  {
    do
    {
      int v4 = *a1++;
      unsigned int v3 = v4;
      else {
        a3 = a3;
      }
      --a2;
    }

    while (a2);
  }

  return a3;
}

uint64_t sub_10001F5C4(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 40);
  unsigned int v3 = *(int **)(a1 + 32);
  if (v2 != v3[84])
  {
    v3[84] = v2;
    [*(id *)(a1 + 32) setPackagePowerZoneTarget];
    unsigned int v3 = *(int **)(a1 + 32);
  }

  return kdebug_trace(728039444LL, v3[75], v3[77], 0LL, 0LL);
}

void sub_10001F694(uint64_t a1)
{
  uint64_t v2 = 0LL;
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 100;
  do
  {
    if (v4 >= *(_DWORD *)(v3 + 88 + v2)) {
      int v4 = *(_DWORD *)(v3 + 88 + v2);
    }
    v2 += 4LL;
  }

  while ((_DWORD)v2 != 24);
  uint64_t v5 = 0LL;
  int v6 = 0;
  do
  {
    if (v6 <= *(_DWORD *)(v3 + 160 + v5)) {
      int v6 = *(_DWORD *)(v3 + 160 + v5);
    }
    v5 += 4LL;
  }

  while ((_DWORD)v5 != 24);
  if (v4 <= v6) {
    int v4 = v6;
  }
  if (*(_BYTE *)(v3 + 209) && v4 >= *(_DWORD *)(v3 + 220)) {
    int v4 = *(_DWORD *)(v3 + 220);
  }
  if (v4 != *(_DWORD *)(v3 + 340))
  {
    *(_DWORD *)(v3 + 340) = v4;
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(_BYTE *)(v7 + 229))
    {
      if (*(_BYTE *)(v7 + 296))
      {
        uint64_t v8 = *(dispatch_queue_s **)(v7 + 320);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10001F7D8;
        block[3] = &unk_1000614D0;
        block[4] = v7;
        dispatch_async(v8, block);
      }

      else
      {
        [(id)v7 setGPUPowerZoneTarget:*(unsigned int *)(v7 + 340)];
        kdebug_trace(728039448LL, *(int *)(*(void *)(a1 + 32) + 260LL), 0LL, 0LL, 0LL);
      }
    }

    else
    {
      [(id)v7 setDieTempControllerProperty:@"GPUMaxPower" level:*(unsigned int *)(v7 + 340) scaleToFixedPoint:0];
    }
  }

uint64_t sub_10001F7D8(uint64_t a1)
{
  return kdebug_trace( 728039444LL,  *(int *)(*(void *)(a1 + 32) + 300LL),  *(int *)(*(void *)(a1 + 32) + 308LL),  0LL,  0LL);
}

id sub_10001FC08(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 329LL) = -[ContextAwareThermalManager isContextTriggered:]( +[ContextAwareThermalManager sharedInstance]( &OBJC_CLASS___ContextAwareThermalManager,  "sharedInstance"),  "isContextTriggered:",  1LL);
  uint64_t v2 = *(char **)(a1 + 32);
  int v3 = 65000;
  uint64_t v4 = 112LL;
  do
  {
    if (v3 >= *(_DWORD *)&v2[v4]) {
      int v3 = *(_DWORD *)&v2[v4];
    }
    v4 += 4LL;
  }

  while ((_DWORD)v4 != 136);
  int v5 = 0;
  uint64_t v6 = 184LL;
  do
  {
    if (v5 <= *(_DWORD *)&v2[v6]) {
      int v5 = *(_DWORD *)&v2[v6];
    }
    v6 += 4LL;
  }

  while ((_DWORD)v6 != 208);
  if (v3 <= v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v3;
  }
  id result = [v2 setPackageLowPowerTarget];
  uint64_t v10 = *(void *)(a1 + 32);
  if ((_DWORD)v7 != *(_DWORD *)(v10 + 308))
  {
    if (byte_10007CB30)
    {
      uint64_t v11 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        v14[0] = 67109120;
        v14[1] = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "<Notice> New Package power target: %d",  (uint8_t *)v14,  8u);
        uint64_t v10 = *(void *)(a1 + 32);
      }
    }

    LODWORD(v9) = vcvtd_n_s64_f64((double)(int)v7 / 1000.0, 0x18uLL);
    if (*(_BYTE *)(v10 + 329) && *(_DWORD *)(v10 + 244) != (_DWORD)v7)
    {
      int v12 = v7;
    }

    else
    {
      if (*(_BYTE *)(v10 + 328)) {
        -[CPMSHelper addToCPMSMitigationArray:forComponent:]( +[CPMSHelper sharedInstance](&OBJC_CLASS___CPMSHelper, "sharedInstance"),  "addToCPMSMitigationArray:forComponent:",  v7,  13LL);
      }
      else {
      signed int v13 = *(unsigned int **)(a1 + 32);
      }
      if (v13[61] == 65000) {
        goto LABEL_25;
      }
      int v12 = 65000;
    }

    *(_DWORD *)(*(void *)(a1 + 32) + 244LL) = v12;
LABEL_25:
    *(_DWORD *)(*(void *)(a1 + 32) + 308LL) = v7;
    return (id)kdebug_trace( 728039444LL,  *(int *)(*(void *)(a1 + 32) + 300LL),  *(int *)(*(void *)(a1 + 32) + 308LL),  0LL,  0LL);
  }

  return result;
}

const char *sub_10002093C(const __CFString *a1)
{
  return CFStringGetCStringPtr(a1, 0x8000100u);
}

void sub_100020E78( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

CFMutableDictionaryRef sub_100020E9C(const char *a1, void *a2, const void *a3)
{
  uint64_t v7 = a3;
  keys = a2;
  CFMutableDictionaryRef result = IOServiceMatching(a1);
  if (result)
  {
    int v5 = result;
    if (a2)
    {
      CFDictionaryRef v6 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&keys,  &v7,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v5, @"IOPropertyMatch", v6);
      CFRelease(v6);
    }

    return (CFMutableDictionaryRef)IOServiceGetMatchingService(kIOMainPortDefault, v5);
  }

  return result;
}

CFTypeRef sub_100020F34(CFStringRef key, io_registry_entry_t entry)
{
  return IORegistryEntryCreateCFProperty(entry, key, kCFAllocatorDefault, 0);
}

BOOL sub_100020F54(const __CFDictionary *a1, const void *a2)
{
  return sub_100020F6C(a1, a2, 0LL);
}

BOOL sub_100020F6C(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  if (a1)
  {
    if (CFDictionaryContainsKey(a1, a2))
    {
      CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
      if (Value)
      {
        uint64_t v7 = Value;
        CFTypeID v8 = CFGetTypeID(Value);
        if (v8 == CFBooleanGetTypeID()) {
          return CFBooleanGetValue(v7) != 0;
        }
      }
    }
  }

  return a3;
}

uint64_t sub_100020FE0(CFDictionaryRef theDict, void *key, CFNumberType a3, void *a4)
{
  uint64_t result = 0LL;
  if (theDict)
  {
    if (key)
    {
      if (a4)
      {
        uint64_t result = CFDictionaryContainsKey(theDict, key);
        if ((_DWORD)result)
        {
          CFBooleanRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, key);
          if (Value && (uint64_t v10 = Value, v11 = CFGetTypeID(Value), v11 == CFNumberGetTypeID()))
          {
            return CFNumberGetValue(v10, a3, a4) != 0;
          }

          else
          {
            uint64_t result = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
            if ((_DWORD)result)
            {
              sub_10003BCD8();
              return 0LL;
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_1000210AC(const __CFDictionary *a1, const void *a2, void *a3)
{
  uint64_t result = CFDictionaryContainsKey(a1, a2);
  if ((_DWORD)result)
  {
    CFBooleanRef Value = CFDictionaryGetValue(a1, a2);
    if (Value && (CFTypeID v8 = Value, v9 = CFGetTypeID(Value), v9 == CFStringGetTypeID()))
    {
      *a3 = v8;
      return 1LL;
    }

    else
    {
      uint64_t result = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
      if ((_DWORD)result)
      {
        sub_10003BD38();
        return 0LL;
      }
    }
  }

  return result;
}

CFNumberRef sub_100021144(__CFDictionary *a1, void *key, CFNumberType a3, const void *a4)
{
  if (a1 && key && (int v8 = CFDictionaryContainsKey(a1, key), a4) && v8)
  {
    CFNumberRef result = CFNumberCreate(kCFAllocatorDefault, a3, a4);
    if (result)
    {
      CFNumberRef v10 = result;
      CFDictionaryReplaceValue(a1, key, result);
      CFRelease(v10);
      return (CFNumberRef)1;
    }
  }

  else
  {
    CFNumberRef result = (CFNumberRef)os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      sub_10003BD98();
      return 0LL;
    }
  }

  return result;
}

CFNumberRef sub_1000211FC(__CFDictionary *a1, const void *a2, CFNumberType theType, void *valuePtr)
{
  if (a1 && a2 && valuePtr)
  {
    CFNumberRef result = CFNumberCreate(kCFAllocatorDefault, theType, valuePtr);
    if (result)
    {
      CFNumberRef v7 = result;
      CFDictionarySetValue(a1, a2, result);
      CFRelease(v7);
      return (CFNumberRef)1;
    }
  }

  else
  {
    CFNumberRef result = (CFNumberRef)os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      sub_10003BDF8();
      return 0LL;
    }
  }

  return result;
}

CFStringRef sub_1000212A0(int a1)
{
  for (uint64_t i = 3LL; i != -1; --i)
  {
    cStr[i] = a1;
    a1 >>= 8;
  }

  cStr[4] = 0;
  return CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
}

uint64_t sub_1000212F4(io_registry_entry_t a1, const __CFString *a2, _DWORD *a3, uint64_t a4)
{
  CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    int v8 = CFProperty;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v8))
    {
      if (CFNumberGetValue((CFNumberRef)v8, kCFNumberSInt32Type, &valuePtr))
      {
        *a3 = valuePtr;
        a4 = 1LL;
LABEL_23:
        CFRelease(v8);
        return a4;
      }

      uint64_t v14 = qword_10007CF50;
      if ((_DWORD)a4)
      {
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003BEB8();
        }
        goto LABEL_22;
      }

      if (!os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v18 = a2;
      int v12 = "<Notice> %@ could not be converted to kCFNumberSInt32Type";
      signed int v13 = (os_log_s *)v14;
    }

    else
    {
      uint64_t v11 = qword_10007CF50;
      if ((_DWORD)a4)
      {
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003BF18();
        }
        goto LABEL_22;
      }

      if (!os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v18 = v8;
      int v12 = "<Notice> %@ not a CFNumber";
      signed int v13 = (os_log_s *)v11;
    }

    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
LABEL_22:
    a4 = 0LL;
    goto LABEL_23;
  }

  CFNumberRef v10 = (os_log_s *)qword_10007CF50;
  if ((_DWORD)a4)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003BE58();
    }
    return 0LL;
  }

  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v18 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "<Notice> could not find %@ property",  buf,  0xCu);
    return 0LL;
  }

  return a4;
}

uint64_t sub_100021514(io_registry_entry_t a1, const __CFString *a2, void *a3)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    CFDictionaryRef v6 = CFProperty;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v6))
    {
      if (CFNumberGetValue((CFNumberRef)v6, kCFNumberSInt64Type, v11))
      {
        *a3 = *(void *)v11;
        uint64_t v8 = 1LL;
LABEL_14:
        CFRelease(v6);
        return v8;
      }

      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003BF78();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003BF18();
    }

    uint64_t v8 = 0LL;
    goto LABEL_14;
  }

  if (!byte_10007CB30) {
    return 0LL;
  }
  CFTypeID v9 = (os_log_s *)qword_10007CF50;
  uint64_t v8 = 0LL;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v11 = 138412290;
    *(void *)&v11[4] = a2;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> could not find %@ property", v11, 0xCu);
    return 0LL;
  }

  return v8;
}

uint64_t sub_10002169C(io_registry_entry_t a1, const __CFString *a2, _DWORD *a3)
{
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFNumberRef v7 = CFNumberCreate(0LL, kCFNumberSInt32Type, a3);
  if (v7
    && (CFNumberRef v8 = v7, CFDictionaryAddValue(Mutable, a2, v7), CFRelease(v8), !IORegistryEntrySetCFProperties(a1, Mutable)))
  {
    uint64_t v9 = sub_1000212F4(a1, a2, a3, 1LL);
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  CFRelease(Mutable);
  return v9;
}

uint64_t sub_10002175C(io_registry_entry_t a1, const __CFString *a2, void *a3, id a4)
{
  uint64_t result = (uint64_t)IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (result)
  {
    CFNumberRef v7 = (void *)result;
    if ([(id)result length] == a4)
    {
      memcpy(a3, [v7 bytes], (size_t)a4);
      CFRelease(v7);
      return 1LL;
    }

    else
    {
      CFNumberRef v8 = (os_log_s *)qword_10007CF50;
      uint64_t result = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
      if ((_DWORD)result)
      {
        sub_10003BFD8(v7, (uint64_t)a4, v8);
        return 0LL;
      }
    }
  }

  return result;
}

BOOL sub_100021808(io_registry_entry_t a1, const __CFString *a2)
{
  CFTypeRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (!CFProperty) {
    return 0LL;
  }
  int v3 = CFProperty;
  CFTypeID v4 = CFGetTypeID(CFProperty);
  BOOL v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
  CFRelease(v3);
  return v5;
}

void sub_10002187C()
{
  io_connect_t v0 = IOPMFindPowerManagement(kIOMainPortDefault);
  if (v0)
  {
    io_connect_t v1 = v0;
    if (IOPMSleepSystem(v0))
    {
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003C0AC();
      }
    }

    IOServiceClose(v1);
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003C080();
  }

void sub_100021910(const void *a1, const __CFString *a2, const __CFString *a3, CFAbsoluteTime a4)
{
  CFNumberRef v7 = CFDateCreate(0LL, a4);
  if (v7)
  {
    CFNumberRef v8 = v7;
    if (IOPMSchedulePowerEvent(v7, a2, a3) && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003C104();
      if (!a1) {
        goto LABEL_6;
      }
    }

    else if (!a1)
    {
LABEL_6:
      CFRelease(v8);
      return;
    }

    CFRelease(a1);
    goto LABEL_6;
  }

  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003C0D8();
  }
}

CFTimeInterval sub_1000219C8( const __CFDate *a1, const __CFString *a2, const __CFString *a3, CFTimeInterval *a4)
{
  if (a1)
  {
    if (IOPMCancelScheduledPowerEvent(a1, a2, a3))
    {
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003C130();
      }
    }

    CFRelease(a1);
    CFTimeInterval result = -kCFAbsoluteTimeIntervalSince1970;
    *a4 = -kCFAbsoluteTimeIntervalSince1970;
  }

  return result;
}

void sub_100021A40(int a1, int a2, IOHIDServiceClientRef service)
{
  RegistryID = (const __CFNumber *)IOHIDServiceClientGetRegistryID(service);
  uint64_t valuePtr = 0LL;
  if (RegistryID)
  {
    BOOL v5 = RegistryID;
    CFTypeID v6 = CFGetTypeID(RegistryID);
    if (v6 == CFNumberGetTypeID()) {
      CFNumberGetValue(v5, kCFNumberSInt64Type, &valuePtr);
    }
  }

  CFNumberRef v7 = (const __CFString *)IOHIDServiceClientCopyProperty(service, @"Product");
  CFNumberRef v8 = v7;
  if (!v7 || (CFTypeID v9 = CFGetTypeID(v7), v9 != CFStringGetTypeID()))
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003C1E8();
      if (!v8) {
        goto LABEL_9;
      }
    }

    else if (!v8)
    {
LABEL_9:
      CFNumberRef v8 = @"unknown Sensor";
      goto LABEL_10;
    }

    CFRelease(v8);
    goto LABEL_9;
  }

LABEL_10:
  CFNumberRef v10 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003C15C(v8, (uint64_t)&valuePtr, v10);
  }
  CFRelease(v8);
}

  objc_autoreleasePoolPop(v5);
  return v7;
}

  self->super._maxLI = result;
  return result;
}

void sub_100021B44()
{
  if (!dword_10007CA80)
  {
    dword_10007CA80 = sub_100020E9C("IOPMPowerSource", 0LL, 0LL);
    if (!dword_10007CA80)
    {
      if (byte_10007CB30)
      {
        io_connect_t v0 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)io_connect_t v1 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEFAULT,  "<Notice> initPowerSource: Failed to Match IOPMPowerSource",  v1,  2u);
        }
      }
    }
  }

void sub_100021BE4()
{
  if (!dword_10007CA84)
  {
    dword_10007CA84 = sub_100020E9C("AppleC26Charger", 0LL, 0LL);
    if (!dword_10007CA84)
    {
      if (byte_10007CB30)
      {
        io_connect_t v0 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)io_connect_t v1 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEFAULT,  "<Notice> initC26Service: Failed to Match AppleC26Charger",  v1,  2u);
        }
      }
    }
  }

uint64_t sub_100021C84()
{
  LOWORD(result) = (unsigned __int16)-[SensorDispatcherHelper getValueFromSMCForKey:]( +[SensorDispatcherHelper sharedInstance]( &OBJC_CLASS___SensorDispatcherHelper,  "sharedInstance"),  "getValueFromSMCForKey:",  @"B0AP");
  if ((_WORD)result != 0xFFFF) {
    return (__int16)result;
  }
  sub_100021B44();
  return 0LL;
}

uint64_t sub_100021CC8()
{
  uint64_t result = dword_100074940;
  unsigned int v1 = dword_100074940;
  if (dword_100074940 == -1)
  {
    IOPSGetPercentRemaining(&v1, 0LL, 0LL);
    return v1;
  }

  return result;
}

uint64_t sub_100021D08()
{
  unsigned int valuePtr = 0;
  sub_100021B44();
  if (dword_10007CA80)
  {
    CFTypeRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( dword_10007CA80,  @"Temperature",  kCFAllocatorDefault,  0);
    if (CFProperty)
    {
      unsigned int v1 = CFProperty;
      CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
      CFRelease(v1);
      return valuePtr;
    }

    uint64_t result = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      sub_10003C240();
      return 0LL;
    }
  }

  else
  {
    uint64_t result = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      sub_10003C214();
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100021DCC(uint64_t result)
{
  dword_100074940 = result;
  return result;
}

void sub_100021DD8()
{
  dword_100074940 = -1;
}

uint64_t sub_100021DE8()
{
  uint64_t valuePtr = 0LL;
  sub_100021B44();
  if (!dword_10007CA80)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003C214();
    }
    return 0LL;
  }

  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty( dword_10007CA80,  @"AppleRawCurrentCapacity",  kCFAllocatorDefault,  0);
  if (!CFProperty)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003C26C();
    }
    return 0LL;
  }

  unsigned int v1 = CFProperty;
  uint64_t v2 = (const __CFNumber *)IORegistryEntryCreateCFProperty( dword_10007CA80,  @"AppleRawMaxCapacity",  kCFAllocatorDefault,  0);
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003C298();
    }
    CFRelease(v1);
    return 0LL;
  }

  int v3 = v2;
  CFNumberGetValue((CFNumberRef)v1, kCFNumberIntType, (char *)&valuePtr + 4);
  CFNumberGetValue(v3, kCFNumberIntType, &valuePtr);
  int v4 = valuePtr;
  else {
    unsigned int v5 = (int)((double)SHIDWORD(valuePtr) * 100.0 / (double)(int)valuePtr + 0.5);
  }
  if (dword_100074944 == -1) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = dword_100074944;
  }
  if (byte_10007CB30)
  {
    CFNumberRef v7 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109632;
      int v11 = HIDWORD(valuePtr);
      __int16 v12 = 1024;
      int v13 = v4;
      __int16 v14 = 1024;
      int v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> raw current %d, raw max %d ==> raw SOC %d",  buf,  0x14u);
    }
  }

  CFRelease(v1);
  CFRelease(v3);
  return v6;
}

void sub_100022020(int a1)
{
  uint64_t v2 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "<Notice> Overiding chemical state of charge to %d\n",  (uint8_t *)v3,  8u);
  }

uint64_t sub_1000220C4(uint64_t result)
{
  dword_100074944 = result;
  return result;
}

void sub_1000220D0()
{
  dword_100074944 = -1;
}

void sub_1000220E0(uint64_t a1, int a2)
{
  unsigned int v3 = -[HidSensors getSensorIndexFrom4CC:]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "getSensorIndexFrom4CC:",  a1);
  if (v3 <= 0x3F)
  {
    unsigned int v4 = v3;
    byte_10007CB40 = 1;
    dword_10007D05C[v3] = a2;
    uint64_t v5 = qword_10007D160 | (1LL << v3);
    qword_10007D160 = v5;
    uint64_t v6 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109632;
      v7[1] = v4;
      __int16 v8 = 1024;
      int v9 = a2;
      __int16 v10 = 2048;
      uint64_t v11 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "<Notice> sensor ID: %d set with temperature: %d - Overridemask %llx",  (uint8_t *)v7,  0x18u);
    }
  }

void sub_1000221F8()
{
  qword_10007D160 = 0LL;
  byte_10007CB40 = 0;
}

CFTypeRef sub_100022214()
{
  if (!dword_10007CA80)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003C214();
    }
    return 0LL;
  }

  CFTypeRef result = IORegistryEntryCreateCFProperty(dword_10007CA80, @"BatteryData", kCFAllocatorDefault, 0);
  if (!result)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003C2C4();
    }
    return 0LL;
  }

  return result;
}

uint64_t sub_1000222B4(const void *a1)
{
  unsigned int valuePtr = 0;
  if (!a1)
  {
    uint64_t result = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result) {
      return result;
    }
    sub_10003C2F0();
    return 0LL;
  }

  uint64_t v2 = (const __CFDictionary *)sub_100022214();
  if (!v2)
  {
    uint64_t v6 = (os_log_s *)qword_10007CF50;
    uint64_t result = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result) {
      return result;
    }
    sub_10003C31C(v6, v7, v8, v9, v10, v11, v12, v13);
    return 0LL;
  }

  unsigned int v3 = v2;
  CFBooleanRef Value = (const __CFNumber *)CFDictionaryGetValue(v2, a1);
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003C38C();
  }

  CFRelease(v3);
  return valuePtr;
}

uint64_t sub_100022398(void *a1)
{
  uint64_t v2 = sub_1000222B4(a1);
  if (byte_10007CB30)
  {
    unsigned int v3 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      id v6 = [a1 UTF8String];
      __int16 v7 = 1024;
      int v8 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "<Notice> %s %d", (uint8_t *)&v5, 0x12u);
    }
  }

  return v2;
}

uint64_t sub_100022470()
{
  uint64_t result = sub_100022398(@"AlgoChemID");
  if (!(_DWORD)result) {
    return sub_100022398(@"ChemID");
  }
  return result;
}

uint64_t sub_1000224A0()
{
  unsigned int valuePtr = 0;
  uint64_t result = dword_100074948;
  if (dword_100074948 == -1)
  {
    unsigned int v1 = (const __CFDictionary *)sub_100022214();
    if (v1)
    {
      uint64_t v2 = v1;
      CFBooleanRef Value = (const __CFArray *)CFDictionaryGetValue(v1, @"WeightedRa");
      CFTypeID TypeID = CFArrayGetTypeID();
      if (Value && CFGetTypeID(Value) == TypeID)
      {
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(Value, 0LL);
        CFTypeID v6 = CFNumberGetTypeID();
        if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == v6)
        {
          CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr);
          if (byte_10007CB30)
          {
            __int16 v7 = (os_log_s *)qword_10007CF50;
            if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 67109120;
              unsigned int v18 = valuePtr;
              _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Weighted Ra %d", buf, 8u);
            }
          }
        }

        else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
        {
          sub_10003C488();
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        sub_10003C45C();
      }

      CFRelease(v2);
      return valuePtr;
    }

    else
    {
      int v8 = (os_log_s *)qword_10007CF50;
      uint64_t result = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
      if ((_DWORD)result)
      {
        sub_10003C3EC(v8, v9, v10, v11, v12, v13, v14, v15);
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t sub_10002266C()
{
  unsigned int valuePtr = -1;
  io_connect_t v0 = (const __CFDictionary *)sub_100022214();
  if (v0)
  {
    unsigned int v1 = v0;
    CFBooleanRef Value = CFDictionaryGetValue(v0, @"RaTableRaw");
    CFTypeID TypeID = CFArrayGetTypeID();
    if (!Value || CFGetTypeID(Value) != TypeID)
    {
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003C524();
      }
      goto LABEL_18;
    }

    ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex((CFArrayRef)Value, 0LL);
    if (ValueAtIndex)
    {
      int v5 = ValueAtIndex;
      CFIndex Length = CFDataGetLength(ValueAtIndex);
      if ((_DWORD)Length != 32)
      {
        int v22 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003C5A8(Length, v22, v23, v24, v25, v26, v27, v28);
        }
        goto LABEL_18;
      }

      BytePtr = CFDataGetBytePtr(v5);
      uint64_t v8 = 0LL;
      signed int v9 = -1;
      do
      {
        unsigned int v10 = *(unsigned __int16 *)&BytePtr[v8];
        if (v9 < (int)(bswap32(v10) >> 16))
        {
          signed int v9 = __rev16(v10);
          unsigned int valuePtr = v9;
        }

        v8 += 2LL;
      }

      while ((_DWORD)v8 != 18);
    }

    else
    {
      uint64_t v11 = (const __CFDictionary *)CFDictionaryGetValue(v1, @"LifetimeData");
      if (!v11)
      {
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003C550();
        }
        goto LABEL_18;
      }

      uint64_t v12 = (const __CFNumber *)CFDictionaryGetValue(v11, @"MaximumRa0-8");
      if (!v12)
      {
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003C57C();
        }
        goto LABEL_18;
      }

      CFNumberGetValue(v12, kCFNumberIntType, &valuePtr);
    }

    if (dword_10007494C != -1) {
      unsigned int valuePtr = dword_10007494C;
    }
LABEL_18:
    CFRelease(v1);
    return valuePtr;
  }

  uint64_t v14 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003C4B4(v14, v15, v16, v17, v18, v19, v20, v21);
  }
  return 0xFFFFFFFFLL;
}

void sub_100022854(int a1)
{
  uint64_t v2 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "<Notice> Overriding Ra to %d",  (uint8_t *)v3,  8u);
  }

  dword_10007494C = a1;
}

void sub_1000228FC()
{
  dword_10007494C = -1;
}

void sub_10002290C(int a1)
{
  uint64_t v2 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "<Notice> Overriding Weighted Ra to %d",  (uint8_t *)v3,  8u);
  }

  dword_100074948 = a1;
}

void sub_1000229B4()
{
  dword_100074948 = -1;
}

uint64_t sub_1000229C4()
{
  unsigned int v8 = 0;
  io_registry_entry_t v0 = dword_10007CAAC;
  if (!dword_10007CAAC)
  {
    CFMutableDictionaryRef v1 = IOServiceMatching("IOService");
    if (v1)
    {
      uint64_t v2 = v1;
      int valuePtr = 0;
      qword_10007CAB0 = (uint64_t)CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
      CFDictionaryRef v3 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&off_100074960,  (const void **)&qword_10007CAB0,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      if (v3)
      {
        CFDictionaryRef v4 = v3;
        CFDictionarySetValue(v2, @"IOPropertyMatch", v3);
        CFRelease(v4);
        dword_10007CAAC = IOServiceGetMatchingService(kIOMainPortDefault, v2);
      }

      else
      {
        CFRelease(v2);
      }
    }

    io_registry_entry_t v0 = dword_10007CAAC;
    if (!dword_10007CAAC)
    {
      uint64_t result = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
      if (!(_DWORD)result) {
        return result;
      }
      sub_10003C60C();
      return 0LL;
    }
  }

  CFTypeRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( v0,  @"IOPMUBootUPOCounter",  kCFAllocatorDefault,  0);
  if (!CFProperty)
  {
    uint64_t result = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result) {
      return result;
    }
    sub_10003C638();
    return 0LL;
  }

  CFTypeID v6 = CFProperty;
  CFNumberGetValue(CFProperty, kCFNumberIntType, &v8);
  if (dword_100074950 != -1) {
    unsigned int v8 = dword_100074950;
  }
  CFRelease(v6);
  return v8;
}

uint64_t sub_100022B4C(uint64_t result)
{
  dword_100074950 = result;
  return result;
}

uint64_t sub_100022B58()
{
  return byte_10007CA88;
}

uint64_t sub_100022B64(uint64_t result)
{
  byte_10007CA88 = result;
  return result;
}

uint64_t sub_100022B70(uint64_t result)
{
  byte_100074954 = result;
  return result;
}

uint64_t sub_100022B7C()
{
  return byte_100074954;
}

uint64_t sub_100022B88()
{
  return byte_10007CA89;
}

uint64_t sub_100022B94(uint64_t result)
{
  byte_10007CA89 = result;
  return result;
}

uint64_t sub_100022BA0(io_registry_entry_t a1)
{
  if (dword_100074958 != -1) {
    return dword_100074958 != 0;
  }
  if (a1) {
    return sub_100021808(a1, @"ExternalConnected");
  }
  return 1LL;
}

uint64_t sub_100022BD4(uint64_t result)
{
  dword_100074958 = result;
  return result;
}

void sub_100022BE0(uint64_t a1, const __CFArray *cf)
{
  if (a1 && cf && (CFTypeID v4 = CFGetTypeID(cf), v4 == CFArrayGetTypeID()))
  {
    if (CFArrayGetCount(cf) >= 1)
    {
      CFIndex v5 = 0LL;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(cf, v5);
        CFTypeID v7 = CFGetTypeID(ValueAtIndex);
        if (v7 == CFNumberGetTypeID())
        {
          char valuePtr = 0;
          CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberCharType, &valuePtr);
          *(_BYTE *)(a1 + v5) = valuePtr;
        }

        ++v5;
      }

      while (CFArrayGetCount(cf) > v5);
    }
  }

  else
  {
    unsigned int v8 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003C664(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }

BOOL sub_100022CCC()
{
  io_registry_entry_t v0 = (const __CFBoolean *)MGCopyAnswer(@"InternalBuild", 0LL);
  if (!v0) {
    return 0LL;
  }
  CFMutableDictionaryRef v1 = v0;
  CFTypeID v2 = CFGetTypeID(v0);
  BOOL v3 = v2 == CFBooleanGetTypeID() && CFBooleanGetValue(v1) != 0;
  CFRelease(v1);
  return v3;
}

BOOL sub_100022D3C()
{
  io_registry_entry_t v0 = (const __CFBoolean *)MGCopyAnswer(@"CarrierInstallCapability", 0LL);
  if (!v0) {
    return 0LL;
  }
  CFMutableDictionaryRef v1 = v0;
  CFTypeID v2 = CFGetTypeID(v0);
  BOOL v3 = v2 == CFBooleanGetTypeID() && CFBooleanGetValue(v1) != 0;
  CFRelease(v1);
  return v3;
}

uint64_t sub_100022DAC()
{
  uint64_t v0 = MGGetSInt32Answer(@"main-screen-class", 0xFFFFFFFFLL);
  if ((_DWORD)v0 == -1 && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003C6D4();
  }
  return v0;
}

BOOL sub_100022E0C()
{
  uint64_t v0 = sub_100022DAC();
  char v1 = v0 - 12;
  CFTypeID v2 = (os_log_s *)qword_10007CF50;
  BOOL result = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_10003C700(v0, v2, v4, v5, v6, v7, v8, v9);
    return 0LL;
  }

  return result;
}

BOOL sub_100022E88(char *a1, const char *a2, size_t a3)
{
  size_t v6 = strlen(a1);
  size_t v7 = v6 + strlen(a2) + 1;
  if (v7 > a3)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003C764();
    }
  }

  else
  {
    strcat(a1, a2);
  }

  return v7 <= a3;
}

uint64_t sub_100022F24()
{
  return MGGetSInt32Answer(@"AtmPEO/j+Pdr8+WKxv4Aaw", 0LL);
}

uint64_t sub_100022F34(char *name, int *out_token, dispatch_queue_s *a3, void *a4)
{
  if (a3 && name && out_token && a4)
  {
    if (notify_register_check(name, out_token))
    {
      uint64_t v17 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003C848(v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }

    else
    {
      if (!notify_register_dispatch(name, out_token, a3, a4))
      {
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = sub_100023064;
        v33[3] = &unk_1000618E8;
        v33[4] = a4;
        v33[5] = out_token;
        dispatch_async(a3, v33);
        return 0LL;
      }

      uint64_t v25 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003C7D8(v25, v26, v27, v28, v29, v30, v31, v32);
      }
    }
  }

  else
  {
    uint64_t v9 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003C8B8(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }

  return -1LL;
}

uint64_t sub_100023064(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  **(unsigned int **)(a1 + 40));
}

uint64_t sub_100023078(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0x8000000000000000LL) == 0 || (unint64_t v2 = 0x8000000000000000LL, (uint64_t)(0x8000000000000000LL - a2) <= a1))
  {
    BOOL v3 = (a2 ^ 0x7FFFFFFFFFFFFFFFLL) >= a1 || a2 <= 0;
    unint64_t v2 = a2 + a1;
    if (!v3) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v2;
}

CFDictionaryRef sub_1000230AC(int a1, int a2)
{
  int v4 = a2;
  int valuePtr = a1;
  *(_OWORD *)keys = *(_OWORD *)&off_100061908;
  values = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  CFTypeRef cf = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v4);
  CFDictionaryRef v2 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)keys,  (const void **)&values,  2LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFRelease(values);
  CFRelease(cf);
  return v2;
}

uint64_t sub_10002317C(__IOHIDServiceClient *a1, const __CFString *a2)
{
  unsigned int valuePtr = 0;
  CFDictionaryRef v2 = (const __CFNumber *)IOHIDServiceClientCopyProperty(a1, a2);
  BOOL v3 = v2;
  if (v2)
  {
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == CFNumberGetTypeID())
    {
      if (!CFNumberGetValue(v3, kCFNumberSInt32Type, &valuePtr)
        && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        sub_10003C990();
      }

      goto LABEL_8;
    }
  }

  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003C928();
    if (v3) {
      goto LABEL_8;
    }
  }

  else if (v3)
  {
LABEL_8:
    CFRelease(v3);
    return valuePtr;
  }

  return 0LL;
}

void sub_100023260(uint64_t a1)
{
  char v1 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", a1);
  uint64_t v3 = 0LL;
  if (!-[NSURL setResourceValue:forKey:error:]( v1,  "setResourceValue:forKey:error:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  NSURLIsExcludedFromBackupKey,  &v3))
  {
    CFDictionaryRef v2 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003C9F8(v1, (uint64_t)&v3, v2);
    }
  }

id sub_1000232F8()
{
  uint64_t v0 = IOServiceMatching("IOPMPowerSource");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v0);
  CFMutableDictionaryRef properties = 0LL;
  IORegistryEntryCreateCFProperties(MatchingService, &properties, 0LL, 0);
  CFMutableDictionaryRef v2 = properties;
  id v3 = objc_msgSend( -[__CFDictionary objectForKeyedSubscript:]( properties,  "objectForKeyedSubscript:",  @"BatteryShutdownReason"),  "copy");

  return v3;
}

void sub_100023374(unsigned int *a1, unsigned int *a2)
{
  id v8 = sub_1000232F8();
  id v4 = [v8 objectForKeyedSubscript:@"uiSOC"];
  id v5 = [v8 objectForKeyedSubscript:@"temperature"];
  if (a1)
  {
    if (v4) {
      unsigned int v6 = [v4 intValue];
    }
    else {
      unsigned int v6 = -1;
    }
    *a1 = v6;
  }

  if (a2)
  {
    if (v5) {
      unsigned int v7 = [v5 intValue];
    }
    else {
      unsigned int v7 = -1;
    }
    *a2 = v7;
  }
}

void sub_10002340C(int a1)
{
  int valuePtr = a1;
  if (qword_10007CA90 != -1) {
    dispatch_once(&qword_10007CA90, &stru_100061918);
  }
  CFNumberRef v1 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (dword_10007CA98
    && IORegistryEntrySetCFProperty(dword_10007CA98, @"UseBaselineSystemCapability", v1)
    && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003CA80();
    if (!v1) {
      return;
    }
  }

  else if (!v1)
  {
    return;
  }

  CFRelease(v1);
}

void sub_1000234CC(id a1)
{
  dword_10007CA98 = sub_100020E9C("ApplePPM", 0LL, 0LL);
}

uint64_t sub_1000234F8()
{
  unsigned int v1 = 0;
  sub_100021BE4();
  if ((sub_1000212F4(dword_10007CA84, @"ThermalProfile", &v1, 1LL) & 1) == 0
    && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003CAAC();
  }

  return v1;
}

float sub_10002356C()
{
  *(float *)dword_10007D270 = (float)(int)MGGetSInt32Answer(@"AtmPEO/j+Pdr8+WKxv4Aaw", 0LL);
  float result = (float)sub_100022E0C();
  *(float *)&dword_10007D274 = result;
  return result;
}

float sub_1000235EC(const char *a1)
{
  unsigned int v1 = fopen(a1, "r");
  if (v1)
  {
    CFMutableDictionaryRef v2 = v1;
    fseek(v1, 0LL, 2);
    float v3 = (float)ftell(v2) / 1000000.0;
    fclose(v2);
  }

  else
  {
    puts("File Not Found!");
    return -1.0;
  }

  return v3;
}

uint64_t sub_100023664(void *a1, _DWORD *a2, int a3)
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = [a1 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v6) {
    return 4294934528LL;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v17;
  LODWORD(v9) = -32768;
  do
  {
    for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(a1);
      }
      signed int v11 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)i) intValue];
      if (a3) {
        uint64_t v12 = dword_10007CF5C;
      }
      else {
        uint64_t v12 = a2;
      }
      int v13 = v12[v11];
      else {
        unsigned int v14 = v9;
      }
      if (v13 == 3000) {
        uint64_t v9 = v9;
      }
      else {
        uint64_t v9 = v14;
      }
    }

    id v7 = [a1 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }

  while (v7);
  return v9;
}

uint64_t sub_10002378C()
{
  if ((byte_10007CA9C & 1) != 0) {
    return dword_10007CAA0;
  }
  CFTypeRef cf = 0LL;
  uint64_t v0 = IOReportCopyChannelsInGroup(@"Battery", 0LL, 0LL, 0LL);
  if (v0)
  {
    unsigned int v1 = (const void *)v0;
    CFMutableDictionaryRef v2 = (const void *)IOReportCreateSubscription(0LL, v0, &cf, 0LL, 0LL);
    CFRelease(v1);
    CFTypeRef v3 = cf;
    if (cf && v2)
    {
      uint64_t Samples = IOReportCreateSamples(v2, cf, 0LL);
      IOReportIterate(Samples, &stru_100061958);
    }

    else
    {
      uint64_t Samples = 0LL;
      id v5 = 0LL;
      if (!v2)
      {
LABEL_10:
        if (v3) {
          CFRelease(v3);
        }
        if (v5) {
          CFRelease(v5);
        }
        return dword_10007CAA0;
      }
    }

    CFRelease(v2);
    CFTypeRef v3 = cf;
    id v5 = (const void *)Samples;
    goto LABEL_10;
  }

  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003CAD8();
  }
  return dword_10007CAA0;
}

int sub_100023898(id a1, __CFDictionary *a2)
{
  ChannelName = (void *)IOReportChannelGetChannelName(a2);
  dword_10007CAA0 = IOReportSimpleGetIntegerValue(a2, 0LL);
  int result = [ChannelName isEqualToString:@"BatteryIDChanged"];
  if (result)
  {
    byte_10007CA9C = 1;
    return dword_10007CAA0;
  }

  return result;
}

void sub_1000238F8()
{
  uint64_t v0 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 1LL, 0LL);
  theArray = IOHIDEventSystemClientCopyServices(v0);
  if (theArray && CFArrayGetCount(theArray))
  {
    unsigned int v1 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "<Notice> IOHID Event System State", buf, 2u);
    }

    uint64_t v2 = 0LL;
    uint64_t v12 = v0;
    do
    {
      CFTypeRef v3 = (const __CFArray *)IOHIDEventSystemClientCopyProperty(v0, off_100061978[v2]);
      if (v3)
      {
        id v4 = v3;
        CFTypeID v5 = CFGetTypeID(v3);
        if (v5 == CFArrayGetTypeID())
        {
          CFIndex Count = CFArrayGetCount(v4);
          if (Count >= 1)
          {
            CFIndex v7 = Count;
            for (CFIndex i = 0LL; i != v7; ++i)
            {
              ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
              uint64_t v10 = (os_log_s *)qword_10007CF50;
              if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)__int128 buf = 138412290;
                unsigned int v14 = ValueAtIndex;
                _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> dict: %@", buf, 0xCu);
              }
            }
          }

          CFRelease(v4);
          uint64_t v0 = v12;
        }
      }

      ++v2;
    }

    while (v2 != 3);
  }

  if (v0) {
    CFRelease(v0);
  }
  if (theArray) {
    CFRelease(theArray);
  }
}

uint64_t sub_100023AD0()
{
  return (-[SensorDispatcherHelper getValueFromSMCForKey:]( +[SensorDispatcherHelper sharedInstance]( &OBJC_CLASS___SensorDispatcherHelper,  "sharedInstance"),  "getValueFromSMCForKey:",  @"GGRC") >> 24);
}

uint64_t sub_100023AFC()
{
  if ((byte_10007CAA4 & 1) != 0) {
    return dword_10007CAA8;
  }
  CFMutableDictionaryRef v1 = IOServiceMatching("IOPMPowerSource");
  CFMutableDictionaryRef v2 = IOServiceMatching("AppleAuthCPRelay");
  CFTypeRef v3 = v2;
  if (!v2 || !v1)
  {
    if (v2) {
      CFRelease(v2);
    }
    if (v1) {
      CFRelease(v1);
    }
LABEL_16:
    uint64_t result = 0xFFFFFFFFLL;
    dword_10007CAA8 = -1;
    return result;
  }

  CFDictionarySetValue(v2, @"IOParentMatch", v1);
  CFRelease(v1);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  if (!MatchingService) {
    return dword_10007CAA8;
  }
  CFMutableDictionaryRef properties = 0LL;
  IORegistryEntryCreateCFProperties(MatchingService, &properties, 0LL, 0);
  CFTypeID v5 = (id)CFMakeCollectable(properties);
  if (!v5) {
    goto LABEL_16;
  }
  id v6 = v5;
  if (![v5 objectForKey:@"isTrustedForUI"]) {
    goto LABEL_16;
  }
  else {
    uint64_t result = 2LL;
  }
  dword_10007CAA8 = result;
  byte_10007CAA4 = 1;
  return result;
}

void sub_100023C24(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

id sub_100023F54(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateInternal];
}

NSDictionary *sub_100024650(unsigned int *a1)
{
  v3[0] = @"TSFP";
  v4[0] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[8]);
  v3[1] = @"TSBM";
  v4[1] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[9]);
  _DWORD v3[2] = @"TN0n";
  v4[2] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[10]);
  v3[3] = @"PP0u";
  v4[3] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[11]);
  v3[4] = @"Die_Temp_MaxAverage";
  v4[4] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[12]);
  v3[5] = @"Pressure_Level";
  void v4[5] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[13]);
  void v3[6] = @"BackLight_maxLI";
  void v4[6] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[14]);
  v3[7] = @"AudioAmp_maxLI";
  v4[7] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[15]);
  v3[8] = @"CPU_maxLI";
  v4[8] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[16]);
  v3[9] = @"GPU_maxLI";
  v4[9] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[17]);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  10LL);
}

void sub_10002539C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, id location)
{
}

id sub_100025408(uint64_t a1, int a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  uint64_t state64 = 0LL;
  id result = (id)notify_get_state(a2, &state64);
  if (!(_DWORD)result) {
    return [Weak handleRearCameraPowerStateNotification:state64];
  }
  return result;
}

id sub_100025458(uint64_t a1, int a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  uint64_t state64 = 0LL;
  id result = (id)notify_get_state(a2, &state64);
  if (!(_DWORD)result) {
    return [Weak handleFrontCameraPowerStateNotification:state64];
  }
  return result;
}

id sub_1000254A8(uint64_t a1, int a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  uint64_t state64 = 0LL;
  id result = (id)notify_get_state(a2, &state64);
  if (!(_DWORD)result) {
    return [Weak handleOdeonStateNotification:state64];
  }
  return result;
}

id sub_1000254F8(uint64_t a1, int a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  uint64_t state64 = 0LL;
  id result = (id)notify_get_state(a2, &state64);
  if (!(_DWORD)result) {
    return [Weak handleOasisStateNotification:state64];
  }
  return result;
}

id sub_1000255A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateInternal];
}

LABEL_50:
    if (v22 == coldPressureState) {
      goto LABEL_58;
    }
    goto LABEL_51;
  }

  coldThresholdHysteresis = self->_coldThresholdHysteresis;
  else {
    uint64_t v22 = 0LL;
  }
LABEL_51:
  self->_coldPressureState = v22;
  if (byte_1000748C0)
  {
    -[TGraphSampler updateAppleCareState:value:]( +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance"),  "updateAppleCareState:value:",  2LL,  v22);
    if (notify_set_state(self->_coldPressureNotificationToken, v22))
    {
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003CFA8();
      }
    }

    else if (notify_post("com.apple.system.thermalpressurelevel.cold") {
           && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    }
    {
      sub_10003CF7C();
    }
  }

LABEL_58:
  lowTempClampStrobe = self->_lowTempClampStrobe;
  if (lowTempClampStrobe)
  {
    uint64_t v26 = -[TableDrivenLowTempController outputForBatteryTemperature:stateOfCharge:batteryRaValue:]( lowTempClampStrobe,  "outputForBatteryTemperature:stateOfCharge:batteryRaValue:",  v3,  self->_lowTempSyntheticSOC,  v13);
    if (v26 != self->_lowTempMaxStrobe)
    {
      if (byte_1000748C0)
      {
        uint64_t v27 = v26;
        self->_lowTempMaxStrobe = v26;
        if (byte_10007CB30)
        {
          uint64_t v28 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)CFTypeRef cf = 67109120;
            *(_DWORD *)&cf[4] = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "<Notice> Clamp: max strobe now %d",  cf,  8u);
          }
        }

        uint64_t v29 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &self->_lowTempMaxStrobe);
        if (v29)
        {
          uint64_t v30 = v29;
          if (IORegistryEntrySetCFProperty(self->_strobeService, @"CameraStrobeMaxLoad", v29)
            && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
          {
            sub_10003CF50();
          }

          CFRelease(v30);
        }
      }
    }
  }

  lowTempClampPPMBaseline = self->_lowTempClampPPMBaseline;
  if (lowTempClampPPMBaseline)
  {
    uint64_t v32 = -[TableDrivenLowTempController outputForBatteryTemperature:stateOfCharge:batteryRaValue:]( lowTempClampPPMBaseline,  "outputForBatteryTemperature:stateOfCharge:batteryRaValue:",  v3,  self->_lowTempSyntheticSOC,  v13);
    if (v32 != self->_lowTempPPMBaseline)
    {
      if (byte_1000748C0)
      {
        uint64_t v33 = v32;
        self->_lowTempPPMBaseline = v32;
        if (byte_10007CB30)
        {
          uint64_t v34 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)CFTypeRef cf = 67109120;
            *(_DWORD *)&cf[4] = v33;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "<Notice> Clamp: PPM baseline now %d",  cf,  8u);
          }
        }

        *(void *)CFTypeRef cf = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &self->_lowTempPPMBaseline);
        if (*(void *)cf)
        {
          uint64_t v35 = CFArrayCreate(kCFAllocatorDefault, (const void **)cf, 1LL, &kCFTypeArrayCallBacks);
          if (v35)
          {
            uint64_t v36 = v35;
            __int16 v37 = IORegistryEntrySetCFProperty(self->_ppmService, @"BaselineSystemCapability", v35);
            if ((_DWORD)v37)
            {
              int v38 = v37;
              int v39 = (os_log_s *)qword_10007CF50;
              if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
                sub_10003CEEC(v38, v39, v40, v41, v42, v43, v44, v45);
              }
            }

            CFRelease(v36);
          }

          CFRelease(*(CFTypeRef *)cf);
        }
      }
    }
  }

void sub_1000265B4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

LABEL_6:
  objc_autoreleasePoolPop(v4);
  return v9;
}

void sub_100029AE8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) copyUpdatedLTSState];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 32) saveLTSStateToNand:v2];
    [*(id *)(a1 + 32) safeFreeUpdatedLTSState:v3];
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003D820();
  }

LABEL_32:
  if (byte_10007CB30)
  {
    __int128 v17 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v19 = 67109632;
      uint64_t v20 = v9;
      uint64_t v21 = 1024;
      uint64_t v22 = v10;
      uint64_t v23 = 1024;
      uint64_t v24 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "<Notice> Resolved persistence: Version: %d, Counter: %d, PMP Data Source: %d",  (uint8_t *)&v19,  0x14u);
    }
  }

  if (self->_hasNvram && self->_initializeNvram && byte_10007CB30)
  {
    __int128 v18 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "<Notice> NVRAM will be updated",  (uint8_t *)&v19,  2u);
    }
  }

LABEL_27:
      CFIndex v7 = (v7 + 1);
      id v6 = v25;
    }

    while (v7 < v25);
    id v4 = HIDWORD(v25);
LABEL_29:
    CFTypeID v5 = (v5 + 1);
  }

  while (v5 < v4);
LABEL_30:
  if (byte_10007CB30)
  {
    uint64_t v20 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "<Notice> Updated PMP with saved LTS State",  buf,  2u);
    }
  }

  LOBYTE(v21) = 1;
  return v21;
}

  __int128 v18 = 0;
LABEL_28:
  if (v4) {
    goto LABEL_29;
  }
LABEL_30:
  if (byte_10007CB30)
  {
    uint64_t v15 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v25) = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "<Notice> suppressStandardBehaviors %d",  buf,  8u);
    }
  }

  return v18;
}

LABEL_33:
  uint64_t v30 = *v16;
  if (v30 == 2)
  {
    [v7 initPerfStateReportingGPU];
    uint64_t v31 = 0LL;
    *((_DWORD *)v7 + 90) = [v7 initPerfStateVoltagesGPU];
    uint64_t v53 = v7 + 232;
    uint64_t v32 = byte_10007CB30;
    do
    {
      if (v32)
      {
        uint64_t v33 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v34 = *(_DWORD *)&v7[4 * v31 + 232];
          *(_DWORD *)__int128 buf = 67109376;
          uint64_t v60 = v31;
          uint64_t v61 = 1024;
          __int16 v62 = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "<Notice> LSController GPU[%d] %d",  buf,  0xEu);
          uint64_t v32 = byte_10007CB30;
        }
      }

      ++v31;
    }

    while (v31 != 16);
    uint64_t v35 = [v55 objectForKeyedSubscript:@"params"];
    *((void *)v7 + 3) = 0LL;
    uint64_t v36 = objc_alloc(&OBJC_CLASS___LifetimeServoControlLoop);
    __int16 v37 = [v35 objectForKeyedSubscript:@"coreTypeP"];
    int v38 = *((unsigned int *)v7 + 50);
    int v39 = *((void *)v7 + 52);
    size_t v40 = v36;
    BOOL v41 = v7 + 72;
  }

  else
  {
    if (v30 != 1)
    {
      if (v30)
      {
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003E700();
        }
      }

      else
      {
        *((void *)v7 + 3) = 0LL;
        *((void *)v7 + 4) = -[LifetimeServoControlLoop initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:]( objc_alloc(&OBJC_CLASS___LifetimeServoControlLoop),  "initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:",  v55,  v54,  *((unsigned int *)v7 + 50),  0LL,  v27,  *((void *)v7 + 52));
        *((void *)v7 + 5) = 0LL;
      }

      goto LABEL_54;
    }

    [v7 initPerfStateReportingGPU];
    id v42 = 0LL;
    *((_DWORD *)v7 + 90) = [v7 initPerfStateVoltagesGPU];
    uint64_t v53 = v7 + 232;
    CFBooleanRef v43 = byte_10007CB30;
    do
    {
      if (v43)
      {
        v44 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          int v45 = *(_DWORD *)&v7[4 * v42 + 232];
          *(_DWORD *)__int128 buf = 67109376;
          uint64_t v60 = v42;
          uint64_t v61 = 1024;
          __int16 v62 = v45;
          _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "<Notice> LSController GPU[%d] %d",  buf,  0xEu);
          CFBooleanRef v43 = byte_10007CB30;
        }
      }

      ++v42;
    }

    while (v42 != 16);
    uint64_t v35 = [v55 objectForKeyedSubscript:@"params"];
    *((void *)v7 + 3) = -[LifetimeServoControlLoop initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:]( [LifetimeServoControlLoop alloc],  "initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:",  [v35 objectForKeyedSubscript:@"coreTypeE"],  v54,  3,  1,  v27,  *((void *)v7 + 52));
    int v46 = objc_alloc(&OBJC_CLASS___LifetimeServoControlLoop);
    __int16 v37 = [v35 objectForKeyedSubscript:@"coreTypeP"];
    BOOL v41 = v7 + 84;
    int v38 = (*((_DWORD *)v7 + 50) - 3);
    int v39 = *((void *)v7 + 52);
    size_t v40 = v46;
  }

  *((void *)v7 + 4) = -[LifetimeServoControlLoop initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:]( v40,  "initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:",  v37,  v41,  v38,  2LL,  v27,  v39);
  *((void *)v7 + 5) = -[LifetimeServoControlLoop initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:]( [LifetimeServoControlLoop alloc],  "initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:",  [v35 objectForKeyedSubscript:@"coreTypeG"],  v53,  *((unsigned int *)v7 + 90),  3,  v27,  *((void *)v7 + 52));
  [v7 initSensorList:a4];
LABEL_54:
  [*((id *)v7 + 3) updatePersistedState];
  [*((id *)v7 + 4) updatePersistedState];
  [*((id *)v7 + 5) updatePersistedState];
  *((_DWORD *)v7 + 95) = [*((id *)v7 + 3) dieTempTarget];
  *((_DWORD *)v7 + 96) = [*((id *)v7 + 4) dieTempTarget];
  *((_DWORD *)v7 + 97) = [*((id *)v7 + 5) dieTempTarget];
  double v47 = dispatch_queue_create("com.apple.thermalmonitor.lservo", 0LL);
  if (v47)
  {
    v48 = v47;
    uint64_t v49 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v47);
    *((void *)v7 + 51) = v49;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10002E748;
    handler[3] = &unk_1000614D0;
    handler[4] = v7;
    dispatch_source_set_event_handler(v49, handler);
    CFRelease(v48);
    v50 = (dispatch_source_s *)*((void *)v7 + 51);
    uint64_t v51 = dispatch_time(0x8000000000000000LL, 3600000000000LL);
    dispatch_source_set_timer(v50, v51, 0x34630B8A000uLL, 0x2540BE400uLL);
    dispatch_resume(*((dispatch_object_t *)v7 + 51));
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003E6D4();
  }

  return (LifetimeServoController *)v7;
}

id sub_10002E748(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) updatePersistedState];
}

LABEL_15:
      self->_dieTempTargetCPU = v14;
      goto LABEL_16;
    case 0:
      -[LifetimeServoControlLoop updateForPerfStateResidency:count:tempMax:tempAverage:]( self->_pCoreLoop,  "updateForPerfStateResidency:count:tempMax:tempAverage:",  self->_perfStateFractionCPU,  self->_perfStateCountCPU,  v8,  v4);
      signed int v11 = -[LifetimeServoControlLoop dieTempTarget](self->_pCoreLoop, "dieTempTarget");
      uint64_t v12 = 372LL;
      goto LABEL_19;
  }

  signed int v11 = 9500;
  self->_dieTempTargetCPU = 9500;
LABEL_18:
  uint64_t v12 = 376LL;
LABEL_19:
  *(_DWORD *)((char *)&self->super.isa + v12) = v11;
  override_dieTempTarget = self->_override_dieTempTarget;
  if (override_dieTempTarget != -1)
  {
    self->_dieTempTargetCPU = override_dieTempTarget;
    self->_dieTempTargetGPU = override_dieTempTarget;
  }

  if (self->_cpuDieTempCtlService)
  {
    if (-[LifetimeServoControlLoop loopIsActive](self->_eCoreLoop, "loopIsActive")
      || -[LifetimeServoControlLoop loopIsActive](self->_pCoreLoop, "loopIsActive")
      || (__int128 v18 = -[LifetimeServoControlLoop loopIsActive](self->_gCoreLoop, "loopIsActive"), override_dieTempTarget != -1)
      || v18)
    {
      if (dword_10007CABC != self->_dieTempTargetCPU)
      {
        -[LifetimeServoController writeToDriverService:key:value:]( self,  "writeToDriverService:key:value:",  self->_cpuDieTempCtlService,  @"LifetimeServoDieTemperatureTargetPropertyKey");
        dword_10007CABC = self->_dieTempTargetCPU;
      }

      if (dword_10007CAC0 != self->_dieTempTargetGPU && self->updateGPUFastDieTarget)
      {
        -[LifetimeServoController writeToDriverService:key:value:]( self,  "writeToDriverService:key:value:",  self->_gpuDieTempCtlService,  @"LifetimeServoFastDieTemperatureTarget");
        dword_10007CAC0 = self->_dieTempTargetGPU;
      }
    }
  }

  -[LifetimeServoController updateCoreAnalyticsInfo](self, "updateCoreAnalyticsInfo");
}

      -[PowerSourceCC getAdaptorPMUValue](v5, "getAdaptorPMUValue");
      return v5;
    }

uint64_t sub_10002F3D8(uint64_t a1, uint64_t a2)
{
  int Count = IOReportStateGetCount(a2);
  int v6 = Count;
  if (Count < 17)
  {
    if (Count < 1) {
      return 0LL;
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003EBFC();
  }

  uint64_t v7 = 0LL;
  *(void *)&__int128 v5 = 138412546LL;
  __int128 v17 = v5;
  do
  {
    double DutyCycle = IOReportStateGetDutyCycle(a2, v7);
    if (DutyCycle > 0.0)
    {
      double v9 = DutyCycle;
      NameForIndex = (const __CFString *)IOReportStateGetNameForIndex(a2, v7);
      if (NameForIndex)
      {
        signed int v11 = (__CFString *)NameForIndex;
        if (CFStringGetCharacterAtIndex(NameForIndex, 0LL) == 86)
        {
          if (byte_10007CB30)
          {
            uint64_t v12 = (os_log_s *)qword_10007CF50;
            if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = v17;
              __int128 v19 = v11;
              __int16 v20 = 2048;
              double v21 = v9;
              _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "<Notice> LSController: %@, fraction %f",  buf,  0x16u);
            }
          }

          int v13 = objc_msgSend( -[__CFString substringFromIndex:](v11, "substringFromIndex:", 1, v17),  "intValue");
          unsigned int v14 = v13 & ~(v13 >> 31);
          if (v14 >= 0xF) {
            unsigned int v14 = 15;
          }
          float v15 = v9;
          *(float *)(*(void *)(a1 + 32) + 4LL * v14 + 136) = v15;
        }
      }
    }

    uint64_t v7 = (v7 + 1);
  }

  while (v6 != (_DWORD)v7);
  return 0LL;
}

uint64_t sub_10002F648(uint64_t a1, uint64_t a2)
{
  int Count = IOReportStateGetCount(a2);
  int v6 = Count;
  if (Count < 17)
  {
    if (Count < 1) {
      return 0LL;
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003EC60();
  }

  uint64_t v7 = 0LL;
  *(void *)&__int128 v5 = 138412546LL;
  __int128 v17 = v5;
  do
  {
    double DutyCycle = IOReportStateGetDutyCycle(a2, v7);
    if (DutyCycle > 0.0)
    {
      double v9 = DutyCycle;
      NameForIndex = (const __CFString *)IOReportStateGetNameForIndex(a2, v7);
      if (NameForIndex)
      {
        signed int v11 = (__CFString *)NameForIndex;
        if (CFStringGetCharacterAtIndex(NameForIndex, 0LL) == 80)
        {
          if (byte_10007CB30)
          {
            uint64_t v12 = (os_log_s *)qword_10007CF50;
            if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = v17;
              __int128 v19 = v11;
              __int16 v20 = 2048;
              double v21 = v9;
              _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "<Notice> LSController: %@, fraction %f",  buf,  0x16u);
            }
          }

          int v13 = objc_msgSend( -[__CFString substringFromIndex:](v11, "substringFromIndex:", 1, v17),  "intValue");
          unsigned int v14 = v13 & ~(v13 >> 31);
          if (v14 >= 0xF) {
            unsigned int v14 = 15;
          }
          float v15 = v9;
          *(float *)(*(void *)(a1 + 32) + 4LL * v14 + 296) = v15;
        }
      }
    }

    uint64_t v7 = (v7 + 1);
  }

  while (v6 != (_DWORD)v7);
  return 0LL;
}

NSDictionary *sub_10002FEC4(uint64_t a1)
{
  v3[0] = @"ECore_Die_Temp_Target";
  v4[0] = +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(*(void *)(a1 + 32) + 24) dieTempTarget]);
  v3[1] = @"PCore_Die_Temp_Target";
  v4[1] = +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(*(void *)(a1 + 32) + 32) dieTempTarget]);
  _DWORD v3[2] = @"GCore_Die_Temp_Target";
  v4[2] = +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(*(void *)(a1 + 32) + 40) dieTempTarget]);
  v3[3] = @"ECore_Die_Temp_Delta";
  v4[3] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3[4] = @"PCore_Die_Temp_Delta";
  v4[4] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3[5] = @"GCore_Die_Temp_Delta";
  void v4[5] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48));
  void v3[6] = @"Fast_Die_Engaged";
  void v4[6] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 52));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL);
}

void sub_1000300B8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_1000300CC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void sub_1000300F8(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose((const void *)(v9 - 48), 8) = a1;
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

LABEL_52:
    ++v41;
  }

  while (v41 != 4);
  __int128 v5 = v126;
LABEL_56:
  uint64_t v52 = -[ThermalLevelCC initWithProduct:](objc_alloc(&OBJC_CLASS___ThermalLevelCC), "initWithProduct:", v4);
  [*((id *)v4 + 2) addObject:v52];

  uint64_t v53 = (const __CFDictionary *)[a3 getConfigurationFor:@"refreshRateComponentControl"];
  if (v53)
  {
    uint64_t v54 = v53;
    CFBooleanRef Value = CFDictionaryGetValue(v53, @"RefreshRate");
    if (Value)
    {
      uint64_t v56 = Value;
      double v57 = -[RefreshRateCC initWithParams:](objc_alloc(&OBJC_CLASS___RefreshRateCC), "initWithParams:", v54);
      -[RefreshRateCC initRefreshRateTable:](v57, "initRefreshRateTable:", v56);
      [*((id *)v4 + 2) addObject:v57];
    }
  }

  double v58 = [a3 getConfigurationFor:@"fanComponentControl"];
  if (v58)
  {
    size_t v59 = -[FanCC initWithParams:](objc_alloc(&OBJC_CLASS___FanCC), "initWithParams:", v58);
    [*((id *)v4 + 2) addObject:v59];
  }

  uint64_t v60 = [a3 getConfigurationFor:@"wifiComponentControl"];
  if (v60)
  {
    uint64_t v61 = -[WiFiCC initWithParams:](objc_alloc(&OBJC_CLASS___WiFiCC), "initWithParams:", v60);
    [*((id *)v4 + 2) addObject:v61];
  }

  __int16 v62 = [a3 getConfigurationFor:@"audioAmpComponentControl"];
  if (v62)
  {
    v63 = -[AudioAmpCC initWithParams:](objc_alloc(&OBJC_CLASS___AudioAmpCC), "initWithParams:", v62);
    [*((id *)v4 + 2) addObject:v63];
  }

  v64 = (const __CFDictionary *)[a3 getConfigurationFor:@"arcComponentControl"];
  if (v64)
  {
    CFBooleanRef v65 = v64;
    v66 = sub_100020F54(v64, @"usesArcPowerCC");
    int v67 = off_100060488;
    if (v66) {
      int v67 = &off_100060490;
    }
    v68 = [objc_alloc(*v67) initWithParams:v65 product:v4];
    [*((id *)v4 + 2) addObject:v68];
  }

  v69 = [a3 getConfigurationFor:@"speakerComponentControl"];
  if (v69)
  {
    uint64_t v70 = -[SpeakerCC initWithParams:](objc_alloc(&OBJC_CLASS___SpeakerCC), "initWithParams:", v69);
    [*((id *)v4 + 2) addObject:v70];
  }

  [v4 registerDisplayNotification];
  [v4 registerChargerNotification];
  if (!sub_100020F54(v8, @"noChargingControl"))
  {
    if (sub_100020F54(v8, @"usesLinkCharger"))
    {
      v71 = [a3 getConfigurationFor:@"linkChargerComponentControl"];
      v72 = &OBJC_CLASS___LinkChargerCC;
      goto LABEL_76;
    }

    CFTypeID v73 = [a3 getConfigurationFor:@"powerSourceComponentControl"];
    if (v73)
    {
      v71 = v73;
      v72 = &OBJC_CLASS___PowerSourceCC;
LABEL_76:
      v74 = [[v72 alloc] initWithParams:v71];
      [*((id *)v4 + 2) addObject:v74];
    }
  }

  v75 = (const __CFArray *)[a3 getConfigurationFor:@"Sensors"];
  *((_DWORD *)v4 + 42) = CFArrayGetCount(v75);
  -[HidSensors loadProductTemperatureParameters:]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "loadProductTemperatureParameters:",  v75);
  CFNumberRef v76 = (const __CFArray *)[a3 getConfigurationFor:@"powerSensors"];
  if (v76)
  {
    CFBooleanRef v77 = v76;
    if (CFArrayGetCount(v76) >= 1)
    {
      *((_DWORD *)v4 + 43) = CFArrayGetCount(v77);
      -[HidSensors loadProductPowerParameters:]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "loadProductPowerParameters:",  v77);
    }
  }

  CFBooleanRef v78 = [v4 sensorIndexFromList:v75 fourCharCode:@"TP0Z"];
  *((_DWORD *)v4 + _Block_object_dispose((const void *)(v9 - 48), 8) = v78;
  if (v78 == -1 && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003EFFC();
  }
  if (sub_100020FE0(v8, @"requiredCalibrationResistorSamples", kCFNumberIntType, v5))
  {
    if (byte_10007CB30)
    {
      CFBooleanRef v79 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        CFBooleanRef v80 = *v5;
        *(_DWORD *)__int128 buf = 67109120;
        LODWORD(v131) = v80;
        _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEFAULT,  "<Notice> Required Tcal samples: %d",  buf,  8u);
      }
    }
  }

  byte_10007CF58 = sub_100020F54(v8, @"hasInternalSensorFiltering");
  CFBooleanRef v81 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_DEFAULT,  "<Notice> Has internally filtered sensors",  buf,  2u);
  }

  *((void *)v4 + 26) = [v4 copyDieTempSensorIndexSetForFourthChar:97 sensors:v75 filteredOnly:0];
  *((void *)v4 + 25) = [v4 copyDieTempSensorIndexSetForFourthChar:120 sensors:v75 filteredOnly:0];
  if (byte_10007CF58)
  {
    CFBooleanRef v82 = 97LL;
    CFBooleanRef v83 = v75;
    v84 = 1LL;
  }

  else
  {
    CFBooleanRef v82 = 102LL;
    CFBooleanRef v83 = v75;
    v84 = 0LL;
  }

  *((void *)v4 + 27) = [v4 copyDieTempSensorIndexSetForFourthChar:v82 sensors:v83 filteredOnly:v84];
  if (byte_10007CB30)
  {
    v85 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      v86 = *((void *)v4 + 26);
      *(_DWORD *)__int128 buf = 138412290;
      v131 = v86;
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "<Notice> avg die: %@", buf, 0xCu);
      if (byte_10007CB30)
      {
        v85 = (os_log_s *)qword_10007CF50;
        goto LABEL_96;
      }
    }

    else
    {
LABEL_96:
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        v87 = *((void *)v4 + 25);
        *(_DWORD *)__int128 buf = 138412290;
        v131 = v87;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "<Notice> max die: %@", buf, 0xCu);
        v88 = byte_10007CB30;
      }

      else
      {
        v88 = 1;
      }

      CFTypeID v89 = *((void *)v4 + 27);
      if (v89)
      {
        if (v88)
        {
          v90 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            v131 = v89;
            _os_log_impl( (void *)&_mh_execute_header,  v90,  OS_LOG_TYPE_DEFAULT,  "<Notice> filtered average die: %@",  buf,  0xCu);
          }
        }
      }
    }
  }

  *((void *)v4 + 22) = 0LL;
  if (CFArrayGetCount(v75) >= 1)
  {
    v91 = 0LL;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v75, v91);
      int v93 = CFDictionaryGetValue(ValueAtIndex, @"4CharCode");
      ++v91;
    }

    while (CFArrayGetCount(v75) > v91);
  }

  CFDictionaryRef v94 = (const __CFArray *)[v4 copyHotspotsArray:a3];
  if (v94)
  {
    v95 = v94;
    int Count = CFArrayGetCount(v94);
    if (Count >= 1)
    {
      v97 = Count;
      for (CFIndex i = 0LL; i != v97; ++i)
      {
        v99 = -[SupervisorControl initWithMitigationType:paramInfo:]( objc_alloc(&OBJC_CLASS___SupervisorControl),  "initWithMitigationType:paramInfo:",  (i + 18),  CFArrayGetValueAtIndex(v95, i));
        [*((id *)v4 + 3) addObject:v99];
      }
    }

    CFRelease(v95);
  }

  *(_DWORD *)__int128 buf = 0;
  sub_100020FE0(v8, @"solarContextType", kCFNumberIntType, buf);
  if ((*(_DWORD *)buf - 1) < 2)
  {
    -[ContextAwareThermalManager createNewSolarContext:]( +[ContextAwareThermalManager sharedInstance](&OBJC_CLASS___ContextAwareThermalManager, "sharedInstance"),  "createNewSolarContext:",  0LL);
    if (*(_DWORD *)buf != 2)
    {
      int v100 = 1LL;
      goto LABEL_123;
    }

    goto LABEL_119;
  }

  if ((*(_DWORD *)buf - 3) < 2)
  {
    int v100 = 1LL;
    -[ContextAwareThermalManager createNewSolarContext:]( +[ContextAwareThermalManager sharedInstance](&OBJC_CLASS___ContextAwareThermalManager, "sharedInstance"),  "createNewSolarContext:",  1LL);
    if (*(_DWORD *)buf != 4)
    {
LABEL_123:
      objc_msgSend(objc_msgSend(v4, "findComponent:", 0), "setSolarDetectorPresent:", v100);
      goto LABEL_124;
    }

LABEL_119:
    int v100 = 1LL;
    objc_msgSend(objc_msgSend(v4, "findComponent:", 0), "setSolarBehaviorSuppressed:", 1);
    goto LABEL_123;
  }

  int v100 = 0LL;
  if (!*(_DWORD *)buf) {
    goto LABEL_123;
  }
LABEL_124:
  v4[105] = *(_DWORD *)buf == 0;
  if (sub_100020F54(v8, @"shouldDispatchVirtualTemp"))
  {
    -[HidSensors enableDispatchVirtualTemp]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "enableDispatchVirtualTemp");
    -[HidSensors initLocationStrings]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "initLocationStrings");
  }

  if (sub_100020F54(v8, @"enableSending2DTempGridToDisplayDriver")) {
    -[HidSensors enableSending2DTempGridToDisplayDriver]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "enableSending2DTempGridToDisplayDriver");
  }
  if (sub_100020F54(v8, @"enableSendingMaxTempToDisplayDriver")) {
    [v4 enableSendingMaxTempToDisplayDriver];
  }
  v4[104] = sub_100020F54(v8, @"canForceThermalLevels");
  *((void *)v4 + 6) = -[TableDrivenDecisionTree initWithComponentControllers:hotspotControllers:decisionTreeTable:]( [TableDrivenDecisionTree alloc],  "initWithComponentControllers:hotspotControllers:decisionTreeTable:",  *((void *)v4 + 2),  *((void *)v4 + 3),  [a3 getConfigurationFor:@"DecisionTreeTable"]);
  if (sub_100020F54(v8, @"monitorsCameraSensors"))
  {
    int v101 = [v4 sensorIndexFromList:v75 fourCharCode:@"SS0F"];
    int v102 = [v4 sensorIndexFromList:v75 fourCharCode:@"SS0C"];
    if ((_DWORD)v101 == -1) {
      int v101 = [v4 sensorIndexFromList:v75 fourCharCode:@"TK0F"];
    }
    if ((_DWORD)v102 == -1)
    {
      int v102 = [v4 sensorIndexFromList:v75 fourCharCode:@"TK0C"];
    }

    else
    {
LABEL_137:
      if ((v102 & 0x80000000) == 0)
      {
        *((void *)v4 + 12) = -[CameraTS initWithFrontCameraSensorIdx:rearCameraSensorIdx:]( objc_alloc(&OBJC_CLASS___CameraTS),  "initWithFrontCameraSensorIdx:rearCameraSensorIdx:",  v101,  v102);
        v103 = [v4 sensorIndexFromList:v75 fourCharCode:@"TK1F"];
        v104 = [v4 sensorIndexFromList:v75 fourCharCode:@"TK2F"];
        v105 = [v4 sensorIndexFromList:v75 fourCharCode:@"TK3F"];
        __int128 v106 = [v4 sensorIndexFromList:v75 fourCharCode:@"TK1C"];
        uint64_t v107 = [v4 sensorIndexFromList:v75 fourCharCode:@"TK2C"];
        v108 = [v4 sensorIndexFromList:v75 fourCharCode:@"TK3C"];
        goto LABEL_152;
      }
    }

LABEL_150:
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003EFD0();
    }
  }

LABEL_152:
  if (sub_100020F54(v8, @"needsLifetimeServo"))
  {
    v109 = [a3 getConfigurationFor:@"lifetimeServoParams"];
    if (v109 && (v110 = v109, v111 = CFGetTypeID(v109), v111 == CFDictionaryGetTypeID()))
    {
      *((void *)v4 + 2_Block_object_dispose((const void *)(v9 - 48), 8) = -[LifetimeServoController initWithParams:sensorList:]( objc_alloc(&OBJC_CLASS___LifetimeServoController),  "initWithParams:sensorList:",  v110,  v75);
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003EFA4();
    }
  }

  else
  {
    *((void *)v4 + 2_Block_object_dispose((const void *)(v9 - 48), 8) = 0LL;
    if (sub_100020F54(v8, @"needsLTSStatePersistence")) {
      *((void *)v4 + 29) = -[LifetimeServoStatePersistence initWithParams:]( [LifetimeServoStatePersistence alloc],  "initWithParams:",  [a3 getConfigurationFor:@"LTSStatePersistencePerIpRevision"]);
    }
    else {
      *((void *)v4 + 29) = 0LL;
    }
  }

  v4[106] = sub_100020F54(v8, @"needsAppleConnectThermalTrapLogging");
  if (sub_100020F54(v8, @"needsContextualClamp"))
  {
    v112 = [a3 getConfigurationFor:@"contextualClampParams"];
    if (v112 && (v113 = v112, v114 = CFGetTypeID(v112), v114 == CFDictionaryGetTypeID()))
    {
      *((void *)v4 + 15) = -[ContextualClampController initWithParams:backlightController:product:]( [ContextualClampController alloc],  "initWithParams:backlightController:product:",  v113,  [v4 findComponent:0],  v4);
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003EF78();
    }
  }

  else
  {
    *((void *)v4 + 15) = 0LL;
  }

  if (sub_100020F54(v8, @"needsArcControl"))
  {
    v115 = [a3 getConfigurationFor:@"arcControlParams"];
    if (v115 && (v116 = v115, v117 = CFGetTypeID(v115), v117 == CFDictionaryGetTypeID()))
    {
      *((void *)v4 + 16) = -[ArcController initWithParams:product:]( objc_alloc(&OBJC_CLASS___ArcController),  "initWithParams:product:",  v116,  v4);
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003EF4C();
    }
  }

  else
  {
    *((void *)v4 + 16) = 0LL;
  }

  *(void *)(v4 + 10_Block_object_dispose((const void *)(v9 - 48), 8) = 0xB0000000ALL;
  sub_100020FE0(v8, @"forcedThermalLevelLower", kCFNumberIntType, v4 + 108);
  sub_100020FE0(v8, @"forcedThermalLevelUpper", kCFNumberIntType, v4 + 112);
  v118 = [a3 getConfigurationFor:@"lowTempMitigationLimits"];
  *((void *)v4 + 20) = v118;
  if (v118)
  {
    [v4 registerDefaultsDomain];
    [*((id *)v4 + 33) addObserver:v4 forKeyPath:@"ppmSimulationMode" options:1 context:v4];
  }

  v119 = [a3 getConfigurationFor:@"thermalMitigationLimits"];
  *((void *)v4 + 19) = v119;
  if (v119 || byte_10007CB31)
  {
    [v4 registerDefaultsDomain];
    [*((id *)v4 + 33) setObject:0 forKey:@"thermalSimulationMode"];
    [*((id *)v4 + 33) synchronize];
    [*((id *)v4 + 33) addObserver:v4 forKeyPath:@"thermalSimulationMode" options:1 context:v4];
  }

  byte_10007D4D9 = 0;
  [v4 registerDefaultsDomain];
  [*((id *)v4 + 33) addObserver:v4 forKeyPath:@"watchdogUpdates" options:1 context:v4];
  byte_10007D4DA = sub_100020F54(v8, @"needsPowerZoneTelemetry");
  +[PowerZoneTelemetry sharedInstance](&OBJC_CLASS___PowerZoneTelemetry, "sharedInstance");
  *((_DWORD *)v4 + 22) = 1;
  sub_100020FE0(v8, @"moderatePressureVersion", kCFNumberIntType, v4 + 88);
  -[CPMSHelper setProduct:](+[CPMSHelper sharedInstance](&OBJC_CLASS___CPMSHelper, "sharedInstance"), "setProduct:", v4);
  return v4;
}

NSUserDefaults *sub_1000327C8(uint64_t a1)
{
  id result = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.cltm");
  *(void *)(*(void *)(a1 + 32) + 264LL) = result;
  return result;
}

void sub_1000333FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_100033418(uint64_t a1, int a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  uint64_t state64 = 0LL;
  notify_get_state(a2, &state64);
  return [Weak setIsBackLightOn:state64 != 0];
}

void sub_100033514( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100033530(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  id v2 = IOPSCopyExternalPowerAdapterDetails();
  if (!v2)
  {
    uint64_t v5 = 0LL;
    goto LABEL_10;
  }

  id v3 = v2;
  if (!CFDictionaryContainsKey(v2, @"FamilyCode"))
  {
LABEL_8:
    uint64_t v5 = 0LL;
    goto LABEL_9;
  }

  CFBooleanRef Value = CFDictionaryGetValue(v3, @"FamilyCode");
  uint64_t v5 = (uint64_t)Value;
  if (Value)
  {
    CFTypeID v6 = CFGetTypeID(Value);
    if (v6 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)v5, kCFNumberIntType, &valuePtr);
      else {
        uint64_t v5 = *((unsigned int *)&unk_100048500 + valuePtr + 536723455);
      }
      goto LABEL_9;
    }

    goto LABEL_8;
  }

void sub_100034618(id a1)
{
  byte_10007CAF4 = MGGetBoolAnswer(@"apple-internal-install");
}

LABEL_29:
        CFRelease(v4);
        goto LABEL_30;
      }
    }
  }

  if (byte_10007CB30)
  {
    unsigned int v14 = (os_log_s *)qword_10007CF50;
    __int128 v18 = 0;
    if (!os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<Notice> no FContext key", buf, 2u);
  }

void sub_100035768(id a1)
{
  qword_10007CB08 = objc_alloc_init(&OBJC_CLASS___SensorDispatcherHelper);
}

void sub_100035C58(void *a1, io_iterator_t iterator)
{
  if (a1)
  {
    io_object_t v4 = IOIteratorNext(iterator);
    if (v4)
    {
      io_object_t v5 = v4;
      do
      {
        [a1 updateKeyboardState];
        IOObjectRelease(v5);
        io_object_t v5 = IOIteratorNext(iterator);
      }

      while (v5);
    }
  }

  else
  {
    CFTypeID v6 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003F380(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }

id sub_100036248(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id result = (id)IOHIDEventGetType(a4);
  if ((_DWORD)result == 3)
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue(a4, 196608LL);
    id result = (id)IOHIDEventGetIntegerValue(a4, 196609LL);
    if (IntegerValue == 65289 && result == (id)17) {
      return objc_msgSend(a1, "updateFolioState:", IOHIDEventGetIntegerValue(a4, 196610) == 1);
    }
  }

  return result;
}

LABEL_22:
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      sub_10003F718(&v31, v32);
    }
LABEL_24:
    ++v5;
  }

  while (v5 != 17);
  self->_maxLoadIndexTable = (NSArray *)-[NSMutableArray copy](v4, "copy");
}

void sub_100038260(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "<Error> Bad camera sensor index %d",  (uint8_t *)v2,  8u);
}

void sub_1000382D4()
{
}

void sub_100038304(_BYTE *a1, _BYTE *a2)
{
}

void sub_100038330()
{
}

void sub_100038360()
{
}

void sub_100038390(_BYTE *a1, _BYTE *a2)
{
}

void sub_1000383BC(_BYTE *a1, _BYTE *a2)
{
}

void sub_1000383E8(_BYTE *a1, _BYTE *a2)
{
}

void sub_100038414(_BYTE *a1, _BYTE *a2)
{
}

void sub_100038440()
{
}

void sub_100038470(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  io_object_t v4 = "AppleVTempDispatcher";
  sub_10000834C((void *)&_mh_execute_header, a1, a3, "<Error> Cannot find %s service", (uint8_t *)&v3);
  sub_10000837C();
}

void sub_1000384E4(mach_error_t a1, os_log_s *a2)
{
  int v4 = 136315138;
  io_object_t v5 = mach_error_string(a1);
  sub_10000834C((void *)&_mh_execute_header, a2, v3, "<Error> Could not send temperature %s", (uint8_t *)&v4);
}

void sub_100038564(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[HidSensors indexForTempSensorKey:]";
  sub_10000834C((void *)&_mh_execute_header, a3, (uint64_t)a3, "<Error> %s: null service", a1);
}

void sub_1000385A8(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[HidSensors indexForTempSensorKey:]";
  sub_10000834C((void *)&_mh_execute_header, a3, (uint64_t)a3, "<Error> %s: key not found", a1);
}

void sub_1000385EC(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  int v4 = "-[HidSensors temperatureForKey:]";
  sub_10000834C((void *)&_mh_execute_header, a1, a3, "<Error> %s: null service", (uint8_t *)&v3);
  sub_10000837C();
}

void sub_100038660(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  int v4 = "-[HidSensors temperatureForKey:]";
  sub_10000834C((void *)&_mh_execute_header, a1, a3, "<Error> %s: null event", (uint8_t *)&v3);
  sub_10000837C();
}

void sub_1000386D4(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  int v4 = "-[HidSensors temperatureForKey:]";
  sub_10000834C((void *)&_mh_execute_header, a1, a3, "<Error> %s: key not found", (uint8_t *)&v3);
  sub_10000837C();
}

void sub_100038748(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 134217984;
  uint64_t v4 = a1;
  sub_10000834C((void *)&_mh_execute_header, a2, a3, "<Error> Bad sensor index: %ld", (uint8_t *)&v3);
  sub_10000837C();
}

void sub_1000387B0(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "<Error> sensor: %@, value = %d out of bounds",  (uint8_t *)&v3,  0x12u);
  sub_10000837C();
}

void sub_100038830()
{
}

void sub_100038860()
{
}

void sub_100038890()
{
}

void sub_1000388C0()
{
}

void sub_1000388F0()
{
}

void sub_100038920(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 5;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "<Error> no HID services (%d)",  (uint8_t *)v1,  8u);
  sub_100008368();
}

void sub_100038998( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000389C8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000389F8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038A28(_BYTE *a1, _BYTE *a2)
{
}

void sub_100038A50(_BYTE *a1, _BYTE *a2)
{
}

void sub_100038A78(_BYTE *a1, _BYTE *a2)
{
}

void sub_100038AA0(_BYTE *a1, _BYTE *a2)
{
}

void sub_100038AC8(_BYTE *a1, _BYTE *a2)
{
}

void sub_100038AF0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038B58( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038BC0()
{
  int v0 = sub_10000B1B0();
  SCErrorString(v0);
  sub_10000B1B8();
  sub_10000B190( (void *)&_mh_execute_header,  v1,  v2,  "<Error> SCPreferencesCommitChanges() failed: %s",  v3,  v4,  v5,  v6,  v7);
  sub_10000B1A4();
}

void sub_100038C2C()
{
}

void sub_100038C58()
{
}

void sub_100038C84()
{
}

void sub_100038CB0()
{
}

void sub_100038CDC()
{
}

void sub_100038D08(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 4;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "<Error> no HID services (%d)",  (uint8_t *)v1,  8u);
  sub_100008368();
}

void sub_100038D80()
{
}

void sub_100038DAC()
{
}

void sub_100038DD8()
{
}

void sub_100038E04()
{
}

void sub_100038E30()
{
}

void sub_100038E5C()
{
}

void sub_100038E88()
{
}

void sub_100038EB4()
{
}

void sub_100038EE0(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *__int128 buf = 0;
  *a2 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "<Error> notify_register_check failed",  buf,  2u);
}

void sub_100038F1C()
{
}

void sub_100038F48()
{
}

void sub_100038F74()
{
}

void sub_100038FA0()
{
}

void sub_100038FCC()
{
}

void sub_100038FF8()
{
}

void sub_100039024()
{
}

void sub_100039050()
{
}

void sub_10003907C()
{
}

void sub_1000390A8()
{
}

void sub_1000390D4()
{
}

void sub_100039100()
{
}

void sub_10003912C()
{
}

void sub_100039158()
{
}

void sub_100039184()
{
}

void sub_1000391B0()
{
}

void sub_1000391DC()
{
}

void sub_100039208()
{
}

void sub_100039234()
{
}

void sub_100039260()
{
}

void sub_10003928C()
{
}

void sub_1000392B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039328( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039358( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000393BC(int a1, os_log_s *a2)
{
  uint64_t v2 = &byte_100061190[24 * a1];
  int v3 = *v2;
  uint64_t v4 = *((void *)v2 + 1);
  v5[0] = 67109634;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = a1;
  __int16 v8 = 2080;
  uint64_t v9 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "<Error> Cannot add mitigations for supported clientID: %u of mitigation type: %u (%s)",  (uint8_t *)v5,  0x18u);
  sub_10000837C();
}

void sub_10003945C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000394C0()
{
}

void sub_100039530()
{
}

void sub_1000395A0()
{
  int v3 = 134218242;
  uint64_t v4 = v0;
  __int16 v5 = 2080;
  uint64_t v6 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "<Error> Client id: %llu is invalid for client name:%s",  (uint8_t *)&v3,  0x16u);
  sub_10000837C();
}

void sub_10003962C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000E558((void *)&_mh_execute_header, a2, a3, "<Error> Unexpected return value 0x%08x\n", a5, a6, a7, a8, 0);
  sub_100008368();
}

void sub_100039690(int a1, os_log_s *a2)
{
  v2[0] = 67109376;
  v2[1] = 4;
  __int16 v3 = 1024;
  int v4 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "<Error> called with unexpected number of arguments. Expected %d, received %d\n",  (uint8_t *)v2,  0xEu);
  sub_10000837C();
}

void sub_100039710()
{
  int v3 = 136315394;
  uint64_t v4 = v0;
  __int16 v5 = 1024;
  int v6 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "<Error> Could not get CPMS client state for clientID %s. Error code 0x%x",  (uint8_t *)&v3,  0x12u);
  sub_10000837C();
}

void sub_10003979C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000397CC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000397FC(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "<Error> CC: Failed to find pmu power source",  v1,  2u);
}

void sub_10003983C(int a1, os_log_s *a2)
{
  int v2 = 136315394;
  int v3 = "-[LinkChargerCC updateCloakingState:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "<Error> %s: IORegistryEntrySetCFProperties(0x%08x)\n",  (uint8_t *)&v2,  0x12u);
}

void sub_1000398C4(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "<Error> Error creating WiFiManager client",  v1,  2u);
}

void sub_100039904(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "<Error> Read a bad maxLI value from the WiFi Manager %d",  (uint8_t *)v2,  8u);
}

void sub_100039978(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> getTGraphData: invalid key", v1, 2u);
}

void sub_1000399B8(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[TGraphSampler genTGraphData]";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "<Error> %s: could not create fieldValues array",  (uint8_t *)&v1,  0xCu);
}

void sub_100039A38(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "<Error> Error in getting cpu statistics",  v1,  2u);
}

void sub_100039A78(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[CpuPiecewiseCC initWithParams:listID:needspowerZones:]";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "<Error> %s: data array size mismatch",  (uint8_t *)&v1,  0xCu);
}

void sub_100039AF8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039B68()
{
}

void sub_100039B94( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039C04( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039C74(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 136315394;
  uint64_t v4 = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%s Mitigation State %d\n",  (uint8_t *)&v3,  0x12u);
  sub_10000837C();
}

void sub_100039CFC(uint64_t a1)
{
}

void sub_100039D98(uint64_t a1, os_log_s *a2)
{
  id v3 = [*(id *)(*(void *)(*(void *)a1 + 8) + 40) mitigationState];
  int v4 = 136315650;
  __int16 v5 = "-[AgingController initWithParams:currentWRa:currentUPOCount:]_block_invoke";
  __int16 v6 = 2048;
  uint64_t v7 = 1LL;
  __int16 v8 = 2048;
  id v9 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  " %s <Error> Inconsistent mitigation state. Expected %lu, found %lu\n",  (uint8_t *)&v4,  0x20u);
}

void sub_100039E4C(int a1, os_log_s *a2)
{
  int v2 = 136315394;
  id v3 = "-[AgingController takeActionOnUPO:forWRa:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s <Error> Weighted Ra %d is not a valid value. Returning early\n",  (uint8_t *)&v2,  0x12u);
  sub_10000837C();
}

void sub_100039ED0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039F34(int *a1, int a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Current WRa %d less than threshold %d. Skipping UPO\n",  (uint8_t *)v4,  0xEu);
  sub_10000837C();
}

void sub_100039FB8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003A01C(int a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "<Error> Saved upo count %d > new UPO Count %d. Resetting state\n",  (uint8_t *)v3,  0xEu);
  sub_10000837C();
}

void sub_10003A09C(void *a1)
{
}

void sub_10003A11C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003A18C(void *a1)
{
}

void sub_10003A218()
{
}

void sub_10003A244()
{
}

void sub_10003A270( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003A2D8()
{
}

void sub_10003A304()
{
}

void sub_10003A330()
{
}

void sub_10003A35C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003A3CC()
{
}

void sub_10003A3F8()
{
}

void sub_10003A424(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_100008340((void *)&_mh_execute_header, a1, a3, "<Error> LifetimeServoAFLUT cannot hold all data columns", v3);
}

void sub_10003A45C(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100008340((void *)&_mh_execute_header, a3, (uint64_t)a3, "<Error> LifetimeServoAFLUT data improperly sorted", a1);
}

void sub_10003A490(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "<Error> Required power parameters missing!",  v1,  2u);
}

void sub_10003A4D0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "<Error> ArcPowerCC invalid parameters",  v1,  2u);
}

void sub_10003A510()
{
}

void sub_10003A53C()
{
}

void sub_10003A568()
{
}

void sub_10003A594()
{
}

void sub_10003A5C0(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_10000834C((void *)&_mh_execute_header, a2, a3, "<Error> could not register for %@", (uint8_t *)&v3);
}

void sub_10003A62C()
{
}

void sub_10003A658(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_10000834C((void *)&_mh_execute_header, a2, a3, "<Error> unknown CT notification: %@", (uint8_t *)&v3);
}

void sub_10003A6C4()
{
}

void sub_10003A6F0(int a1, int __errnum, os_log_s *a3)
{
  if (a1 == 1) {
    uint64_t v4 = strerror(__errnum);
  }
  else {
    uint64_t v4 = mach_error_string(__errnum);
  }
  int v6 = 136315138;
  uint64_t v7 = v4;
  sub_10000834C((void *)&_mh_execute_header, a3, v5, "<Error> CT max Tx power failed: %s", (uint8_t *)&v6);
}

void sub_10003A788()
{
}

void sub_10003A7B4(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[SolarDetectorSemantic init]";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "<Error> %s:: brightnessSystemClient nil",  (uint8_t *)&v1,  0xCu);
}

void sub_10003A834( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003A868( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003A89C(char a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "<Error> Could not create solar context (%d)",  (uint8_t *)v2,  8u);
}

void sub_10003A914(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "<Error> Should not be using Default Action",  v1,  2u);
}

double sub_10003A954(float *a1, os_log_s *a2)
{
  double v2 = *a1;
  int v4 = 134217984;
  double v5 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "<Error> AudioAmpCC: Failed to set the target to %f",  (uint8_t *)&v4,  0xCu);
  return result;
}

void sub_10003A9D0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003AA00( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003AA30( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003AA60( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003AA90( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003AAC0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003AB24( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003AB88(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "<Error> Unable to find sensor group for key %@",  (uint8_t *)&v2,  0xCu);
  sub_10000837C();
}

void sub_10003ABF8()
{
}

void sub_10003AC58()
{
}

void sub_10003ACB8()
{
}

void sub_10003ACE4(int a1, os_log_s *a2, uint64_t a3)
{
  v3[0] = 67109376;
  v3[1] = dword_10007C644;
  __int16 v4 = 1024;
  int v5 = a1;
  sub_10001DCB0((void *)&_mh_execute_header, a2, a3, "<Error> IOPMAssertionRelease(0x%08x) failed: %d", (uint8_t *)v3);
}

void sub_10003AD64(int *a1, int a2, os_log_s *a3)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  sub_10001DCB0( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "<Error> Setting CTServerConnectionConfigMaxRadioPower Tech %d level %d\n",  (uint8_t *)v4);
}

void sub_10003ADE4(int a1, int __errnum)
{
  if (a1 == 1) {
    strerror(__errnum);
  }
  else {
    mach_error_string(__errnum);
  }
  sub_10000B1B8();
  sub_10000B190( (void *)&_mh_execute_header,  v2,  v3,  "<Error> CTServerConnectionConfigMaxRadioPower() failed: %s",  v4,  v5,  v6,  v7,  v8);
  sub_10000B1A4();
}

void sub_10003AE68()
{
}

void sub_10003AE94()
{
}

void sub_10003AEC0()
{
}

void sub_10003AEEC()
{
  uint64_t v0 = sub_10001DCBC();
  sub_10001DCA8(v0);
  sub_10000B1B8();
  sub_10000B190((void *)&_mh_execute_header, v1, v2, "<Error> tGraph open: %s", v3, v4, v5, v6, v7);
  sub_10000B1A4();
}

void sub_10003AF58()
{
  uint64_t v0 = sub_10001DCBC();
  sub_10001DCA8(v0);
  sub_10000B1B8();
  sub_10000B190((void *)&_mh_execute_header, v1, v2, "<Error> tGraph fstat: %s", v3, v4, v5, v6, v7);
  sub_10000B1A4();
}

void sub_10003AFC4()
{
}

void sub_10003AFF0()
{
  uint64_t v0 = sub_10001DCBC();
  sub_10001DCA8(v0);
  sub_10000B1B8();
  sub_10000B190((void *)&_mh_execute_header, v1, v2, "<Error> sysctlbyname(hw.model) failed: %s", v3, v4, v5, v6, v7);
  sub_10000B1A4();
}

void sub_10003B05C()
{
  int v0 = sub_10000B1B0();
  SCErrorString(v0);
  sub_10000B1B8();
  sub_10000B190( (void *)&_mh_execute_header,  v1,  v2,  "<Error> SCPreferencesSetCallBack() failed: %s",  v3,  v4,  v5,  v6,  v7);
  sub_10000B1A4();
}

void sub_10003B0C8()
{
  int v0 = sub_10000B1B0();
  SCErrorString(v0);
  sub_10000B1B8();
  sub_10000B190( (void *)&_mh_execute_header,  v1,  v2,  "<Error> SCPreferencesScheduleWithRunLoop() failed: %s",  v3,  v4,  v5,  v6,  v7);
  sub_10000B1A4();
}

void sub_10003B134()
{
}

void sub_10003B160()
{
}

void sub_10003B18C()
{
}

void sub_10003B1B8()
{
}

void sub_10003B1E4()
{
}

void sub_10003B210(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *__int128 buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "<Error> Failed SetLevel 10 times", buf, 2u);
}

void sub_10003B24C()
{
}

void sub_10003B278( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003B2DC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003B340( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003B3A8()
{
}

void sub_10003B3D4()
{
}

void sub_10003B400()
{
}

void sub_10003B42C()
{
}

void sub_10003B458( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003B4BC()
{
}

void sub_10003B4E8()
{
}

void sub_10003B514()
{
}

void sub_10003B540()
{
}

void sub_10003B56C()
{
}

void sub_10003B598()
{
}

void sub_10003B5C4()
{
}

void sub_10003B5F0()
{
}

void sub_10003B61C(const __CFString *a1, os_log_s *a2)
{
  int v4 = 136315138;
  uint64_t v5 = sub_10002093C(a1);
  sub_10000834C((void *)&_mh_execute_header, a2, v3, "<Error> Failed to read %s", (uint8_t *)&v4);
  sub_10000B1A4();
}

void sub_10003B694()
{
}

void sub_10003B6C0(os_log_s *a1)
{
  int v3 = 136315138;
  uint64_t v4 = sub_10002093C(@"~pkg-power-split-cpu-fraction");
  sub_10000834C((void *)&_mh_execute_header, a1, v2, "<Error> Failed to read %s", (uint8_t *)&v3);
  sub_10000B1A4();
}

void sub_10003B740()
{
}

void sub_10003B76C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "-[MitigationController setPackagePowerBudgetDirect:withDetails:]";
  sub_10000834C( (void *)&_mh_execute_header,  a1,  a3,  "<Error> %s should not be called without CPMS enablement",  (uint8_t *)&v3);
  sub_10000837C();
}

void sub_10003B7E0(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "<Error> Could not set SGX Max power to %d\n",  (uint8_t *)v2,  8u);
  sub_100008368();
}

void sub_10003B850()
{
}

void sub_10003B87C(int *a1, os_log_s *a2, uint64_t a3)
{
  double v3 = (float)*a1;
  int v4 = 134217984;
  double v5 = v3;
  sub_10000834C((void *)&_mh_execute_header, a2, a3, "<Error> Could not set CPU Max power to %f\n", (uint8_t *)&v4);
  sub_10000837C();
}

void sub_10003B8F0(int *a1, os_log_s *a2, uint64_t a3)
{
  double v3 = (float)*a1;
  int v4 = 134217984;
  double v5 = v3;
  sub_10000834C( (void *)&_mh_execute_header,  a2,  a3,  "<Error> Could not set CPU low power target to %f\n",  (uint8_t *)&v4);
  sub_10000837C();
}

void sub_10003B964(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  int v4 = "AppleDieTempController";
  sub_10000834C((void *)&_mh_execute_header, a1, a3, "<Error> Cannot find %s service", (uint8_t *)&v3);
  sub_10000837C();
}

void sub_10003B9D8(uint64_t a1, int *a2, os_log_t log)
{
  int v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "<Error> Could not create number from %@ dithering level %d",  (uint8_t *)&v4,  0x12u);
  sub_10000837C();
}

void sub_10003BA5C(uint64_t a1, mach_error_t error_value, os_log_s *a3)
{
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  int v7 = mach_error_string(error_value);
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "<Error> Could not set %@ dithering level: %s",  (uint8_t *)&v4,  0x16u);
  sub_10000B1A4();
}

void sub_10003BAF0()
{
}

void sub_10003BB58()
{
}

void sub_10003BBC0()
{
}

void sub_10003BC28()
{
}

void sub_10003BC54()
{
}

void sub_10003BC80()
{
}

void sub_10003BCAC()
{
}

void sub_10003BCD8()
{
}

void sub_10003BD38()
{
}

void sub_10003BD98()
{
}

void sub_10003BDF8()
{
}

void sub_10003BE58()
{
}

void sub_10003BEB8()
{
}

void sub_10003BF18()
{
}

void sub_10003BF78()
{
}

void sub_10003BFD8(void *a1, uint64_t a2, os_log_s *a3)
{
  int v5 = 136315650;
  uint8_t v6 = "bytes_from_service";
  __int16 v7 = 2048;
  id v8 = [a1 length];
  __int16 v9 = 2048;
  uint64_t v10 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "<Error> %s: data byte count (%zu) does not match expected (%zu)",  (uint8_t *)&v5,  0x20u);
}

void sub_10003C080()
{
}

void sub_10003C0AC()
{
}

void sub_10003C0D8()
{
}

void sub_10003C104()
{
}

void sub_10003C130()
{
}

void sub_10003C15C(const __CFString *a1, uint64_t a2, os_log_s *a3)
{
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  sub_100023C24((void *)&_mh_execute_header, a3, v5, "<Error> Sensor %s removed (%llx)", v6);
  sub_10000B1A4();
}

void sub_10003C1E8()
{
}

void sub_10003C214()
{
}

void sub_10003C240()
{
}

void sub_10003C26C()
{
}

void sub_10003C298()
{
}

void sub_10003C2C4()
{
}

void sub_10003C2F0()
{
}

void sub_10003C31C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C38C()
{
}

void sub_10003C3EC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C45C()
{
}

void sub_10003C488()
{
}

void sub_10003C4B4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C524()
{
}

void sub_10003C550()
{
}

void sub_10003C57C()
{
}

void sub_10003C5A8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C60C()
{
}

void sub_10003C638()
{
}

void sub_10003C664( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C6D4()
{
}

void sub_10003C700( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C764()
{
  __int16 v3 = 2080;
  uint64_t v4 = v0;
  sub_100023C24((void *)&_mh_execute_header, v1, (uint64_t)v1, "<Error> %s + %s length too long", v2);
  sub_10000837C();
}

void sub_10003C7D8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C848( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C8B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C928()
{
}

void sub_10003C990()
{
}

void sub_10003C9F8(void *a1, uint64_t a2, os_log_s *a3)
{
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  sub_100023C24((void *)&_mh_execute_header, a3, v5, "<Error> Error excluding %@ from backup %@", v6);
  sub_10000B1A4();
}

void sub_10003CA80()
{
}

void sub_10003CAAC()
{
}

void sub_10003CAD8()
{
}

void sub_10003CB04( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003CB38( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003CB6C()
{
}

void sub_10003CB98()
{
}

void sub_10003CBC4()
{
}

void sub_10003CBF0()
{
}

void sub_10003CC1C()
{
}

void sub_10003CC48()
{
}

void sub_10003CC74()
{
}

void sub_10003CCE0()
{
}

void sub_10003CD4C()
{
}

void sub_10003CDB8()
{
}

void sub_10003CE24( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003CE88( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003CEEC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003CF50()
{
}

void sub_10003CF7C()
{
}

void sub_10003CFA8()
{
}

void sub_10003CFD4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D004( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D034( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D064(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "<Error> No properties available for endpoint: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10003D0D8()
{
}

void sub_10003D104()
{
}

void sub_10003D130()
{
}

void sub_10003D15C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "<Error> brightness set %@ failed",  (uint8_t *)&v2,  0xCu);
}

void sub_10003D1D0()
{
}

void sub_10003D1FC()
{
}

void sub_10003D228()
{
}

void sub_10003D254()
{
}

void sub_10003D280()
{
}

void sub_10003D2AC()
{
}

void sub_10003D2D8()
{
}

void sub_10003D304(void *a1)
{
}

void sub_10003D374(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "<Error> Invalid detail string length (%llu) for detail string: %@",  (uint8_t *)&v3,  0x16u);
}

void sub_10003D3F8(void *a1)
{
}

void sub_10003D468(os_log_t log)
{
  int v1 = 134217984;
  unint64_t v2 = 0xBFF0000000000000LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "<Error> Invalid haptic gain value: %f",  (uint8_t *)&v1,  0xCu);
}

void sub_10003D4E4()
{
}

void sub_10003D548()
{
}

void sub_10003D5AC()
{
}

void sub_10003D60C()
{
}

void sub_10003D66C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D6D4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D73C()
{
}

void sub_10003D79C()
{
}

void sub_10003D7C8()
{
}

void sub_10003D7F4()
{
}

void sub_10003D820()
{
}

void sub_10003D84C()
{
}

void sub_10003D8AC()
{
}

void sub_10003D8D8()
{
}

void sub_10003D904()
{
}

void sub_10003D964()
{
}

void sub_10003D990()
{
}

void sub_10003D9BC()
{
}

void sub_10003D9E8()
{
}

void sub_10003DA14()
{
}

void sub_10003DA40()
{
}

void sub_10003DA6C()
{
}

void sub_10003DA98()
{
}

void sub_10003DAC4()
{
}

void sub_10003DAF0()
{
}

void sub_10003DB1C()
{
}

void sub_10003DB48()
{
}

void sub_10003DB74()
{
}

void sub_10003DBA0()
{
}

void sub_10003DBCC()
{
}

void sub_10003DBF8()
{
}

void sub_10003DC24()
{
}

void sub_10003DC84()
{
}

void sub_10003DCB0()
{
}

void sub_10003DCDC()
{
}

void sub_10003DD08()
{
}

void sub_10003DD68()
{
}

void sub_10003DD94()
{
}

void sub_10003DDC0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003DE30()
{
}

void sub_10003DE5C()
{
}

void sub_10003DE88()
{
}

void sub_10003DEB4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003DF24()
{
}

void sub_10003DF84(const __CFData *a1, uint64_t a2, os_log_s *a3)
{
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "<Error> Unexpected data size %ld bytes for key %@\n",  v5,  0x16u);
}

void sub_10003E018()
{
}

void sub_10003E078()
{
}

void sub_10003E0D8()
{
}

void sub_10003E104()
{
}

void sub_10003E130()
{
}

void sub_10003E190()
{
}

void sub_10003E1BC()
{
}

void sub_10003E1E8()
{
}

void sub_10003E214()
{
}

void sub_10003E240()
{
}

void sub_10003E26C()
{
}

void sub_10003E298()
{
}

void sub_10003E2C4()
{
}

void sub_10003E2F0()
{
}

void sub_10003E31C()
{
}

void sub_10003E348()
{
}

void sub_10003E374()
{
}

void sub_10003E3A0()
{
  __int16 v3 = v0;
  int v4 = 16;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "<Error> LSControlLoop %d: perf state count %d, max %d",  v2,  0x14u);
  sub_10000837C();
}

void sub_10003E420()
{
}

void sub_10003E484()
{
}

void sub_10003E4E4()
{
}

void sub_10003E548()
{
}

void sub_10003E5AC()
{
}

void sub_10003E60C()
{
}

void sub_10003E670()
{
}

void sub_10003E6D4()
{
}

void sub_10003E700()
{
}

void sub_10003E760()
{
}

void sub_10003E78C()
{
}

void sub_10003E7B8()
{
}

void sub_10003E7E4()
{
}

void sub_10003E810()
{
}

void sub_10003E83C()
{
  WORD2(sub_10001968C( (void *)&_mh_execute_header,  v0,  v1,  "<Error> LSControlLoop %d: no voltage for state %d residency",  v2, v3) = 2048;
  HIWORD(sub_10001968C( (void *)&_mh_execute_header,  v0,  v1,  "<Error> LSControlLoop %d: no voltage for state %d residency",  v2, v3) = v0;
  sub_1000300CC((void *)&_mh_execute_header, v0, v1, "<Error> LSController: NULL dict for %s (ID %lld)", v2, v3);
  sub_10000837C();
}

void sub_10003E8A8()
{
}

void sub_10003E8D4()
{
}

void sub_10003E900()
{
}

void sub_10003E92C()
{
}

void sub_10003E958()
{
}

void sub_10003E9B8()
{
}

void sub_10003EA18()
{
}

void sub_10003EA78()
{
}

void sub_10003EAD8()
{
}

void sub_10003EB38()
{
}

void sub_10003EB64()
{
}

void sub_10003EB90()
{
  sub_1000300B8((void *)&_mh_execute_header, v0, v1, "<Error> LSController: setting %@ returned %x");
  sub_10000837C();
}

void sub_10003EBFC()
{
}

void sub_10003EC60()
{
}

void sub_10003ECC4()
{
}

void sub_10003ECF0()
{
}

void sub_10003ED1C()
{
}

void sub_10003ED48()
{
}

void sub_10003ED74()
{
}

void sub_10003EDA0()
{
}

void sub_10003EDCC(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "<Error> Could not create number from charge rate index %d",  (uint8_t *)v3,  8u);
  sub_100008368();
}

void sub_10003EE40()
{
}

double sub_10003EE6C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return result;
}

void sub_10003EEDC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003EF4C()
{
}

void sub_10003EF78()
{
}

void sub_10003EFA4()
{
}

void sub_10003EFD0()
{
}

void sub_10003EFFC()
{
}

void sub_10003F028(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "<Error> Unknown radioControllerType %d",  (uint8_t *)v2,  8u);
  sub_100008368();
}

void sub_10003F098()
{
}

void sub_10003F0C4()
{
}

void sub_10003F0F0()
{
}

void sub_10003F11C()
{
}

void sub_10003F148()
{
}

void sub_10003F174()
{
}

void sub_10003F1A0()
{
}

void sub_10003F1CC()
{
}

void sub_10003F1F8(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100008340((void *)&_mh_execute_header, a3, (uint64_t)a3, "<Error> no FContext value", a1);
}

void sub_10003F22C(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100008340((void *)&_mh_execute_header, a3, (uint64_t)a3, "<Error> bad FContext value", a1);
}

void sub_10003F260()
{
}

void sub_10003F28C()
{
}

void sub_10003F2B8()
{
}

void sub_10003F2E4()
{
}

void sub_10003F310(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "<Error> Failed to write data to SensorDispatcher = 0x%x",  (uint8_t *)v2,  8u);
  sub_100008368();
}

void sub_10003F380( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F3F0()
{
}

void sub_10003F420()
{
}

void sub_10003F450()
{
}

void sub_10003F480(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100008340((void *)&_mh_execute_header, a3, (uint64_t)a3, "<Error> Failed to copy keyboard event from client", a1);
}

void sub_10003F4B4(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100008340( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "<Error> Unable to create eventRef for keyboard event",  a1);
}

void sub_10003F4E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F558( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F5C8()
{
}

void sub_10003F5F8()
{
}

void sub_10003F628()
{
}

void sub_10003F658()
{
}

void sub_10003F688()
{
}

void sub_10003F6B8()
{
}

void sub_10003F6E8()
{
}

void sub_10003F718(_BYTE *a1, _BYTE *a2)
{
}

void sub_10003F744(_BYTE *a1, _BYTE *a2)
{
}

void sub_10003F770(_BYTE *a1, _BYTE *a2)
{
}

void sub_10003F79C()
{
}

id objc_msgSend_initWithParams_perfStateVoltages_voltageCount_loopType_persistancePath_filer_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:");
}

id objc_msgSend_xpcNotifyForMitigationsUI(void *a1, const char *a2, ...)
{
  return [a1 xpcNotifyForMitigationsUI];
}