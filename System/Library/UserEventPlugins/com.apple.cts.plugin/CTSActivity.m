@interface CTSActivity
- (BOOL)allow_battery;
- (BOOL)app_refresh;
- (BOOL)bgtask_debug;
- (BOOL)communicates_with_paired_device;
- (BOOL)confirmed_run;
- (BOOL)cpu_intensive;
- (BOOL)das_eligible;
- (BOOL)das_started;
- (BOOL)data_budgeted;
- (BOOL)disk_intensive;
- (BOOL)duet_power_budgeted;
- (BOOL)eligible;
- (BOOL)exclusive;
- (BOOL)may_reboot_device;
- (BOOL)memory_intensive;
- (BOOL)post_install;
- (BOOL)power_nap;
- (BOOL)prevents_device_sleep;
- (BOOL)repeating;
- (BOOL)requires_buddy_complete;
- (BOOL)requires_inexpensive_network;
- (BOOL)requires_network_connectivity;
- (BOOL)requires_screen_sleep;
- (BOOL)requires_significant_user_inactivity;
- (BOOL)runOnAppForeground;
- (BOOL)schedule_rtc_wake;
- (BOOL)unmanaged;
- (BOOL)user_requested_backup_task;
- (NSArray)involved_processes;
- (NSArray)related_applications;
- (NSString)bundle_id;
- (NSString)group_name;
- (NSString)name;
- (NSString)serviceName;
- (OS_nw_endpoint)network_endpoint;
- (OS_nw_parameters)network_parameters;
- (OS_xpc_object)connection;
- (OS_xpc_object)das_data;
- (OS_xpc_object)peer;
- (_DASActivity)scheduler_activity;
- (const)desired_motion_state;
- (id)description;
- (int)pid;
- (int)priority;
- (int)requires_protection_class;
- (int64_t)baseTime;
- (int64_t)deadlineTime;
- (int64_t)delay;
- (int64_t)elapsedTime;
- (int64_t)eligibleTime;
- (int64_t)expected_duration;
- (int64_t)expected_network_download_size_bytes;
- (int64_t)expected_network_upload_size_bytes;
- (int64_t)grace_period;
- (int64_t)interval;
- (int64_t)random_initial_delay;
- (int64_t)startTime;
- (int64_t)state;
- (int64_t)tempDelay;
- (int64_t)totalElapsed;
- (unint64_t)group_concurrency_limit;
- (unint64_t)seqno;
- (unint64_t)token;
- (unsigned)bgwake_count;
- (unsigned)power_assertion;
- (void)advanceBaseTime;
- (void)loadBaseTime;
- (void)markStarted:(int64_t)a3;
- (void)markStopped:(int64_t)a3;
- (void)resetBaseTime;
- (void)setAllow_battery:(BOOL)a3;
- (void)setApp_refresh:(BOOL)a3;
- (void)setBaseTime:(int64_t)a3;
- (void)setBgtask_debug:(BOOL)a3;
- (void)setBgwake_count:(unsigned int)a3;
- (void)setBundle_id:(id)a3;
- (void)setCommunicates_with_paired_device:(BOOL)a3;
- (void)setConfirmed_run:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setCpu_intensive:(BOOL)a3;
- (void)setDas_data:(id)a3;
- (void)setDas_eligible:(BOOL)a3;
- (void)setDas_started:(BOOL)a3;
- (void)setData_budgeted:(BOOL)a3;
- (void)setDelay:(int64_t)a3;
- (void)setDesired_motion_state:(const char *)a3;
- (void)setDisk_intensive:(BOOL)a3;
- (void)setDuet_power_budgeted:(BOOL)a3;
- (void)setElapsedTime:(int64_t)a3;
- (void)setEligible:(BOOL)a3;
- (void)setExclusive:(BOOL)a3;
- (void)setExpected_duration:(int64_t)a3;
- (void)setExpected_network_download_size_bytes:(int64_t)a3;
- (void)setExpected_network_upload_size_bytes:(int64_t)a3;
- (void)setGrace_period:(int64_t)a3;
- (void)setGroup_concurrency_limit:(unint64_t)a3;
- (void)setGroup_name:(id)a3;
- (void)setInterval:(int64_t)a3;
- (void)setInvolved_processes:(id)a3;
- (void)setMay_reboot_device:(BOOL)a3;
- (void)setMemory_intensive:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNetwork_endpoint:(id)a3;
- (void)setNetwork_parameters:(id)a3;
- (void)setPeer:(id)a3;
- (void)setPid:(int)a3;
- (void)setPost_install:(BOOL)a3;
- (void)setPower_assertion:(unsigned int)a3;
- (void)setPower_nap:(BOOL)a3;
- (void)setPrevents_device_sleep:(BOOL)a3;
- (void)setPriority:(int)a3;
- (void)setRandom_initial_delay:(int64_t)a3;
- (void)setRelated_applications:(id)a3;
- (void)setRepeating:(BOOL)a3;
- (void)setRequires_buddy_complete:(BOOL)a3;
- (void)setRequires_inexpensive_network:(BOOL)a3;
- (void)setRequires_network_connectivity:(BOOL)a3;
- (void)setRequires_protection_class:(int)a3;
- (void)setRequires_screen_sleep:(BOOL)a3;
- (void)setRequires_significant_user_inactivity:(BOOL)a3;
- (void)setRunOnAppForeground:(BOOL)a3;
- (void)setSchedule_rtc_wake:(BOOL)a3;
- (void)setScheduler_activity:(id)a3;
- (void)setSeqno:(unint64_t)a3;
- (void)setServiceName:(id)a3;
- (void)setStartTime:(int64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setTempDelay:(int64_t)a3;
- (void)setToken:(unint64_t)a3;
- (void)setUnmanaged:(BOOL)a3;
- (void)setUser_requested_backup_task:(BOOL)a3;
@end

@implementation CTSActivity

- (void)loadBaseTime
{
  if (!-[CTSActivity repeating](self, "repeating"))
  {
    __uint64_t v19 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    uint64_t v20 = sub_3380(self);
    if (__OFADD__(v19, v20)) {
      uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v21 = v19 + v20;
    }
LABEL_24:
    -[CTSActivity setBaseTime:](self, "setBaseTime:", v21);
    return;
  }

  v3 = self;
  sub_3F00();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CTSActivity name](v3, "name"));

  if (!v4) {
    goto LABEL_13;
  }
  Value = (const __CFDate *)CFDictionaryGetValue((CFDictionaryRef)qword_152F8, v4);
  if (!Value) {
    goto LABEL_13;
  }
  double AbsoluteTime = CFDateGetAbsoluteTime(Value);
  __uint64_t v7 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  int64_t v8 = -[CTSActivity random_initial_delay](v3, "random_initial_delay");
  uint64_t v9 = 1000000000 * v8;
  BOOL v10 = __OFADD__(v7, v9);
  uint64_t v11 = v7 + v9;
  uint64_t v12 = v10 ? 0x7FFFFFFFFFFFFFFFLL : v11;
  sub_30F4(v12);
  if (AbsoluteTime > 0.0 && AbsoluteTime <= v13)
  {
    __uint64_t v22 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    uint64_t v17 = v22 + (uint64_t)((AbsoluteTime - CFAbsoluteTimeGetCurrent()) * 1000000000.0);
  }

  else
  {
LABEL_13:
    __uint64_t v15 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    uint64_t v16 = sub_3380(v3);
    if (__OFADD__(v15, v16)) {
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v17 = v15 + v16;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CTSActivity name](v3, "name"));
    sub_3774(v18, v17);
  }

  -[CTSActivity setBaseTime:](v3, "setBaseTime:", v17);
  __uint64_t v23 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  int64_t v24 = -[CTSActivity interval](v3, "interval");
  uint64_t v25 = 1000000000 * v24;
  uint64_t v21 = v23 - v25;
  if (-[CTSActivity baseTime](v3, "baseTime") < v21) {
    goto LABEL_24;
  }
}

