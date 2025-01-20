@interface RPNearbyActionV2Discovery
- (CBDiscovery)actionV2Discovery;
- (NSMutableArray)actionV2Devices;
- (OS_dispatch_queue)dispatchQueue;
- (RPNearbyActionV2Discovery)init;
- (id)description;
- (id)updateHandler;
- (int)bleScanRate;
- (int)bleScanRateScreenOff;
- (unint64_t)discoveryFlags;
- (unsigned)useCase;
- (void)_deviceFound:(id)a3;
- (void)_deviceLost:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setActionV2Devices:(id)a3;
- (void)setActionV2Discovery:(id)a3;
- (void)setBleScanRate:(int)a3;
- (void)setBleScanRateScreenOff:(int)a3;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setUpdateHandler:(id)a3;
- (void)setUseCase:(unsigned int)a3;
- (void)updateUseCase:(unsigned int)a3 bleScanRate:(int)a4 bleScanRateScreenOff:(int)a5;
@end

@implementation RPNearbyActionV2Discovery

- (RPNearbyActionV2Discovery)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RPNearbyActionV2Discovery;
  v2 = -[RPNearbyActionV2Discovery init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    actionV2Devices = v2->_actionV2Devices;
    v2->_actionV2Devices = v3;

    *(void *)&v2->_useCase = 0x1E00020000LL;
    v2->_bleScanRateScreenOff = 20;
    v5 = v2;
  }

  return v2;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  if (!self->_actionV2Discovery)
  {
    v5 = (CBDiscovery *)objc_alloc_init(off_100131C70());
    actionV2Discovery = self->_actionV2Discovery;
    self->_actionV2Discovery = v5;

    -[CBDiscovery setDispatchQueue:](self->_actionV2Discovery, "setDispatchQueue:", self->_dispatchQueue);
    -[CBDiscovery setDiscoveryFlags:](self->_actionV2Discovery, "setDiscoveryFlags:", self->_discoveryFlags);
    -[CBDiscovery setLabel:](self->_actionV2Discovery, "setLabel:", @"CLink");
    -[CBDiscovery setUseCase:](self->_actionV2Discovery, "setUseCase:", self->_useCase);
    -[CBDiscovery setBleScanRate:](self->_actionV2Discovery, "setBleScanRate:", self->_bleScanRate);
    -[CBDiscovery setBleScanRateScreenOff:]( self->_actionV2Discovery,  "setBleScanRateScreenOff:",  self->_bleScanRateScreenOff);
    -[CBDiscovery setBleRSSIThresholdHint:](self->_actionV2Discovery, "setBleRSSIThresholdHint:", 4294967216LL);
    unsigned int useCase = self->_useCase;
    v8 = sub_10004E6E8(useCase);
    int bleScanRate = self->_bleScanRate;
    if (bleScanRate > 34)
    {
      if (bleScanRate > 49)
      {
        if (bleScanRate == 50)
        {
          v10 = "High";
          goto LABEL_26;
        }

        if (bleScanRate == 60)
        {
          v10 = "Max";
          goto LABEL_26;
        }
      }

      else
      {
        if (bleScanRate == 35)
        {
          v10 = "MediumLow";
          goto LABEL_26;
        }

        if (bleScanRate == 40)
        {
          v10 = "Medium";
          goto LABEL_26;
        }
      }
    }

    else if (bleScanRate > 19)
    {
      if (bleScanRate == 20)
      {
        v10 = "Background";
        goto LABEL_26;
      }

      if (bleScanRate == 30)
      {
        v10 = "Low";
        goto LABEL_26;
      }
    }

    else
    {
      if (!bleScanRate)
      {
        v10 = "Default";
        goto LABEL_26;
      }

      if (bleScanRate == 10)
      {
        v10 = "Periodic";
        goto LABEL_26;
      }
    }

    v10 = "?";
LABEL_26:
    int bleScanRateScreenOff = self->_bleScanRateScreenOff;
    if (bleScanRateScreenOff > 34)
    {
      if (bleScanRateScreenOff > 49)
      {
        if (bleScanRateScreenOff == 50)
        {
          v12 = "High";
          goto LABEL_46;
        }

        if (bleScanRateScreenOff == 60)
        {
          v12 = "Max";
          goto LABEL_46;
        }
      }

      else
      {
        if (bleScanRateScreenOff == 35)
        {
          v12 = "MediumLow";
          goto LABEL_46;
        }

        if (bleScanRateScreenOff == 40)
        {
          v12 = "Medium";
          goto LABEL_46;
        }
      }
    }

    else if (bleScanRateScreenOff > 19)
    {
      if (bleScanRateScreenOff == 20)
      {
        v12 = "Background";
        goto LABEL_46;
      }

      if (bleScanRateScreenOff == 30)
      {
        v12 = "Low";
        goto LABEL_46;
      }
    }

    else
    {
      if (!bleScanRateScreenOff)
      {
        v12 = "Default";
        goto LABEL_46;
      }

      if (bleScanRateScreenOff == 10)
      {
        v12 = "Periodic";
LABEL_46:
        LogPrintF( &dword_100131C00,  "-[RPNearbyActionV2Discovery activateWithCompletion:]",  30LL,  "Activating NearbyActionV2 discovery with: %s (0x%x), %s, %s\n",  v8,  useCase,  v10,  v12);
LABEL_47:
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_10004EE14;
        v17[3] = &unk_100111A80;
        v17[4] = self;
        -[CBDiscovery setDeviceFoundHandler:](self->_actionV2Discovery, "setDeviceFoundHandler:", v17);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_10004EE20;
        v16[3] = &unk_100111A80;
        v16[4] = self;
        -[CBDiscovery setDeviceLostHandler:](self->_actionV2Discovery, "setDeviceLostHandler:", v16);
        v13 = self->_actionV2Discovery;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_10004EE2C;
        v14[3] = &unk_100112CA8;
        id v15 = v4;
        -[CBDiscovery activateWithCompletion:](v13, "activateWithCompletion:", v14);

        goto LABEL_48;
      }
    }

    v12 = "?";
    goto LABEL_46;
  }

