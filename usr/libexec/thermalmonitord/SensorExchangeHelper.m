@interface SensorExchangeHelper
+ (id)sharedInstance;
- (SensorExchangeHelper)init;
- (smcExchangeSensorGroupInfo)getSensorGroupForSMCKeyString:(__CFString *)a3;
- (void)registerCLTMSensorIndex:(int)a3 forSMCKey:(__CFString *)a4 atSMCIndex:(int)a5;
- (void)sendSensorExchangeDataToSMC;
- (void)updateAllSensorExchangeData;
- (void)writeSMCExchangeDataForGroup:(smcExchangeSensorGroupInfo *)a3 withData:(void *)a4;
@end

@implementation SensorExchangeHelper

+ (id)sharedInstance
{
  if (qword_10007C498 != -1) {
    dispatch_once(&qword_10007C498, &stru_100061778);
  }
  return (id)qword_10007C4A0;
}

- (SensorExchangeHelper)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SensorExchangeHelper;
  v2 = -[SensorExchangeHelper init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    if (pthread_mutex_init(&v2->lock, 0LL))
    {
      v4 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003AA60(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      return 0LL;
    }

    else
    {
      v3->smcPort = 0;
      v3->cameraSensors.sensorExchangeKeyStr = @"zECm";
      v3->cameraSensors.sensorExchangeKeyValue = 2051359597;
      v3->cameraSensors.sensorExchangeKeySize = 64LL;
      v3->cameraSensors.numberOfSensors = 15;
      v3->cameraSensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->cameraSensors.data.BYTES.p1 = 267;
      v3->aopSensors.sensorExchangeKeyStr = @"zEAO";
      v3->aopSensors.sensorExchangeKeyValue = 2051359055;
      v3->aopSensors.sensorExchangeKeySize = 32LL;
      v3->aopSensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->aopSensors.data.BYTES.p1 = 261;
      v3->basebandSensors.sensorExchangeKeyStr = @"zEWi";
      v3->basebandSensors.sensorExchangeKeyValue = 2051364713;
      v3->basebandSensors.sensorExchangeKeySize = 32LL;
      v3->basebandSensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->basebandSensors.data.BYTES.p1 = 259;
      v3->displaySensors.sensorExchangeKeyStr = @"zETC";
      v3->displaySensors.sensorExchangeKeyValue = 2051363907;
      v3->displaySensors.sensorExchangeKeySize = 32LL;
      v3->displaySensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->displaySensors.data.BYTES.p1 = 260;
      v3->miscSensors.sensorExchangeKeyStr = @"zETM";
      v3->miscSensors.sensorExchangeKeyValue = 2051363917;
      v3->miscSensors.sensorExchangeKeySize = 120LL;
      v3->miscSensors.numberOfSensors = 29;
      v3->miscSensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->miscSensors.data.BYTES.p1 = 285;
      v3->misc2Sensors.sensorExchangeKeyStr = @"zETN";
      v3->misc2Sensors.sensorExchangeKeyValue = 2051363918;
      v3->misc2Sensors.sensorExchangeKeySize = 120LL;
      v3->misc2Sensors.numberOfSensors = 29;
      v3->misc2Sensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->misc2Sensors.data.BYTES.p1 = 260;
      v3->strapSensors.sensorExchangeKeyStr = @"zEAR";
      v3->strapSensors.sensorExchangeKeyValue = 2051359058;
      v3->strapSensors.sensorExchangeKeySize = 32LL;
      v3->strapSensors.numberOfSensors = 7;
      v3->strapSensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->strapSensors.data.BYTES.p1 = 258;
      v3->cameraSensors.sensorIndexLUT[28] = -1;
      *(void *)&__int128 v12 = -1LL;
      *((void *)&v12 + 1) = -1LL;
      *(_OWORD *)&v3->cameraSensors.sensorIndexLUT[20] = v12;
      *(_OWORD *)&v3->cameraSensors.sensorIndexLUT[24] = v12;
      *(_OWORD *)&v3->cameraSensors.sensorIndexLUT[12] = v12;
      *(_OWORD *)&v3->cameraSensors.sensorIndexLUT[16] = v12;
      *(_OWORD *)&v3->cameraSensors.sensorIndexLUT[4] = v12;
      *(_OWORD *)&v3->cameraSensors.sensorIndexLUT[8] = v12;
      *(_OWORD *)v3->cameraSensors.sensorIndexLUT = v12;
      *(_OWORD *)v3->aopSensors.sensorIndexLUT = v12;
      *(_OWORD *)&v3->aopSensors.sensorIndexLUT[4] = v12;
      *(_OWORD *)&v3->aopSensors.sensorIndexLUT[8] = v12;
      *(_OWORD *)&v3->aopSensors.sensorIndexLUT[12] = v12;
      *(_OWORD *)&v3->aopSensors.sensorIndexLUT[16] = v12;
      *(_OWORD *)&v3->aopSensors.sensorIndexLUT[20] = v12;
      *(_OWORD *)&v3->aopSensors.sensorIndexLUT[24] = v12;
      v3->aopSensors.sensorIndexLUT[28] = -1;
      *(_OWORD *)v3->basebandSensors.sensorIndexLUT = v12;
      *(_OWORD *)&v3->basebandSensors.sensorIndexLUT[4] = v12;
      *(_OWORD *)&v3->basebandSensors.sensorIndexLUT[8] = v12;
      *(_OWORD *)&v3->basebandSensors.sensorIndexLUT[12] = v12;
      *(_OWORD *)&v3->basebandSensors.sensorIndexLUT[16] = v12;
      *(_OWORD *)&v3->basebandSensors.sensorIndexLUT[20] = v12;
      *(_OWORD *)&v3->basebandSensors.sensorIndexLUT[24] = v12;
      v3->basebandSensors.sensorIndexLUT[28] = -1;
      v3->displaySensors.sensorIndexLUT[28] = -1;
      *(_OWORD *)&v3->displaySensors.sensorIndexLUT[20] = v12;
      *(_OWORD *)&v3->displaySensors.sensorIndexLUT[24] = v12;
      *(_OWORD *)&v3->displaySensors.sensorIndexLUT[12] = v12;
      *(_OWORD *)&v3->displaySensors.sensorIndexLUT[16] = v12;
      *(_OWORD *)&v3->displaySensors.sensorIndexLUT[4] = v12;
      *(_OWORD *)&v3->displaySensors.sensorIndexLUT[8] = v12;
      *(_OWORD *)v3->displaySensors.sensorIndexLUT = v12;
      v3->miscSensors.sensorIndexLUT[28] = -1;
      *(_OWORD *)&v3->miscSensors.sensorIndexLUT[24] = v12;
      *(_OWORD *)&v3->miscSensors.sensorIndexLUT[20] = v12;
      *(_OWORD *)&v3->miscSensors.sensorIndexLUT[16] = v12;
      *(_OWORD *)&v3->miscSensors.sensorIndexLUT[12] = v12;
      *(_OWORD *)&v3->miscSensors.sensorIndexLUT[8] = v12;
      *(_OWORD *)&v3->miscSensors.sensorIndexLUT[4] = v12;
      *(_OWORD *)v3->miscSensors.sensorIndexLUT = v12;
      v3->misc2Sensors.sensorIndexLUT[28] = -1;
      *(_OWORD *)&v3->misc2Sensors.sensorIndexLUT[24] = v12;
      *(_OWORD *)&v3->misc2Sensors.sensorIndexLUT[20] = v12;
      *(_OWORD *)&v3->misc2Sensors.sensorIndexLUT[16] = v12;
      *(_OWORD *)&v3->misc2Sensors.sensorIndexLUT[12] = v12;
      *(_OWORD *)&v3->misc2Sensors.sensorIndexLUT[8] = v12;
      *(_OWORD *)&v3->misc2Sensors.sensorIndexLUT[4] = v12;
      *(_OWORD *)v3->misc2Sensors.sensorIndexLUT = v12;
      v3->strapSensors.sensorIndexLUT[28] = -1;
      *(_OWORD *)&v3->strapSensors.sensorIndexLUT[24] = v12;
      *(_OWORD *)&v3->strapSensors.sensorIndexLUT[20] = v12;
      *(_OWORD *)&v3->strapSensors.sensorIndexLUT[16] = v12;
      *(_OWORD *)&v3->strapSensors.sensorIndexLUT[12] = v12;
      *(_OWORD *)&v3->strapSensors.sensorIndexLUT[8] = v12;
      *(_OWORD *)&v3->strapSensors.sensorIndexLUT[4] = v12;
      *(_OWORD *)v3->strapSensors.sensorIndexLUT = v12;
    }
  }

  return v3;
}