- (void)advanceBaseTime
{
  unsigned int v3 = -[CTSActivity repeating](self, "repeating");
  __uint64_t v4 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  __uint64_t v5 = v4;
  if (!v3)
  {
    int64_t v11 = 0LL;
    uint64_t v12 = v4;
    goto LABEL_49;
  }

  int64_t v6 = -[CTSActivity interval](self, "interval");
  else {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t v8 = -[CTSActivity delay](self, "delay");
  else {
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (-[CTSActivity grace_period](self, "grace_period") == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    int64_t v13 = -[CTSActivity grace_period](self, "grace_period");
    else {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  int64_t v14 = -[CTSActivity baseTime](self, "baseTime");
  if (__OFADD__(v14, v7)) {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v12 = v14 + v7;
  }
  uint64_t v15 = v7 + v10;
  if (__OFADD__(v7, v10)) {
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v16 = v5 - v15;
  if (__OFSUB__(v5, v15) || v16 <= v12)
  {
    uint64_t v21 = 2 * v7;
    if (__OFADD__(v7, v7)) {
      uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v16 = v5 + v21;
    if (__OFADD__(v5, v21) || v16 >= v12) {
      goto LABEL_31;
    }
    __uint64_t v22 = (void *)qword_15398;
    if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
    {
      v18 = v22;
      __uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[CTSActivity name](self, "name"));
      *(_DWORD *)v35 = 138543362;
      *(void *)&v35[4] = v19;
      uint64_t v20 = "newBaseTime is greater than 2*interval from now, moving back for %{public}@";
      goto LABEL_29;
    }
  }

  else
  {
    uint64_t v17 = (void *)qword_15398;
    if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
    {
      v18 = v17;
      __uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[CTSActivity name](self, "name"));
      *(_DWORD *)v35 = 138543362;
      *(void *)&v35[4] = v19;
      uint64_t v20 = "newBaseTime is less than interval+gracePeriod ago, moving forward for %{public}@";
LABEL_29:
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, v20, v35, 0xCu);
    }
  }

  uint64_t v12 = v16;
LABEL_31:
  if (v9)
  {
    int64_t v23 = -[CTSActivity startTime](self, "startTime");
    int64_t v11 = 0LL;
    if (v23) {
      int64_t v24 = v23;
    }
    else {
      int64_t v24 = v5;
    }
    BOOL v25 = __OFSUB__(v24, v12);
    uint64_t v26 = v24 - v12;
    if (!v25 && v26 >= 1)
    {
      int64_t v27 = -[CTSActivity startTime](self, "startTime");
      if (v27) {
        int64_t v28 = v27;
      }
      else {
        int64_t v28 = v5;
      }
      BOOL v25 = __OFADD__(v28, v9);
      uint64_t v29 = v28 + v9;
      if (v25) {
        uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
      }
      BOOL v25 = __OFSUB__(v29, v12);
      int64_t v30 = v29 - v12;
      if (v25) {
        int64_t v11 = 0x8000000000000000LL;
      }
      else {
        int64_t v11 = v30;
      }
      v31 = (void *)qword_15398;
      if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_INFO))
      {
        v32 = v31;
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[CTSActivity name](self, "name"));
        *(_DWORD *)v35 = 134218242;
        *(void *)&v35[4] = v11 / 1000000000;
        *(_WORD *)&v35[12] = 2114;
        *(void *)&v35[14] = v33;
        _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_INFO,  "Using temporary delay of %lld seconds to account for late fire of %{public}@",  v35,  0x16u);
      }
    }
  }

  else
  {
    int64_t v11 = 0LL;
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CTSActivity name](self, "name", *(_OWORD *)v35));
  sub_3774(v34, v12);

