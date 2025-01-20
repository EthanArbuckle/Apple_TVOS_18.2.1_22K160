@interface CBStackAddressMonitorBTStack
- (NSData)connectableAddressData;
- (NSData)fakeNonConnectableAddressData;
- (NSData)nonConnectableAddressData;
- (NSData)nonConnectableSecondaryAddressData;
- (OS_dispatch_queue)dispatchQueue;
- (id)_dataWithBTAddress:(unint64_t)a3;
- (id)addressChangedHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)invalidationHandler;
- (void)activate;
- (void)addressChanged:(BOOL)a3;
- (void)forceNonConnectableAddressReadAndUpdate:(unsigned __int8)a3;
- (void)invalidate;
- (void)setAddressChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation CBStackAddressMonitorBTStack

- (id)description
{
  return -[CBStackAddressMonitorBTStack descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v4 = 0LL;
  }

  else
  {
    id v14 = 0LL;
    NSAppendPrintF_safe(&v14, "CBStackAddressMonitor: ");
    id v4 = v14;
  }

  id v13 = v4;
  uint64_t v5 = CUPrintNSDataAddress(self->_connectableAddressData);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = CUPrintNSDataAddress(self->_nonConnectableAddressData);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = CUPrintNSDataAddress(self->_nonConnectableSecondaryAddressData);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  NSAppendPrintF_safe(&v13, "CA %@, NC %@, NC2 %@", v6, v8, v10);
  id v11 = v13;

  return v11;
}

- (void)activate
{
  if (!self->_addressChangedHandler)
  {
    FatalErrorF("CBStackAddressMonitor: No addressChangedHandler", a2);
    goto LABEL_9;
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  if (!dispatchQueue)
  {
LABEL_9:
    uint64_t v5 = FatalErrorF("CBStackAddressMonitor: No dispatchQueue", a2);
    sub_100079714(v5, v6);
    return;
  }

  dispatch_assert_queue_V2(dispatchQueue);
  if (!self->_addedMonitor)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1008D9EF8);
    id v4 = (void *)qword_1008D9F00;
    if (!qword_1008D9F00)
    {
      id v4 = operator new(0x18uLL);
      *id v4 = &off_1008816E0;
      v4[1] = 0LL;
      *((_BYTE *)v4 + 16) = 0;
      qword_1008D9F00 = (uint64_t)v4;
    }

    sub_100079714((uint64_t)v4, self);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1008D9EF8);
    self->_addedMonitor = 1;
  }

  -[CBStackAddressMonitorBTStack addressChanged:](self, "addressChanged:", 1LL);
}

- (void)invalidate
{
  if (self->_addedMonitor)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1008D9EF8);
    if (qword_1008D9F00) {
      sub_10007988C(qword_1008D9F00, self);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1008D9EF8);
    self->_addedMonitor = 0;
  }

  id addressChangedHandler = self->_addressChangedHandler;
  self->_id addressChangedHandler = 0LL;

  uint64_t v5 = (void (**)(void))objc_retainBlock(self->_invalidationHandler);
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0LL;

  if (v5) {
    v5[2]();
  }
}