- (void)invalidate
{
  actionV2Discovery = self->_actionV2Discovery;
  self->_actionV2Discovery = 0LL;

  -[NSMutableArray removeAllObjects](self->_actionV2Devices, "removeAllObjects");
  actionV2Devices = self->_actionV2Devices;
  self->_actionV2Devices = 0LL;

  id updateHandler = self->_updateHandler;
  self->_id updateHandler = 0LL;

  if (dword_100131C00 <= 30 && (dword_100131C00 != -1 || _LogCategory_Initialize(&dword_100131C00, 30LL))) {
    LogPrintF( &dword_100131C00,  "-[RPNearbyActionV2Discovery invalidate]",  30LL,  "BLE NearbyActionV2 discovery stopped\n");
  }
}

- (void)updateUseCase:(unsigned int)a3 bleScanRate:(int)a4 bleScanRateScreenOff:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_unsigned int useCase = v7;
  self->_int bleScanRate = v6;
  self->_int bleScanRateScreenOff = v5;
  actionV2Discovery = self->_actionV2Discovery;
  if (actionV2Discovery)
  {
    if ((_DWORD)v7 && -[CBDiscovery useCase](actionV2Discovery, "useCase") != (_DWORD)v7)
    {
      if (dword_100131C00 <= 30
        && (dword_100131C00 != -1 || _LogCategory_Initialize(&dword_100131C00, 30LL)))
      {
        v10 = sub_10004E6E8(v7);
        LogPrintF( &dword_100131C00,  "-[RPNearbyActionV2Discovery updateUseCase:bleScanRate:bleScanRateScreenOff:]",  30LL,  "Updating NearbyActionV2 discovery useCase to %s (0x%x)\n",  v10,  v7);
      }

      -[CBDiscovery setUseCase:](self->_actionV2Discovery, "setUseCase:", v7);
    }

    if (-[CBDiscovery bleScanRate](self->_actionV2Discovery, "bleScanRate") == (_DWORD)v6)
    {
LABEL_36:
      if (dword_100131C00 > 30
        || dword_100131C00 == -1 && !_LogCategory_Initialize(&dword_100131C00, 30LL))
      {
LABEL_63:
        -[CBDiscovery setBleScanRateScreenOff:](self->_actionV2Discovery, "setBleScanRateScreenOff:", v5);
        return;
      }

      if ((int)v5 > 34)
      {
        if ((int)v5 > 49)
        {
          if ((_DWORD)v5 == 50)
          {
            v12 = "High";
            goto LABEL_62;
          }

          if ((_DWORD)v5 == 60)
          {
            v12 = "Max";
            goto LABEL_62;
          }
        }

        else
        {
          if ((_DWORD)v5 == 35)
          {
            v12 = "MediumLow";
            goto LABEL_62;
          }

          if ((_DWORD)v5 == 40)
          {
            v12 = "Medium";
            goto LABEL_62;
          }
        }
      }

      else if ((int)v5 > 19)
      {
        if ((_DWORD)v5 == 20)
        {
          v12 = "Background";
          goto LABEL_62;
        }

        if ((_DWORD)v5 == 30)
        {
          v12 = "Low";
          goto LABEL_62;
        }
      }

      else
      {
        if (!(_DWORD)v5)
        {
          v12 = "Default";
          goto LABEL_62;
        }

        if ((_DWORD)v5 == 10)
        {
          v12 = "Periodic";
LABEL_62:
          LogPrintF( &dword_100131C00,  "-[RPNearbyActionV2Discovery updateUseCase:bleScanRate:bleScanRateScreenOff:]",  30LL,  "Updating NearbyActionV2 discovery bleScanRateScreenOff to %s\n",  v12);
          goto LABEL_63;
        }
      }

      v12 = "?";
      goto LABEL_62;
    }

    if (dword_100131C00 > 30 || dword_100131C00 == -1 && !_LogCategory_Initialize(&dword_100131C00, 30LL))
    {
LABEL_35:
      -[CBDiscovery setBleScanRate:](self->_actionV2Discovery, "setBleScanRate:", v6);
      goto LABEL_36;
    }

    if ((int)v6 > 34)
    {
      if ((int)v6 > 49)
      {
        if ((_DWORD)v6 == 50)
        {
          v11 = "High";
          goto LABEL_34;
        }

        if ((_DWORD)v6 == 60)
        {
          v11 = "Max";
          goto LABEL_34;
        }
      }

      else
      {
        if ((_DWORD)v6 == 35)
        {
          v11 = "MediumLow";
          goto LABEL_34;
        }

        if ((_DWORD)v6 == 40)
        {
          v11 = "Medium";
          goto LABEL_34;
        }
      }
    }

    else if ((int)v6 > 19)
    {
      if ((_DWORD)v6 == 20)
      {
        v11 = "Background";
        goto LABEL_34;
      }

      if ((_DWORD)v6 == 30)
      {
        v11 = "Low";
        goto LABEL_34;
      }
    }

    else
    {
      if (!(_DWORD)v6)
      {
        v11 = "Default";
        goto LABEL_34;
      }

      if ((_DWORD)v6 == 10)
      {
        v11 = "Periodic";
LABEL_34:
        LogPrintF( &dword_100131C00,  "-[RPNearbyActionV2Discovery updateUseCase:bleScanRate:bleScanRateScreenOff:]",  30LL,  "Updating NearbyActionV2 discovery bleScanRate to %s\n",  v11);
        goto LABEL_35;
      }
    }

    v11 = "?";
    goto LABEL_34;
  }