LABEL_49:
  -[CTSActivity setBaseTime:](self, "setBaseTime:", v12);
  -[CTSActivity setTempDelay:](self, "setTempDelay:", v11 / 1000000000);
}

- (void)resetBaseTime
{
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  __uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CTSActivity name](self, "name"));
  sub_3774(v4, v3);

  -[CTSActivity setBaseTime:](self, "setBaseTime:", v3);
  -[CTSActivity setElapsedTime:](self, "setElapsedTime:", 0LL);
  -[CTSActivity setStartTime:](self, "setStartTime:", 0LL);
}

- (int64_t)eligibleTime
{
  int64_t v3 = -[CTSActivity baseTime](self, "baseTime");
  int64_t v4 = -[CTSActivity tempDelay](self, "tempDelay");
  if (!v4) {
    int64_t v4 = -[CTSActivity delay](self, "delay");
  }
  uint64_t v5 = 1000000000 * v4;
  BOOL v6 = __OFADD__(v3, v5);
  int64_t v7 = v3 + v5;
  if (v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v7;
  }
}

- (int64_t)deadlineTime
{
  int64_t v3 = -[CTSActivity eligibleTime](self, "eligibleTime");
  if (-[CTSActivity grace_period](self, "grace_period") == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unsigned int v5 = -[CTSActivity repeating](self, "repeating");
  int64_t v6 = -[CTSActivity baseTime](self, "baseTime");
  if (v5) {
    int64_t v7 = -[CTSActivity interval](self, "interval");
  }
  else {
    int64_t v7 = -[CTSActivity delay](self, "delay");
  }
  int64_t v8 = v7;
  int64_t v9 = -[CTSActivity grace_period](self, "grace_period");
  int64_t v10 = v8 + v9;
  BOOL v11 = __OFADD__(v8, v9);
  uint64_t v12 = (int)v10;
  int v13 = v10 != (int)v10 || v11;
  BOOL v14 = v13 == 0;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  if (v14) {
    uint64_t v15 = v12;
  }
  uint64_t v16 = 1000000000 * v15;
  BOOL v14 = (unsigned __int128)(v15 * (__int128)1000000000LL) >> 64 == (1000000000 * v15) >> 63;
  int64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  if (v14) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  BOOL v19 = __OFADD__(v6, v18);
  int64_t v20 = v6 + v18;
  if (!v19) {
    int64_t v17 = v20;
  }
  if (v17 <= v3) {
    return v3;
  }
  else {
    return v17;
  }
}

- (void)markStarted:(int64_t)a3
{
}

- (void)markStopped:(int64_t)a3
{
}

- (int64_t)totalElapsed
{
  int64_t v3 = -[CTSActivity elapsedTime](self, "elapsedTime");
  if (-[CTSActivity startTime](self, "startTime"))
  {
    __uint64_t v4 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    __uint64_t v5 = v4 - -[CTSActivity startTime](self, "startTime");
  }

  else
  {
    __uint64_t v5 = 0LL;
  }

  return v5 + v3;
}

- (id)description
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CTSActivity name](self, "name"));
  __uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ (%p)", v3, self));

  return v4;
}

