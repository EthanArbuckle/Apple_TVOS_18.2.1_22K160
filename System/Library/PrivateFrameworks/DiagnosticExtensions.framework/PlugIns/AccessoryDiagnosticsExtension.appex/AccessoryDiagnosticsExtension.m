LABEL_5:
  v8 = 1;
LABEL_8:

  return v8;
}

LABEL_12:
  return (char)v4;
}

void sub_100002554(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = objc_autoreleasePoolPush();
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = HMFGetOSLogHandle();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier(v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uuid]);
      int v26 = 138543874;
      v27 = v13;
      __int16 v28 = 2112;
      v29 = v14;
      __int16 v30 = 2112;
      id v31 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}@Error retrieving diagnostics for accessory %@: %@",  (uint8_t *)&v26,  0x20u);
    }

    objc_autoreleasePoolPop(v8);
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 snapshotPath]);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPath:](&OBJC_CLASS___DEAttachmentItem, "attachmentWithPath:", v15));

    v17 = objc_autoreleasePoolPush();
    id v18 = *(id *)(a1 + 32);
    uint64_t v19 = HMFGetOSLogHandle();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = HMFGetLogIdentifier(v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uuid]);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v7 snapshotPath]);
      int v26 = 138543874;
      v27 = v22;
      __int16 v28 = 2112;
      v29 = v23;
      __int16 v30 = 2112;
      id v31 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%{public}@Did save logs for accessory: %@ at %@",  (uint8_t *)&v26,  0x20u);
    }

    objc_autoreleasePoolPop(v17);
    v25 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 12LL);
    os_unfair_lock_lock_with_options(v25, 0LL);
    [*(id *)(a1 + 48) addObject:v16];
    os_unfair_lock_unlock(v25);
  }

  [*(id *)(a1 + 32) _attachDiagnosticsFromAccessory:*(void *)(a1 + 40) diagnosticOptions:*(void *)(a1 + 56) currentOptionIndex:*(void *)(a1 + 72) + 1 attachments:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
}

void sub_1000027CC(_Unwind_Exception *a1)
{
}

void sub_1000027E8(uint64_t a1)
{
}

void sub_100002830(id a1)
{
  uint64_t v1 = HMFCreateOSLogHandle(@"AccessoryDiagnostics", HMFHomeKitLoggingSubsystem);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)qword_100008900;
  qword_100008900 = v2;
}

id objc_msgSend__attachDiagnosticsFromAccessory_diagnosticOptions_currentOptionIndex_attachments_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_attachDiagnosticsFromAccessory:diagnosticOptions:currentOptionIndex:attachments:completion:");
}

id objc_msgSend_initWithLogSizeBytes_delaySeconds_snapshotType_recordAudio_enableAudioClips_cloudkitMetadataRequired_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithLogSizeBytes:delaySeconds:snapshotType:recordAudio:enableAudioClips:cloudkitMetadataRequired:");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         - (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4;
  void *v5;
  AccessoryDiagnosticsExtension *v6;
  uint64_t v7;
  os_log_s *v8;
  uint64_t v9;
  void *v10;
  dispatch_group_s *v11;
  int v12;
  void *v13;
  v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier(v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v12 = 138543362;
    v13 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%{public}@homeManagerDidUpdateHomes called, home data is populated",  (uint8_t *)&v12,  0xCu);
  }

  objc_autoreleasePoolPop(v5);
  v11 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[AccessoryDiagnosticsExtension homeSyncGroup](v6, "homeSyncGroup"));
  dispatch_group_leave(v11);
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (OS_dispatch_group)homeSyncGroup
{
  return self->_homeSyncGroup;
}

- (void)setHomeSyncGroup:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (BOOL)hasMatterAccessory
{
  return self->_hasMatterAccessory;
}

- (void)setHasMatterAccessory:(BOOL)a3
{
  self->_hasMatterAccessory = a3;
}

- (void).cxx_destruct
{
}

+ (id)logCategory
{
  if (qword_1000088F8 != -1) {
    dispatch_once(&qword_1000088F8, &stru_100004260);
  }
  return (id)qword_100008900;
}

@end