@interface RPNearbyActionV2Advertiser
- (CBAdvertiser)actionV2Advertiser;
- (NSData)targetData;
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (unsigned)nearbyActionType;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setActionV2Advertiser:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setNearbyActionType:(unsigned __int8)a3;
- (void)setTargetData:(id)a3;
@end

@implementation RPNearbyActionV2Advertiser

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = (CBAdvertiser *)objc_alloc_init(off_100132928());
  actionV2Advertiser = self->_actionV2Advertiser;
  self->_actionV2Advertiser = v5;

  -[CBAdvertiser setDispatchQueue:](self->_actionV2Advertiser, "setDispatchQueue:", self->_dispatchQueue);
  -[CBAdvertiser setNearbyActionV2Type:](self->_actionV2Advertiser, "setNearbyActionV2Type:", self->_nearbyActionType);
  if (self->_targetData)
  {
    -[CBAdvertiser setNearbyActionV2Flags:](self->_actionV2Advertiser, "setNearbyActionV2Flags:", 1LL);
    -[CBAdvertiser setNearbyActionV2TargetData:]( self->_actionV2Advertiser,  "setNearbyActionV2TargetData:",  self->_targetData);
  }

  -[CBAdvertiser setAdvertiseRate:](self->_actionV2Advertiser, "setAdvertiseRate:", 60LL);
  -[CBAdvertiser setLabel:](self->_actionV2Advertiser, "setLabel:", @"CLink");
  v7 = self->_actionV2Advertiser;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100082B30;
  v9[3] = &unk_100112CA8;
  id v10 = v4;
  id v8 = v4;
  -[CBAdvertiser activateWithCompletion:](v7, "activateWithCompletion:", v9);
}

- (void)invalidate
{
  if (dword_1001328B8 <= 30 && (dword_1001328B8 != -1 || _LogCategory_Initialize(&dword_1001328B8, 30LL))) {
    LogPrintF( &dword_1001328B8,  "-[RPNearbyActionV2Advertiser invalidate]",  30LL,  "BLE NearbyActionV2 advertiser stopped\n");
  }
  -[CBAdvertiser invalidate](self->_actionV2Advertiser, "invalidate");
  actionV2Advertiser = self->_actionV2Advertiser;
  self->_actionV2Advertiser = 0LL;
}

- (void)setNearbyActionType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned int nearbyActionType = self->_nearbyActionType;
  if (nearbyActionType != (_DWORD)v3)
  {
    if (dword_1001328B8 <= 30)
    {
      if (dword_1001328B8 == -1)
      {
        unsigned int nearbyActionType = self->_nearbyActionType;
      }

      v6 = sub_100082D70(nearbyActionType);
      v7 = sub_100082D70(v3);
      LogPrintF( &dword_1001328B8,  "-[RPNearbyActionV2Advertiser setNearbyActionType:]",  30LL,  "BLE NearbyActionV2 advertiser action type updated %s -> %s\n",  v6,  v7);
    }

- (void)setTargetData:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = self->_targetData;
  v7 = (NSData *)v5;
  id v10 = v7;
  if (v6 == v7)
  {
  }

  else
  {
    if ((v7 != 0LL) != (v6 == 0LL))
    {
      unsigned __int8 v8 = -[NSData isEqual:](v6, "isEqual:", v7);

      v9 = v10;
      if ((v8 & 1) != 0) {
        goto LABEL_13;
      }
    }

    else
    {
    }

    if (dword_1001328B8 <= 30
      && (dword_1001328B8 != -1 || _LogCategory_Initialize(&dword_1001328B8, 30LL)))
    {
      LogPrintF( &dword_1001328B8,  "-[RPNearbyActionV2Advertiser setTargetData:]",  30LL,  "BLE NearbyActionV2 advertiser target data updated <%.3@> -> <%.3@>\n",  self->_targetData,  v10);
    }

    objc_storeStrong((id *)&self->_targetData, a3);
    -[CBAdvertiser setNearbyActionV2TargetData:]( self->_actionV2Advertiser,  "setNearbyActionV2TargetData:",  self->_targetData);
  }

  v9 = v10;
LABEL_13:
}

- (id)description
{
  id v13 = 0LL;
  NSAppendPrintF(&v13, "RPNearbyActionV2Advertiser: %@", self->_actionV2Advertiser);
  id v3 = v13;
  id v12 = v3;
  id v4 = sub_100082D70(self->_nearbyActionType);
  NSAppendPrintF(&v12, ", AT: %s ", v4);
  id v5 = v12;

  targetData = self->_targetData;
  if (targetData)
  {
    id v11 = v5;
    v7 = self->_targetData;
    unsigned __int8 v8 = targetData;
    NSAppendPrintF(&v11, ", TD: <%.3@> ", v7);
    id v9 = v11;

    id v5 = v9;
  }

  return v5;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unsigned)nearbyActionType
{
  return self->_nearbyActionType;
}

- (NSData)targetData
{
  return self->_targetData;
}

- (CBAdvertiser)actionV2Advertiser
{
  return self->_actionV2Advertiser;
}

- (void)setActionV2Advertiser:(id)a3
{
}

- (void).cxx_destruct
{
}

@end