- (unint64_t)token
{
  return self->_token;
}

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

- (unint64_t)seqno
{
  return self->_seqno;
}

- (void)setSeqno:(unint64_t)a3
{
  self->_seqno = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_xpc_object)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
}

- (BOOL)unmanaged
{
  return self->_unmanaged;
}

- (void)setUnmanaged:(BOOL)a3
{
  self->_unmanaged = a3;
}

- (int64_t)interval
{
  return self->_interval;
}

- (void)setInterval:(int64_t)a3
{
  self->_interval = a3;
}

- (int64_t)delay
{
  return self->_delay;
}

- (void)setDelay:(int64_t)a3
{
  self->_delay = a3;
}

- (int64_t)grace_period
{
  return self->_grace_period;
}

- (void)setGrace_period:(int64_t)a3
{
  self->_grace_period = a3;
}

- (int64_t)expected_duration
{
  return self->_expected_duration;
}

- (void)setExpected_duration:(int64_t)a3
{
  self->_expected_duration = a3;
}

- (int64_t)random_initial_delay
{
  return self->_random_initial_delay;
}

- (void)setRandom_initial_delay:(int64_t)a3
{
  self->_random_initial_delay = a3;
}

- (int64_t)tempDelay
{
  return self->_tempDelay;
}

- (void)setTempDelay:(int64_t)a3
{
  self->_tempDelay = a3;
}