- (void)_deviceFound:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stableIdentifier]);
  if (v5 || (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier])) != 0)
  {
    actionV2Devices = self->_actionV2Devices;
    if (!actionV2Devices)
    {
      uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v8 = self->_actionV2Devices;
      self->_actionV2Devices = v7;

      actionV2Devices = self->_actionV2Devices;
    }

    if ((-[NSMutableArray containsObject:](actionV2Devices, "containsObject:", v5) & 1) != 0)
    {
      if (dword_100131C00 <= 30
        && (dword_100131C00 != -1 || _LogCategory_Initialize(&dword_100131C00, 30LL)))
      {
        LogPrintF( &dword_100131C00,  "-[RPNearbyActionV2Discovery _deviceFound:]",  30LL,  "BLE NearbyActionV2 device changed: %@\n",  v4);
      }
    }

    else
    {
      -[NSMutableArray addObject:](self->_actionV2Devices, "addObject:", v5);
      if (dword_100131C00 <= 30
        && (dword_100131C00 != -1 || _LogCategory_Initialize(&dword_100131C00, 30LL)))
      {
        LogPrintF( &dword_100131C00,  "-[RPNearbyActionV2Discovery _deviceFound:]",  30LL,  "BLE NearbyActionV2 device found: %@\n",  v4);
      }

      id v9 = sub_10004F564();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      id v11 = sub_10004F564();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);

      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v4;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_EVENT,  v13,  "BLE NearbyActionV2 device found",  "BLE NearbyActionV2 device found: %@\n",  buf,  0xCu);
      }
    }

    id v14 = objc_retainBlock(self->_updateHandler);
    id v15 = v14;
    if (v14) {
      (*((void (**)(id))v14 + 2))(v14);
    }
  }

  else if (dword_100131C00 <= 90 {
         && (dword_100131C00 != -1 || _LogCategory_Initialize(&dword_100131C00, 90LL)))
  }
  {
    LogPrintF( &dword_100131C00,  "-[RPNearbyActionV2Discovery _deviceFound:]",  90LL,  "### Ignoring BLE NearbyActionV2 device found: No ID, %@\n",  v4);
  }
}