- (void)updateAllSensorExchangeData
{
  unint64_t v3 = 0LL;
  uint64_t v4 = 232LL;
  do
  {
    uint64_t v5 = (char *)self + 4 * v3;
    uint64_t v6 = *((unsigned int *)v5 + 28);
    if ((v6 & 0x80000000) == 0 && v3 < self->cameraSensors.data.BYTES.p1[0])
    {
      int v7 = dword_10007D05C[v6];
      float v8 = (double)v7 / 100.0;
      uint64_t v9 = (float *)((char *)self + 4 * v3);
      if (v9[58] != v8)
      {
        if (byte_10007CB30)
        {
          uint64_t v10 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            int v35 = v6;
            __int16 v36 = 1024;
            LODWORD(v37) = v7;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "<Notice> Camera sensor update found for sensor# %d with value: %d",  buf,  0xEu);
          }
        }

        v9[58] = v8;
        self->cameraSensors.SensorExchangeUpdateNeeded = 1;
      }
    }

    uint64_t v11 = *((unsigned int *)v5 + 96);
    if ((v11 & 0x80000000) == 0 && v3 < self->aopSensors.data.BYTES.p1[0])
    {
      int v12 = dword_10007D05C[v11];
      float v13 = (double)v12 / 100.0;
      objc_super v14 = (float *)((char *)self + 4 * v3);
      if (v14[126] != v13)
      {
        if (byte_10007CB30)
        {
          v15 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            int v35 = v11;
            __int16 v36 = 1024;
            LODWORD(v37) = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "<Notice> AOP sensor update found for sensor# %d with value: %d",  buf,  0xEu);
          }
        }

        v14[126] = v13;
        self->aopSensors.SensorExchangeUpdateNeeded = 1;
      }
    }

    uint64_t v16 = self->basebandSensors.sensorIndexLUT[v3];
    if ((v16 & 0x80000000) == 0 && v3 < self->basebandSensors.data.BYTES.p1[0])
    {
      int v17 = dword_10007D05C[v16];
      float v18 = (double)v17 / 100.0;
      v19 = (float *)((char *)self + 4 * v3);
      if (v19[194] != v18)
      {
        if (byte_10007CB30)
        {
          v20 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            int v35 = v16;
            __int16 v36 = 1024;
            LODWORD(v37) = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "<Notice> Baseband sensor update found for sensor# %d with value: %d",  buf,  0xEu);
          }
        }

        v19[194] = v18;
        self->basebandSensors.SensorExchangeUpdateNeeded = 1;
      }
    }

    uint64_t v21 = *(unsigned int *)((char *)&self->super.isa + v4 * 4);
    if ((v21 & 0x80000000) == 0 && v3 < self->displaySensors.data.BYTES.p1[0])
    {
      int v22 = dword_10007D05C[v21];
      float v23 = (double)v22 / 100.0;
      v24 = (float *)((char *)self + 4 * v3);
      if (v24[262] != v23)
      {
        if (byte_10007CB30)
        {
          v25 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            int v35 = v21;
            __int16 v36 = 1024;
            LODWORD(v37) = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "<Notice> Display sensor update found for sensor# %d with value: %d",  buf,  0xEu);
          }
        }

        v24[262] = v23;
        self->displaySensors.SensorExchangeUpdateNeeded = 1;
      }
    }

    uint64_t ui32Raw = self->cameraSensors.data.SENSORS.sensorArray[v4 + 10].UI32.ui32Raw;
    if ((ui32Raw & 0x80000000) == 0 && v3 < self->miscSensors.data.BYTES.p1[0])
    {
      float v27 = (_DWORD)v3 == 26 || (_DWORD)v3 == 1
          ? (double)dword_10007D05C[ui32Raw] / 100.0
          : *(float *)&dword_10007D170[ui32Raw];
      v28 = (float *)((char *)self + 4 * v3);
      if (v27 != v28[330])
      {
        if (byte_10007CB30)
        {
          v29 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            int v35 = ui32Raw;
            __int16 v36 = 2048;
            double v37 = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "<Notice> Misc sensor update found for sensor# %d with value: %f",  buf,  0x12u);
          }
        }

        v28[330] = v27;
        self->miscSensors.SensorExchangeUpdateNeeded = 1;
      }
    }

    uint64_t v30 = self->aopSensors.data.SENSORS.sensorArray[v4 + 10].UI32.ui32Raw;
    if ((v30 & 0x80000000) == 0 && v3 < self->misc2Sensors.data.BYTES.p1[0])
    {
      float v31 = (_DWORD)v3 == 3 || (_DWORD)v3 == 2 ? (double)dword_10007D05C[v30] / 100.0 : *(float *)&dword_10007D270[v30];
      v32 = (float *)((char *)self + 4 * v3);
      if (v31 != v32[398])
      {
        if (byte_10007CB30)
        {
          v33 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            int v35 = v30;
            __int16 v36 = 2048;
            double v37 = v31;
            _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "<Notice> Misc2 sensor update found for sensor# %d with value: %f",  buf,  0x12u);
          }
        }

        v32[398] = v31;
        self->misc2Sensors.SensorExchangeUpdateNeeded = 1;
      }
    }

    ++v3;
    ++v4;
  }

  while (v3 != 29);
}

