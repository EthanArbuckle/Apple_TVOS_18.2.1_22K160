@interface PDSharingChannel_BLEProximityVerificationAncillaryService
- (BOOL)isRunning;
- (id)_initWithDelegate:(id)a3;
- (id)initAdvertiserDelegate:(id)a3 completion:(id)a4;
- (id)initDetectorWithAdvertisement:(id)a3 remoteDevice:(id)a4 delegate:(id)a5 completion:(id)a6;
- (void)_invalidateWithShouldNotify:(BOOL)a3;
- (void)dealloc;
- (void)invalidate;
- (void)start;
@end

@implementation PDSharingChannel_BLEProximityVerificationAncillaryService

- (id)_initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PDSharingChannel_BLEProximityVerificationAncillaryService;
  v5 = -[PDSharingChannel_BLEProximityVerificationAncillaryService init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (id)initAdvertiserDelegate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = -[PDSharingChannel_BLEProximityVerificationAncillaryService _initWithDelegate:](self, "_initWithDelegate:", a3);
  if (v7)
  {
    objc_super v8 = objc_alloc_init(&OBJC_CLASS___PKProximityAdvertiser);
    v9 = (void *)v7[6];
    v7[6] = v8;

    v7[2] = 0LL;
    id v10 = objc_retainBlock(v6);
    v11 = (void *)v7[7];
    v7[7] = v10;
  }

  return v7;
}

- (id)initDetectorWithAdvertisement:(id)a3 remoteDevice:(id)a4 delegate:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  v11 = -[PDSharingChannel_BLEProximityVerificationAncillaryService _initWithDelegate:](self, "_initWithDelegate:", a5);
  if (v11)
  {
    v12 = objc_alloc(&OBJC_CLASS___PKProximityDetector);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 bluetoothUUID]);
    v14 = -[PKProximityDetector initWithAdvertisingDeviceUUID:](v12, "initWithAdvertisingDeviceUUID:", v13);
    v15 = (void *)v11[4];
    v11[4] = v14;

    v11[2] = 1LL;
    id v16 = objc_retainBlock(v10);
    v17 = (void *)v11[5];
    v11[5] = v16;
  }

  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDSharingChannel_BLEProximityVerificationAncillaryService;
  -[PDSharingChannel_BLEProximityVerificationAncillaryService dealloc](&v3, "dealloc");
}

- (BOOL)isRunning
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_isRunning && !self->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)start
{
  if (self->_isRunning)
  {
    self->_isRunning = 0;
    os_unfair_lock_unlock(&self->_lock);
  }

  else
  {
    BOOL invalidated = self->_invalidated;
    self->_isRunning = !invalidated;
    os_unfair_lock_unlock(&self->_lock);
    if (!invalidated)
    {
      unint64_t mode = self->_mode;
      if (mode == 1)
      {
        uint64_t Object = PKLogFacilityTypeGetObject(42LL);
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Starting proximity verification detection",  buf,  2u);
        }

        detector = self->_detector;
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_1000DA9B8;
        v15[3] = &unk_1006420C0;
        objc_super v8 = &v16;
        objc_copyWeak(&v16, &location);
        -[PKProximityDetector setHandler:](detector, "setHandler:", v15);
        v12 = self->_detector;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_1000DAB04;
        v13[3] = &unk_100642098;
        objc_copyWeak(&v14, &location);
        -[PKProximityDetector startDetectingWithDuration:completion:]( v12,  "startDetectingWithDuration:completion:",  v13,  30.0);
        objc_destroyWeak(&v14);
      }

      else
      {
        if (mode) {
          goto LABEL_13;
        }
        uint64_t v5 = PKLogFacilityTypeGetObject(42LL);
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Starting proximity verification advertising",  buf,  2u);
        }

        advertiser = self->_advertiser;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_1000DA868;
        v17[3] = &unk_100642098;
        objc_super v8 = &v18;
        objc_copyWeak(&v18, &location);
        -[PKProximityAdvertiser startAdvertisingForDuration:completion:]( advertiser,  "startAdvertisingForDuration:completion:",  v17,  30.0);
      }

      objc_destroyWeak(v8);
    }
  }

- (void)invalidate
{
}

- (void)_invalidateWithShouldNotify:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    id WeakRetained = 0LL;
    id v6 = 0LL;
    v7 = 0LL;
  }

  else
  {
    *(_WORD *)&self->_BOOL invalidated = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_storeWeak((id *)&self->_delegate, 0LL);
    id v6 = (void (**)(id, void))objc_retainBlock(self->_advertiseCompletion);
    id advertiseCompletion = self->_advertiseCompletion;
    self->_id advertiseCompletion = 0LL;

    -[PKProximityAdvertiser endAdvertising](self->_advertiser, "endAdvertising");
    advertiser = self->_advertiser;
    self->_advertiser = 0LL;

    v7 = (void (**)(id, void))objc_retainBlock(self->_detectionCompletion);
    id detectionCompletion = self->_detectionCompletion;
    self->_id detectionCompletion = 0LL;

    -[PKProximityDetector endDetecting](self->_detector, "endDetecting");
    detector = self->_detector;
    self->_detector = 0LL;
  }

  os_unfair_lock_unlock(p_lock);
  if (v3) {
    [WeakRetained ancillaryServiceDidTerminate:self];
  }
  if (v7) {
    v7[2](v7, 0LL);
  }
  if (v6) {
    v6[2](v6, 0LL);
  }
}

- (void).cxx_destruct
{
}

@end