- (void)_deviceLost:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 stableIdentifier]);
  if (v4 || (id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier])) != 0)
  {
    if (-[NSMutableArray containsObject:](self->_actionV2Devices, "containsObject:", v4))
    {
      -[NSMutableArray removeObject:](self->_actionV2Devices, "removeObject:", v4);
      if (dword_100131C00 <= 30
        && (dword_100131C00 != -1 || _LogCategory_Initialize(&dword_100131C00, 30LL)))
      {
        LogPrintF( &dword_100131C00,  "-[RPNearbyActionV2Discovery _deviceLost:]",  30LL,  "BLE NearbyActionV2 device lost: %@\n",  v7);
      }

      id v5 = objc_retainBlock(self->_updateHandler);
      uint64_t v6 = v5;
      if (v5) {
        (*((void (**)(id))v5 + 2))(v5);
      }
    }
  }

  else
  {
    if (dword_100131C00 <= 90
      && (dword_100131C00 != -1 || _LogCategory_Initialize(&dword_100131C00, 90LL)))
    {
      LogPrintF( &dword_100131C00,  "-[RPNearbyActionV2Discovery _deviceLost:]",  90LL,  "### Ignoring BLE NearbyActionV2 device lost: %@\n",  v7);
    }

    id v4 = 0LL;
  }
}

- (id)description
{
  id v9 = 0LL;
  NSAppendPrintF(&v9, "RPNearbyActionV2Discovery: ");
  id v3 = v9;
  id v8 = v3;
  NSAppendPrintF(&v8, "%@", self->_actionV2Discovery);
  id v4 = v8;

  id v7 = v4;
  NSAppendPrintF(&v7, ", Devices %lu", -[NSMutableArray count](self->_actionV2Devices, "count"));
  id v5 = v7;

  return v5;
}

- (NSMutableArray)actionV2Devices
{
  return self->_actionV2Devices;
}

- (void)setActionV2Devices:(id)a3
{
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_discoveryFlags = a3;
}

- (unsigned)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(unsigned int)a3
{
  self->_unsigned int useCase = a3;
}

- (int)bleScanRate
{
  return self->_bleScanRate;
}

- (void)setBleScanRate:(int)a3
{
  self->_int bleScanRate = a3;
}

- (int)bleScanRateScreenOff
{
  return self->_bleScanRateScreenOff;
}

- (void)setBleScanRateScreenOff:(int)a3
{
  self->_int bleScanRateScreenOff = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (CBDiscovery)actionV2Discovery
{
  return self->_actionV2Discovery;
}

- (void)setActionV2Discovery:(id)a3
{
}

- (void).cxx_destruct
{
}

@end