- (void)writeSMCExchangeDataForGroup:(smcExchangeSensorGroupInfo *)a3 withData:(void *)a4
{
  mach_port_t smcPort = self->smcPort;
  if (smcPort)
  {
    if (a3->SensorExchangeUpdateNeeded)
    {
      if (byte_10007CB30)
      {
        float v8 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          sensorExchangeKeyStr = a3->sensorExchangeKeyStr;
          *(_DWORD *)buf = 138412290;
          *(void *)&__int128 v49 = sensorExchangeKeyStr;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<Notice> Writing sensor data to SMC key %@",  buf,  0xCu);
          mach_port_t smcPort = self->smcPort;
        }
      }

      unsigned int sensorExchangeKeyValue = a3->sensorExchangeKeyValue;
      unint64_t sensorExchangeKeySize = a3->sensorExchangeKeySize;
      size_t v30 = 168LL;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      memset(v51, 0, sizeof(v51));
      int v52 = 0;
      memset(outputStruct, 0, sizeof(outputStruct));
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      uint64_t v47 = 0LL;
      v31[0] = HIBYTE(sensorExchangeKeyValue);
      v31[1] = BYTE2(sensorExchangeKeyValue);
      v31[2] = BYTE1(sensorExchangeKeyValue);
      v31[3] = sensorExchangeKeyValue;
      v31[4] = 0;
      v51[6] = 6;
      *(_DWORD *)buf = sensorExchangeKeyValue;
      DWORD2(v50) = sensorExchangeKeySize;
      if ((_BYTE)sensorExchangeKeySize) {
        memcpy(&v51[12], a4, sensorExchangeKeySize);
      }
      uint64_t v12 = IOConnectCallStructMethod(smcPort, 2u, buf, 0xA8uLL, outputStruct, &v30);
      int v13 = BYTE8(v39);
      if (!(_DWORD)v12 && !BYTE8(v39)) {
        goto LABEL_14;
      }
      objc_super v14 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v32 = 136315650;
        v33 = v31;
        __int16 v34 = 1024;
        int v35 = v12;
        __int16 v36 = 1024;
        int v37 = v13;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "<Error> Write failed for key '%s' (0x%X, 0x%X)\n",  v32,  0x18u);
        if ((_DWORD)v12)
        {
LABEL_12:
          v15 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
            sub_10003AAC0(v12, v15, v16, v17, v18, v19, v20, v21);
          }
        }
      }

      else if ((_DWORD)v12)
      {
        goto LABEL_12;
      }