- (int64_t)baseTime
{
  return self->_baseTime;
}

- (void)setBaseTime:(int64_t)a3
{
  self->_baseTime = a3;
}

- (int64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(int64_t)a3
{
  self->_startTime = a3;
}

- (int64_t)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(int64_t)a3
{
  self->_elapsedTime = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (_DASActivity)scheduler_activity
{
  return self->_scheduler_activity;
}

- (void)setScheduler_activity:(id)a3
{
}

- (BOOL)eligible
{
  return self->_eligible;
}

- (void)setEligible:(BOOL)a3
{
  self->_eligible = a3;
}

- (BOOL)das_eligible
{
  return self->_das_eligible;
}

- (void)setDas_eligible:(BOOL)a3
{
  self->_das_eligible = a3;
}

- (BOOL)das_started
{
  return self->_das_started;
}

- (void)setDas_started:(BOOL)a3
{
  self->_das_started = a3;
}

- (NSString)bundle_id
{
  return self->_bundle_id;
}

- (void)setBundle_id:(id)a3
{
}

- (NSArray)related_applications
{
  return self->_related_applications;
}

- (void)setRelated_applications:(id)a3
{
}

- (NSArray)involved_processes
{
  return self->_involved_processes;
}

- (void)setInvolved_processes:(id)a3
{
}

- (BOOL)runOnAppForeground
{
  return self->_runOnAppForeground;
}

- (void)setRunOnAppForeground:(BOOL)a3
{
  self->_runOnAppForeground = a3;
}

- (unsigned)bgwake_count
{
  return self->_bgwake_count;
}

- (void)setBgwake_count:(unsigned int)a3
{
  self->_bgwake_count = a3;
}

- (unsigned)power_assertion
{
  return self->_power_assertion;
}

- (void)setPower_assertion:(unsigned int)a3
{
  self->_power_assertion = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (int)priority
{
  return self->_priority;
}

- (void)setPriority:(int)a3
{
  self->_priority = a3;
}

- (int)requires_protection_class
{
  return self->_requires_protection_class;
}

- (void)setRequires_protection_class:(int)a3
{
  self->_requires_protection_class = a3;
}

- (BOOL)repeating
{
  return self->_repeating;
}

- (void)setRepeating:(BOOL)a3
{
  self->_repeating = a3;
}

- (BOOL)requires_screen_sleep
{
  return self->_requires_screen_sleep;
}

- (void)setRequires_screen_sleep:(BOOL)a3
{
  self->_requires_screen_sleep = a3;
}

- (BOOL)requires_significant_user_inactivity
{
  return self->_requires_significant_user_inactivity;
}

- (void)setRequires_significant_user_inactivity:(BOOL)a3
{
  self->_requires_significant_user_inactivity = a3;
}

- (BOOL)allow_battery
{
  return self->_allow_battery;
}

- (void)setAllow_battery:(BOOL)a3
{
  self->_allow_battery = a3;
}

- (BOOL)exclusive
{
  return self->_exclusive;
}

- (void)setExclusive:(BOOL)a3
{
  self->_exclusive = a3;
}

- (BOOL)power_nap
{
  return self->_power_nap;
}

- (void)setPower_nap:(BOOL)a3
{
  self->_power_nap = a3;
}

- (BOOL)app_refresh
{
  return self->_app_refresh;
}

- (void)setApp_refresh:(BOOL)a3
{
  self->_app_refresh = a3;
}

- (BOOL)memory_intensive
{
  return self->_memory_intensive;
}

- (void)setMemory_intensive:(BOOL)a3
{
  self->_memory_intensive = a3;
}

- (BOOL)cpu_intensive
{
  return self->_cpu_intensive;
}

- (void)setCpu_intensive:(BOOL)a3
{
  self->_cpu_intensive = a3;
}

- (BOOL)disk_intensive
{
  return self->_disk_intensive;
}

- (void)setDisk_intensive:(BOOL)a3
{
  self->_disk_intensive = a3;
}

- (BOOL)may_reboot_device
{
  return self->_may_reboot_device;
}

- (void)setMay_reboot_device:(BOOL)a3
{
  self->_may_reboot_device = a3;
}

- (BOOL)post_install
{
  return self->_post_install;
}

- (void)setPost_install:(BOOL)a3
{
  self->_post_install = a3;
}

- (BOOL)user_requested_backup_task
{
  return self->_user_requested_backup_task;
}

- (void)setUser_requested_backup_task:(BOOL)a3
{
  self->_user_requested_backup_task = a3;
}

- (BOOL)requires_buddy_complete
{
  return self->_requires_buddy_complete;
}

- (void)setRequires_buddy_complete:(BOOL)a3
{
  self->_requires_buddy_complete = a3;
}

- (BOOL)prevents_device_sleep
{
  return self->_prevents_device_sleep;
}

- (void)setPrevents_device_sleep:(BOOL)a3
{
  self->_prevents_device_sleep = a3;
}

- (BOOL)requires_network_connectivity
{
  return self->_requires_network_connectivity;
}

- (void)setRequires_network_connectivity:(BOOL)a3
{
  self->_requires_network_connectivity = a3;
}

- (BOOL)requires_inexpensive_network
{
  return self->_requires_inexpensive_network;
}

- (void)setRequires_inexpensive_network:(BOOL)a3
{
  self->_requires_inexpensive_network = a3;
}

- (int64_t)expected_network_download_size_bytes
{
  return self->_expected_network_download_size_bytes;
}

- (void)setExpected_network_download_size_bytes:(int64_t)a3
{
  self->_expected_network_download_size_bytes = a3;
}

- (int64_t)expected_network_upload_size_bytes
{
  return self->_expected_network_upload_size_bytes;
}

- (void)setExpected_network_upload_size_bytes:(int64_t)a3
{
  self->_expected_network_upload_size_bytes = a3;
}

- (OS_nw_endpoint)network_endpoint
{
  return self->_network_endpoint;
}

- (void)setNetwork_endpoint:(id)a3
{
}

- (OS_nw_parameters)network_parameters
{
  return self->_network_parameters;
}

- (void)setNetwork_parameters:(id)a3
{
}

- (BOOL)communicates_with_paired_device
{
  return self->_communicates_with_paired_device;
}

- (void)setCommunicates_with_paired_device:(BOOL)a3
{
  self->_communicates_with_paired_device = a3;
}

- (const)desired_motion_state
{
  return self->_desired_motion_state;
}

- (void)setDesired_motion_state:(const char *)a3
{
  self->_desired_motion_state = a3;
}

- (OS_xpc_object)das_data
{
  return self->_das_data;
}

- (void)setDas_data:(id)a3
{
}

- (BOOL)schedule_rtc_wake
{
  return self->_schedule_rtc_wake;
}

- (void)setSchedule_rtc_wake:(BOOL)a3
{
  self->_schedule_rtc_wake = a3;
}

- (BOOL)duet_power_budgeted
{
  return self->_duet_power_budgeted;
}

- (void)setDuet_power_budgeted:(BOOL)a3
{
  self->_duet_power_budgeted = a3;
}

- (BOOL)data_budgeted
{
  return self->_data_budgeted;
}

- (void)setData_budgeted:(BOOL)a3
{
  self->_data_budgeted = a3;
}

- (BOOL)bgtask_debug
{
  return self->_bgtask_debug;
}

- (void)setBgtask_debug:(BOOL)a3
{
  self->_bgtask_debug = a3;
}

- (BOOL)confirmed_run
{
  return self->_confirmed_run;
}

- (void)setConfirmed_run:(BOOL)a3
{
  self->_confirmed_run = a3;
}

- (NSString)group_name
{
  return self->_group_name;
}

- (void)setGroup_name:(id)a3
{
}

- (unint64_t)group_concurrency_limit
{
  return self->_group_concurrency_limit;
}

- (void)setGroup_concurrency_limit:(unint64_t)a3
{
  self->_group_concurrency_limit = a3;
}

- (void).cxx_destruct
{
}

@end