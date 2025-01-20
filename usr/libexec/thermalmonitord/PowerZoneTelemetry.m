@interface PowerZoneTelemetry
+ (id)sharedInstance;
- (BOOL)isFastDieEngaged;
- (PowerZoneTelemetry)init;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (float)getCpuPowerZoneLimited;
- (float)getCurrentPackagePower;
- (float)getGpuPowerZoneLimited;
- (float)getPackagePowerZoneLimited;
- (int)numberOfFields;
- (void)dealloc;
- (void)queryData;
@end

@implementation PowerZoneTelemetry

+ (id)sharedInstance
{
  if (qword_100074AC0 != -1) {
    dispatch_once(&qword_100074AC0, &stru_100061100);
  }
  return (id)qword_100074AC8;
}

- (PowerZoneTelemetry)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PowerZoneTelemetry;
  v2 = -[PowerZoneTelemetry init](&v22, "init");
  if (!v2) {
    return v2;
  }
  v3 = IOServiceMatching("AppleCLPC");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  v2->appleCLPCService = MatchingService;
  vm_size_t size = -3LL;
  vm_address_t address = 0LL;
  if (!MatchingService)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100039158();
    }
    goto LABEL_38;
  }

  if (IOServiceOpen(MatchingService, mach_task_self_, 0, &v2->clpcConnect))
  {
    if ((byte_100074AD0 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_100039260();
      }
      byte_100074AD0 = 1;
    }

- (void)queryData
{
  size_t v33 = -3LL;
  vm_address_t outputStruct = 0LL;
  if (IOConnectCallMethod(self->clpcConnect, 6u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, &outputStruct, &v33))
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100039234();
    }
    return;
  }

  if (v33 <= 0x6F)
  {
    vm_deallocate(mach_task_self_, outputStruct, v33);
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100039184();
    }
    return;
  }

  vm_address_t v3 = outputStruct;
  if (*(void *)(outputStruct + 8) == v33)
  {
    unint64_t v4 = *(void *)(outputStruct + 24);
    uint64_t v5 = mach_absolute_time();
    unint64_t lastCLPCReadingTimestamp = self->lastCLPCReadingTimestamp;
    self->unint64_t lastCLPCReadingTimestamp = v5;
    vm_address_t v7 = outputStruct;
    if (v4 >= *(void *)(v3 + 8))
    {
LABEL_23:
      if (v7 | v33) {
        vm_deallocate(mach_task_self_, v7, v33);
      }
      if (self->gpuChannels && self->gpuSubscription)
      {
        uint64_t v27 = mach_absolute_time();
        uint64_t Samples = IOReportCreateSamples(self->gpuSubscription, self->gpuChannels, 0LL);
        if (!Samples)
        {
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
            sub_10003928C();
          }
          return;
        }

        v29 = (__CFDictionary *)Samples;
        SamplesDelta = (const void *)IOReportCreateSamplesDelta(self->lastGPUReading, Samples, 0LL);
        CFRelease(self->lastGPUReading);
        uint64_t v31 = v27 - self->lastGPUReadingTimestamp;
        self->lastGPUReading = v29;
        self->lastGPUReadingTimestamp = v27;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_10000CC64;
        v32[3] = &unk_100061128;
        v32[4] = self;
        v32[5] = v31;
        IOReportIterate(SamplesDelta, v32);
        if (SamplesDelta) {
          CFRelease(SamplesDelta);
        }
      }

      dword_10007D1B4 = LODWORD(self->packagePowerZoneLimited);
      return;
    }

    unint64_t v8 = v5 - lastCLPCReadingTimestamp;
    float v9 = (float)v8;
    while (1)
    {
      vm_address_t v10 = v7 + v4;
      int v11 = *(_DWORD *)(v7 + v4);
      if (v11 == 14)
      {
        int v17 = *(_DWORD *)(v10 + 16);
        if (v17 == 1)
        {
          uint64_t v23 = *(void *)(v10 + 24);
          uint64_t v24 = qword_1000747F0;
          __int128 v25 = *(_OWORD *)(v10 + 16);
          xmmword_1000747D8 = *(_OWORD *)v10;
          *(_OWORD *)algn_1000747E8 = v25;
          unint64_t v26 = v23 - v24;
          float v22 = (float)v26;
          self->cluster1FastDieLimitedMhz = (float)v26;
          if (!v26) {
            goto LABEL_17;
          }
        }

        else
        {
          if (v17) {
            goto LABEL_17;
          }
          uint64_t v18 = *(void *)(v10 + 24);
          uint64_t v19 = qword_1000747D0;
          __int128 v20 = *(_OWORD *)(v10 + 16);
          xmmword_1000747B8 = *(_OWORD *)v10;
          *(_OWORD *)algn_1000747C8 = v20;
          unint64_t v21 = v18 - v19;
          float v22 = (float)v21;
          self->cluster0FastDieLimitedMhz = (float)v21;
          if (!v21) {
            goto LABEL_17;
          }
        }

        self->cpuFastDieLimitedMhz = (unint64_t)v22;
      }

      else
      {
        if (v11 != 13)
        {
          if (v7 | v33) {
            vm_deallocate(mach_task_self_, v7, v33);
          }
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
            sub_1000391B0();
          }
          return;
        }

        uint64_t v12 = *(void *)(v10 + 16) - qword_1000747A0;
        uint64_t v13 = *(void *)(v10 + 32) - qword_1000747B0;
        unint64_t v14 = *(void *)(v10 + 24) - unk_1000747A8;
        __int128 v16 = *(_OWORD *)v10;
        __int128 v15 = *(_OWORD *)(v10 + 16);
        qword_1000747B0 = *(void *)(v10 + 32);
        xmmword_100074790 = v16;
        *(_OWORD *)&qword_1000747A0 = v15;
        self->cpuPowerZoneLimited = (float)v14 / v9;
        *(float *)&__int128 v15 = (float)(unint64_t)v13 / (self->tbfactor * (double)v8);
        self->packagePowerZoneLimited = (float)(unint64_t)v12 / v9;
        LODWORD(self->currentPackagePower) = v15;
      }

- (float)getCpuPowerZoneLimited
{
  return self->cpuPowerZoneLimited;
}

- (float)getGpuPowerZoneLimited
{
  return self->gpuPowerZoneLimited;
}

- (float)getPackagePowerZoneLimited
{
  return self->packagePowerZoneLimited;
}

- (float)getCurrentPackagePower
{
  return self->currentPackagePower;
}

- (BOOL)isFastDieEngaged
{
  return self->cpuFastDieLimitedMhz != 0;
}

- (void)dealloc
{
  io_object_t appleCLPCService = self->appleCLPCService;
  if (appleCLPCService) {
    IOObjectRelease(appleCLPCService);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PowerZoneTelemetry;
  -[PowerZoneTelemetry dealloc](&v4, "dealloc");
}

- (int)numberOfFields
{
  return 5;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  else {
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, *(&off_100061148 + a3), 0LL);
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  else {
    return (__CFString *)CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%f",  *(float *)((char *)&self->super.isa + qword_100048040[a3]));
  }
}

@end