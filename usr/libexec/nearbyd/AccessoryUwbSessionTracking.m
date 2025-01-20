@interface AccessoryUwbSessionTracking
- (AccessoryUwbSessionTracking)initWithServiceRequest:(const void *)a3 startOptions:(const void *)a4 shareableConfigData:(id)a5 processName:(id)a6 accessoryConfigData:(const void *)a7 persistWhileDetached:(BOOL)a8;
- (BOOL)persistWhileDetached;
- (NSData)shareableConfigData;
- (NSMutableSet)interestedClients;
- (NSString)processName;
- (OS_dispatch_source)rangingRetryTimer;
- (double)initTime;
- (double)timeOfLatestSessionLifecycleChange;
- (id).cxx_construct;
- (unsigned)rangingRetryCount;
- (void)accessoryConfigData;
- (void)rangingSession;
- (void)serviceRequest;
- (void)setRangingRetryCount:(unsigned __int8)a3;
- (void)setRangingRetryTimer:(id)a3;
- (void)setRangingSession:(void *)a3;
- (void)startOptions;
- (void)stopRanging;
@end

@implementation AccessoryUwbSessionTracking

- (AccessoryUwbSessionTracking)initWithServiceRequest:(const void *)a3 startOptions:(const void *)a4 shareableConfigData:(id)a5 processName:(id)a6 accessoryConfigData:(const void *)a7 persistWhileDetached:(BOOL)a8
{
  id v15 = a5;
  id v16 = a6;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___AccessoryUwbSessionTracking;
  v17 = -[AccessoryUwbSessionTracking init](&v33, "init");
  v18 = v17;
  v19 = v17;
  if (v17)
  {
    BOOL v32 = a8;
    id v20 = v16;
    id v21 = v15;
    BOOL engaged = v17->_serviceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_;
    memcpy(&v17->_serviceRequest, a3, 0x1F8uLL);
    if (!engaged) {
      v19->_serviceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 1;
    }
    int scheduling_interval_usec_low = LOBYTE(v19->_startOptions.var0.__val_.scheduling_interval_usec);
    __int128 v25 = *((_OWORD *)a4 + 1);
    __int128 v24 = *((_OWORD *)a4 + 2);
    *(_OWORD *)&v18->_serviceRequest.var0.__val_.range_enable_params.nbamms.mms_bch.var0.__null_state_ = *(_OWORD *)a4;
    *(_OWORD *)v18->_serviceRequest.var0.__val_.range_enable_params.nbamms.irk = v25;
    *(_OWORD *)&v18->_serviceRequest.var0.__val_.range_enable_params.nbamms.antenna_diversity_mask.var0.__null_state_ = v24;
    __int128 v26 = *((_OWORD *)a4 + 6);
    __int128 v28 = *((_OWORD *)a4 + 3);
    $25E378AB494A1B43CDE6C204EF466DCF v27 = *(($25E378AB494A1B43CDE6C204EF466DCF *)a4 + 4);
    *(_OWORD *)&v18->_startOptions.var0.__val_.peer.var0.__val_.bt_adv_address.var0.__val_.__elems_[2] = *((_OWORD *)a4 + 5);
    *(_OWORD *)&v18->_startOptions.var0.__val_.start_time_or_offset_usec = v26;
    *(_OWORD *)&v18->_startOptions.var0.__null_state_ = v28;
    *($25E378AB494A1B43CDE6C204EF466DCF *)((char *)&v18->_startOptions.var0.__val_.peer.var0.__val_.uuid.var0 + 12) = v27;
    objc_storeStrong((id *)&v18->_startOptions.var0.__val_.secondary_scheduling_interval_usec, a5);
    objc_storeStrong((id *)&v18->_startOptions.var0.__val_.secondary_duty_cycle, a6);
    id v15 = v21;
    id v16 = v20;
    sub_10024EC2C((uint64_t)&v18->_shareableConfigData, (uint64_t)a7);
    v19->_startOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_ = v32;
    v29 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    ptr = v19->_rangingSession.__ptr_;
    v19->_rangingSession.__ptr_ = (FiRaSession *)v29;

    *(double *)&v19->_rangingSession.__cntrl_ = sub_100023CC4();
    *(double *)&v19->_persistWhileDetached = sub_100023CC4();
  }

  return v19;
}

- (void)stopRanging
{
  uint64_t conn_evt_trigger_desc = (uint64_t)self->_startOptions.var0.__val_.conn_evt_trigger_desc;
  if (conn_evt_trigger_desc)
  {
    sub_10026FAA8(conn_evt_trigger_desc);
    sub_10015D394(&self->_startOptions.var0.__val_.conn_evt_trigger_desc);
    *(double *)&self->_persistWhileDetached = sub_100023CC4();
  }

  *(&self->_startOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_ + 1) = 0;
  v4 = *(dispatch_source_s **)&self->_startOptions.__engaged_;
  if (v4)
  {
    dispatch_source_cancel(v4);
    v5 = *(void **)&self->_startOptions.__engaged_;
    *(void *)&self->_startOptions.__engaged_ = 0LL;
  }

- (void)rangingSession
{
  return &self->_startOptions.var0.__val_.conn_evt_trigger_desc;
}

- (void)setRangingSession:(void *)a3
{
  *(double *)&self->_persistWhileDetached = sub_100023CC4();
}

- (void)serviceRequest
{
  if (!self->_serviceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_) {
    sub_100006080();
  }
  return &self->_serviceRequest;
}

- (void)startOptions
{
  return &self->_serviceRequest.var0.__val_.range_enable_params.nbamms.mms_bch;
}

- (NSData)shareableConfigData
{
  return (NSData *)self->_startOptions.var0.__val_.secondary_scheduling_interval_usec;
}

- (NSString)processName
{
  return (NSString *)self->_startOptions.var0.__val_.secondary_duty_cycle;
}

- (void)accessoryConfigData
{
  return &self->_shareableConfigData;
}

- (BOOL)persistWhileDetached
{
  return self->_startOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_;
}

- (unsigned)rangingRetryCount
{
  return *(&self->_startOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_ + 1);
}

- (void)setRangingRetryCount:(unsigned __int8)a3
{
  *(&self->_startOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_ + 1) = a3;
}

- (OS_dispatch_source)rangingRetryTimer
{
  return *(OS_dispatch_source **)&self->_startOptions.__engaged_;
}

- (void)setRangingRetryTimer:(id)a3
{
}

- (NSMutableSet)interestedClients
{
  return (NSMutableSet *)self->_rangingSession.__ptr_;
}

- (double)initTime
{
  return *(double *)&self->_rangingSession.__cntrl_;
}

- (double)timeOfLatestSessionLifecycleChange
{
  return *(double *)&self->_persistWhileDetached;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 512) = 0;
  *((_BYTE *)self + 520) = 0;
  *((_BYTE *)self + 632) = 0;
  *((_OWORD *)self + 40) = 0u;
  *((_BYTE *)self + 712) = 0;
  *((_BYTE *)self + 751) = 0;
  return self;
}

@end