- (void)addressChanged:(BOOL)a3
{
  if (self->_addedMonitor)
  {
    BOOL v3 = a3;
    if (qword_1008D5F10 != -1) {
      dispatch_once(&qword_1008D5F10, &stru_100881780);
    }
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[CBStackAddressMonitorBTStack _dataWithBTAddress:]( self,  "_dataWithBTAddress:",  *((void *)off_1008D5F08 + 36)));
    connectableAddressData = self->_connectableAddressData;
    uint64_t v7 = v5;
    v8 = connectableAddressData;
    BOOL v9 = v7 != v8;
    if (v7 == v8)
    {

      v12 = v7;
    }

    else
    {
      v10 = v8;
      if ((v7 == 0LL) != (v8 != 0LL))
      {
        unsigned __int8 v11 = -[NSData isEqual:](v7, "isEqual:", v8);

        if ((v11 & 1) != 0)
        {
          BOOL v9 = 0;
          goto LABEL_12;
        }
      }

      else
      {
      }

      id v13 = v7;
      v12 = self->_connectableAddressData;
      self->_connectableAddressData = v13;
    }

LABEL_12:
    if (qword_1008D5F10 != -1) {
      dispatch_once(&qword_1008D5F10, &stru_100881780);
    }
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[CBStackAddressMonitorBTStack _dataWithBTAddress:]( self,  "_dataWithBTAddress:",  *((void *)off_1008D5F08 + 37)));
    nonConnectableAddressData = self->_nonConnectableAddressData;
    v16 = v14;
    v17 = nonConnectableAddressData;
    if (v16 == v17)
    {

      v20 = v16;
    }

    else
    {
      v18 = v17;
      if ((v16 == 0LL) != (v17 != 0LL))
      {
        unsigned __int8 v19 = -[NSData isEqual:](v16, "isEqual:", v17);

        if ((v19 & 1) != 0)
        {
LABEL_22:
          if (qword_1008D5F10 != -1) {
            dispatch_once(&qword_1008D5F10, &stru_100881780);
          }
          v22 = (void *)objc_claimAutoreleasedReturnValue( -[CBStackAddressMonitorBTStack _dataWithBTAddress:]( self,  "_dataWithBTAddress:",  *((void *)off_1008D5F08 + 39)));
          nonConnectableSecondaryAddressData = self->_nonConnectableSecondaryAddressData;
          v24 = v22;
          v25 = nonConnectableSecondaryAddressData;
          if (v24 == v25)
          {

            if (!v3)
            {
LABEL_30:
              if (!v9) {
                goto LABEL_38;
              }
LABEL_35:
              id v30 = objc_retainBlock(self->_addressChangedHandler);
              v31 = v30;
              if (v30) {
                (*((void (**)(id))v30 + 2))(v30);
              }

              goto LABEL_38;
            }
          }

          else
          {
            v26 = v25;
            if ((v24 == 0LL) != (v25 != 0LL))
            {
              unsigned __int8 v27 = -[NSData isEqual:](v24, "isEqual:", v25);

              if ((v27 & 1) != 0)
              {
                if (v3) {
                  goto LABEL_34;
                }
                goto LABEL_30;
              }
            }

            else
            {
            }

            objc_storeStrong((id *)&self->_nonConnectableSecondaryAddressData, v22);
            if (!v3) {
              goto LABEL_35;
            }
          }

- (void)forceNonConnectableAddressReadAndUpdate:(unsigned __int8)a3
{
  if (self->_addedMonitor)
  {
    id v6 = -[CBStackAddressMonitorBTStack _dataWithBTAddress:](self, "_dataWithBTAddress:", sub_100079E9C(v5, 1u));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    nonConnectableAddressData = self->_nonConnectableAddressData;
    v23 = v7;
    BOOL v9 = nonConnectableAddressData;
    if (v23 != v9)
    {
      if ((v23 == 0LL) != (v9 != 0LL))
      {
        unsigned int v10 = -[NSData isEqual:](v23, "isEqual:", v9);

        if (v10)
        {
          if ((a3 & 4) == 0) {
            goto LABEL_25;
          }
LABEL_9:
          int v12 = 0;
          goto LABEL_13;
        }
      }

      else
      {
      }

      objc_storeStrong((id *)&self->_nonConnectableAddressData, v7);
      if ((a3 & 4) == 0) {
        goto LABEL_22;
      }
      int v12 = 1;
LABEL_13:
      id v13 = -[CBStackAddressMonitorBTStack _dataWithBTAddress:](self, "_dataWithBTAddress:", sub_100079E9C(v11, 3u));
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      nonConnectableSecondaryAddressData = self->_nonConnectableSecondaryAddressData;
      v16 = v14;
      v17 = nonConnectableSecondaryAddressData;
      if (v16 != v17)
      {
        v18 = v17;
        if ((v16 == 0LL) != (v17 != 0LL))
        {
          unsigned __int8 v19 = -[NSData isEqual:](v16, "isEqual:", v17);

          if ((v19 & 1) != 0)
          {

            if (!v12) {
              goto LABEL_25;
            }
LABEL_22:
            id v21 = objc_retainBlock(self->_addressChangedHandler);
            v22 = v21;
            if (v21) {
              (*((void (**)(id))v21 + 2))(v21);
            }

            goto LABEL_25;
          }
        }

        else
        {
        }

        v20 = self->_nonConnectableSecondaryAddressData;
        self->_nonConnectableSecondaryAddressData = v16;

        goto LABEL_22;
      }

      if ((v12 & 1) == 0) {
        goto LABEL_25;
      }
      goto LABEL_22;
    }

    if ((a3 & 4) == 0)
    {
LABEL_25:

      return;
    }

    goto LABEL_9;
  }

- (id)_dataWithBTAddress:(unint64_t)a3
{
  if (!a3) {
    return 0LL;
  }
  v4[0] = BYTE5(a3);
  v4[1] = BYTE4(a3);
  v4[2] = BYTE3(a3);
  v4[3] = BYTE2(a3);
  v4[4] = BYTE1(a3);
  v4[5] = a3;
  return -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v4, 6LL);
}

- (NSData)connectableAddressData
{
  return self->_connectableAddressData;
}

- (NSData)nonConnectableAddressData
{
  return self->_nonConnectableAddressData;
}

- (NSData)nonConnectableSecondaryAddressData
{
  return self->_nonConnectableSecondaryAddressData;
}

- (NSData)fakeNonConnectableAddressData
{
  return self->_fakeNonConnectableAddressData;
}

- (id)addressChangedHandler
{
  return self->_addressChangedHandler;
}

- (void)setAddressChangedHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end