- (void)sendSensorExchangeDataToSMC
{
  p_lock = &self->lock;
  pthread_mutex_lock(&self->lock);
  if (byte_10007CB30)
  {
    uint64_t v4 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "<Notice> In sendSensorExchangeDataToSMC function",  buf,  2u);
    }
  }

  if (self->cameraSensors.SensorExchangeUpdateNeeded
    || self->aopSensors.SensorExchangeUpdateNeeded
    || self->basebandSensors.SensorExchangeUpdateNeeded
    || self->displaySensors.SensorExchangeUpdateNeeded
    || self->miscSensors.SensorExchangeUpdateNeeded
    || self->misc2Sensors.SensorExchangeUpdateNeeded
    || self->strapSensors.SensorExchangeUpdateNeeded)
  {
    p_mach_port_t smcPort = &self->smcPort;
    uint64_t v6 = IOServiceMatching("AppleSMC");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
    if (MatchingService)
    {
      io_object_t v8 = MatchingService;
      uint64_t v9 = IOServiceOpen(MatchingService, mach_task_self_, 0, &self->smcPort);
      IOObjectRelease(v8);
      if (!(_DWORD)v9)
      {
        if (*p_smcPort)
        {
          uint64_t v9 = IOConnectCallScalarMethod(*p_smcPort, 0, 0LL, 0, 0LL, 0LL);
          if (!(_DWORD)v9)
          {
            if (*p_smcPort)
            {
              -[SensorExchangeHelper writeSMCExchangeDataForGroup:withData:]( self,  "writeSMCExchangeDataForGroup:withData:",  &self->cameraSensors,  &self->cameraSensors.data);
              -[SensorExchangeHelper writeSMCExchangeDataForGroup:withData:]( self,  "writeSMCExchangeDataForGroup:withData:",  &self->aopSensors,  &self->aopSensors.data);
              -[SensorExchangeHelper writeSMCExchangeDataForGroup:withData:]( self,  "writeSMCExchangeDataForGroup:withData:",  &self->basebandSensors,  &self->basebandSensors.data);
              -[SensorExchangeHelper writeSMCExchangeDataForGroup:withData:]( self,  "writeSMCExchangeDataForGroup:withData:",  &self->displaySensors,  &self->displaySensors.data);
              -[SensorExchangeHelper writeSMCExchangeDataForGroup:withData:]( self,  "writeSMCExchangeDataForGroup:withData:",  &self->miscSensors,  &self->miscSensors.data);
              -[SensorExchangeHelper writeSMCExchangeDataForGroup:withData:]( self,  "writeSMCExchangeDataForGroup:withData:",  &self->misc2Sensors,  &self->misc2Sensors.data);
              -[SensorExchangeHelper writeSMCExchangeDataForGroup:withData:]( self,  "writeSMCExchangeDataForGroup:withData:",  &self->strapSensors,  &self->strapSensors.data);
              mach_port_t smcPort = self->smcPort;
              if (smcPort && !IOConnectCallScalarMethod(smcPort, 1u, 0LL, 0, 0LL, 0LL)) {
                IOServiceClose(*p_smcPort);
              }
              goto LABEL_23;
            }

            uint64_t v9 = 0LL;
            goto LABEL_21;
          }
        }

        else
        {
          uint64_t v9 = 0LL;
        }
      }
    }

    else
    {
      uint64_t v9 = 3758097136LL;
    }

    *p_mach_port_t smcPort = 0;
LABEL_21:
    uint64_t v11 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003AB24(v9, v11, v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_23;
  }

  if (byte_10007CB30)
  {
    uint64_t v18 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "<Notice> No sensor groups require updates",  v19,  2u);
    }
  }

- (smcExchangeSensorGroupInfo)getSensorGroupForSMCKeyString:(__CFString *)a3
{
  p_cameraSensors = &self->cameraSensors;
  if (CFStringCompare(a3, self->cameraSensors.sensorExchangeKeyStr, 0LL))
  {
    if (CFStringCompare(a3, self->aopSensors.sensorExchangeKeyStr, 0LL))
    {
      if (CFStringCompare(a3, self->basebandSensors.sensorExchangeKeyStr, 0LL))
      {
        if (CFStringCompare(a3, self->displaySensors.sensorExchangeKeyStr, 0LL))
        {
          if (CFStringCompare(a3, self->miscSensors.sensorExchangeKeyStr, 0LL))
          {
            if (CFStringCompare(a3, self->misc2Sensors.sensorExchangeKeyStr, 0LL))
            {
              p_cameraSensors = &self->strapSensors;
              if (CFStringCompare(a3, self->strapSensors.sensorExchangeKeyStr, 0LL)) {
                return 0LL;
              }
            }

            else
            {
              return &self->misc2Sensors;
            }
          }

          else
          {
            return &self->miscSensors;
          }
        }

        else
        {
          return &self->displaySensors;
        }
      }

      else
      {
        return &self->basebandSensors;
      }
    }

    else
    {
      return &self->aopSensors;
    }
  }

  return p_cameraSensors;
}

- (void)registerCLTMSensorIndex:(int)a3 forSMCKey:(__CFString *)a4 atSMCIndex:(int)a5
{
  io_object_t v8 = -[SensorExchangeHelper getSensorGroupForSMCKeyString:](self, "getSensorGroupForSMCKeyString:", a4);
  if (v8)
  {
    if ((a5 | a3) < 0)
    {
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003AC58();
      }
    }

    else
    {
      uint64_t v9 = v8;
      if (CFStringCompare(a4, v8->sensorExchangeKeyStr, 0LL) == kCFCompareEqualTo)
      {
        if (v9->numberOfSensors > a5)
        {
          if (byte_10007CB30)
          {
            uint64_t v10 = (os_log_s *)qword_10007CF50;
            if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
            {
              int v13 = 67109376;
              int v14 = a3;
              __int16 v15 = 1024;
              LODWORD(v16) = a5;
              _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "<Notice> Assigning CLTM sensor index %d to SMC sensor index: %d",  (uint8_t *)&v13,  0xEu);
            }
          }

          v9->sensorIndexLUT[a5] = a3;
          return;
        }

        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003ABF8();
        }
      }

      uint64_t v12 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        int v13 = 67109634;
        int v14 = a3;
        __int16 v15 = 2112;
        uint64_t v16 = a4;
        __int16 v17 = 1024;
        int v18 = a5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "<Error> Unable to assign CLTM index:%d to any SMC sensor group for key:%@ and index:%d",  (uint8_t *)&v13,  0x18u);
      }
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003AB88((uint64_t)a4, v11);
    }
  }

@end