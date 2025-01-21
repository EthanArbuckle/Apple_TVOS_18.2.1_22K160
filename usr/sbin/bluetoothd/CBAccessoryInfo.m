@interface CBAccessoryInfo
- (CBDevice)cbDevice;
- (CBDevice)primaryCBDevice;
- (NSMutableDictionary)powerSourceDetailsCase;
- (NSMutableDictionary)powerSourceDetailsLeft;
- (NSMutableDictionary)powerSourceDetailsRight;
- (OpaqueIOPSPowerSourceID)powerSourceIDCase;
- (OpaqueIOPSPowerSourceID)powerSourceIDLeft;
- (OpaqueIOPSPowerSourceID)powerSourceIDRight;
- (id)description;
- (void)_powerSourceUpdateWithPartID:(const char *)a3;
- (void)invalidate;
- (void)powerSourceRemove;
- (void)powerSourceUpdate;
- (void)setCbDevice:(id)a3;
- (void)setPowerSourceDetailsCase:(id)a3;
- (void)setPowerSourceDetailsLeft:(id)a3;
- (void)setPowerSourceDetailsRight:(id)a3;
- (void)setPowerSourceIDCase:(OpaqueIOPSPowerSourceID *)a3;
- (void)setPowerSourceIDLeft:(OpaqueIOPSPowerSourceID *)a3;
- (void)setPowerSourceIDRight:(OpaqueIOPSPowerSourceID *)a3;
- (void)setPrimaryCBDevice:(id)a3;
@end

@implementation CBAccessoryInfo

- (id)description
{
  uint64_t v3 = objc_opt_class(self);
  uint64_t v4 = [self->_cbDevice identifier];
  v5 = (void *)v4;
  v6 = "yes";
  if (self->_powerSourceIDLeft) {
    v7 = "yes";
  }
  else {
    v7 = "no";
  }
  if (self->_powerSourceIDRight) {
    v8 = "yes";
  }
  else {
    v8 = "no";
  }
  if (!self->_powerSourceIDCase) {
    v6 = "no";
  }
  uint64_t v9 = NSPrintF_safe("%@: ID %@, PowerSources Left %s, Right %s, Case %s", v3, v4, v7, v8, v6);
  v10 = (void *)[v9 autorelease];

  return v10;
}

- (void)invalidate
{
}

- (void)powerSourceUpdate
{
  if (-[CBDevice proximityPairingProductID](self->_cbDevice, "proximityPairingProductID")
    && (-[CBDevice accessoryStatusFlags](self->_cbDevice, "accessoryStatusFlags") & 1) != 0)
  {
    -[CBAccessoryInfo _powerSourceUpdateWithPartID:](self, "_powerSourceUpdateWithPartID:", "Left");
    -[CBAccessoryInfo _powerSourceUpdateWithPartID:](self, "_powerSourceUpdateWithPartID:", "Right");
  }

  else
  {
    powerSourceIDLeft = self->_powerSourceIDLeft;
    if (powerSourceIDLeft)
    {
      uint64_t v5 = IOPSReleasePowerSource(powerSourceIDLeft, v3);
      if (dword_1008D5F68 < 31)
      {
        uint64_t v6 = v5;
        if (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL))
        {
          uint64_t v7 = CUPrintErrorCode(v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
          LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryInfo powerSourceUpdate]",  30LL,  "Accessory power source remove: lid open, left, %@, %@",  self,  v8);
        }
      }

      self->_powerSourceIDLeft = 0LL;
    }

    powerSourceDetailsLeft = self->_powerSourceDetailsLeft;
    self->_powerSourceDetailsLeft = 0LL;

    powerSourceIDRight = self->_powerSourceIDRight;
    if (powerSourceIDRight)
    {
      uint64_t v12 = IOPSReleasePowerSource(powerSourceIDRight, v10);
      if (dword_1008D5F68 < 31)
      {
        uint64_t v13 = v12;
        if (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL))
        {
          uint64_t v14 = CUPrintErrorCode(v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryInfo powerSourceUpdate]",  30LL,  "Accessory power source remove: lid open, right, %@, %@",  self,  v15);
        }
      }

      self->_powerSourceIDRight = 0LL;
    }

    powerSourceDetailsRight = self->_powerSourceDetailsRight;
    self->_powerSourceDetailsRight = 0LL;
  }

  -[CBAccessoryInfo _powerSourceUpdateWithPartID:](self, "_powerSourceUpdateWithPartID:", "Case");
}

- (void)_powerSourceUpdateWithPartID:(const char *)a3
{
  uint64_t v5 = self->_cbDevice;
  uint64_t v6 = (void *)[v5 identifier];
  if (v6)
  {
    unsigned int v7 = -[CBDevice proximityPairingProductID](v5, "proximityPairingProductID");
    unsigned int v8 = -[CBDevice proximityPairingProductID](v5, "proximityPairingProductID");
    v103 = self;
    if (v8 == 8213) {
      unsigned int v9 = 8212;
    }
    else {
      unsigned int v9 = v7;
    }
    unsigned int v10 = -[CBDevice proximityPairingProductID](v5, "proximityPairingProductID");
    if (v10 == 8216) {
      unsigned int v9 = 8228;
    }
    unsigned int v11 = -[CBDevice proximityPairingProductID](v5, "proximityPairingProductID");
    uint64_t v12 = v11 == 8220 ? 8219LL : v9;
    BOOL v13 = v11 == 8220 || v10 == 8216;
    if (v13 || v8 == 8213)
    {
      if (!strcmp(a3, "Left"))
      {
        -[CBDevice batteryLevelLeft](v5, "batteryLevelLeft");
        float v16 = v15;
        unsigned int v18 = -[CBDevice batteryStateLeft](v5, "batteryStateLeft");
        uint64_t v19 = 3LL;
        uint64_t v20 = 2LL;
      }

      else
      {
        if (strcmp(a3, "Right"))
        {
          if (strcmp(a3, "Case"))
          {
            if (dword_1008D5F68 <= 90
              && (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 90LL)))
            {
              LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryInfo _powerSourceUpdateWithPartID:]",  90LL,  "### Accessory power source update failed: bad part ID '%s', %@",  a3,  self);
            }

            goto LABEL_155;
          }

          -[CBDevice batteryLevelCase](v5, "batteryLevelCase");
          float v16 = v41;
          unsigned int v18 = -[CBDevice batteryStateCase](v5, "batteryStateCase");
          uint64_t v19 = 7LL;
          uint64_t v20 = 6LL;
          v22 = "Audio Battery Case";
LABEL_27:
          v23 = (id *)&(&self->super.isa)[v20];
          if (!v18)
          {
            Class v35 = (&self->super.isa)[v19];
            if (v35)
            {
              uint64_t v36 = IOPSReleasePowerSource(v35, v17);
              if (dword_1008D5F68 <= 30)
              {
                uint64_t v37 = v36;
                if (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL))
                {
                  uint64_t v38 = CUPrintErrorCode(v37);
                  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
                  LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryInfo _powerSourceUpdateWithPartID:]",  30LL,  "Accessory power source remove: state unknown, %s, %@, %@",  a3,  self,  v39);
                }
              }

              (&self->super.isa)[v19] = 0LL;
            }

            id v45 = *v23;
            id *v23 = 0LL;

            goto LABEL_155;
          }

          uint64_t v100 = v19 * 8;
          v24 = (NSMutableDictionary *)*v23;
          BOOL v102 = v24 == 0LL;
          if (!v24)
          {
            v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            objc_storeStrong(v23, v24);
            v25 = [NSString stringWithUTF8String:v22];
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v24,  "setObject:forKeyedSubscript:",  v25,  @"Accessory Category");

            -[NSMutableDictionary setObject:forKeyedSubscript:]( v24,  "setObject:forKeyedSubscript:",  v6,  @"Accessory Identifier");
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v24,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"Is Present");
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v24,  "setObject:forKeyedSubscript:",  &off_1008C26A8,  @"Max Capacity");
            v26 = [NSString stringWithUTF8String:a3];
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v24,  "setObject:forKeyedSubscript:",  v26,  @"Part Identifier");

            v27 = [NSNumber numberWithUnsignedInt:v12];
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v24,  "setObject:forKeyedSubscript:",  v27,  @"Product ID");

            -[NSMutableDictionary setObject:forKeyedSubscript:]( v24,  "setObject:forKeyedSubscript:",  @"Bluetooth LE",  @"Transport Type");
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v24,  "setObject:forKeyedSubscript:",  @"Accessory Source",  @"Type");
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v24,  "setObject:forKeyedSubscript:",  &off_1008C26C0,  @"Vendor ID");
            v28 = [NSNumber numberWithUnsignedChar: -[CBDevice vendorIDSource](v5, "vendorIDSource")];
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v24,  "setObject:forKeyedSubscript:",  v28,  @"Vendor ID Source");

            v29 = [v5 btAddressData];
            uint64_t v30 = CUPrintNSDataAddress(v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v24,  "setObject:forKeyedSubscript:",  v31,  @"Group Identifier");
          }

          int v32 = strcmp(a3, "Case");
          v33 = [v24 objectForKeyedSubscript:@"Name"];
          if (v32)
          {
            v34 = [self->_primaryCBDevice name];
            goto LABEL_82;
          }

          id v40 = -[CBDevice proximityPairingProductID](v5, "proximityPairingProductID");
          if ((int)v40 > 665)
          {
            if ((int)v40 <= 799)
            {
              if ((int)v40 > 776)
              {
                switch((int)v40)
                {
                  case 777:
                    v42 = [NSBundle bundleWithIdentifier:@"com.apple.CoreBluetooth"];
                    v43 = v42;
                    v44 = @"apple_wireless_mouse";
                    goto LABEL_80;
                  case 780:
                    v42 = [NSBundle bundleWithIdentifier:@"com.apple.CoreBluetooth"];
                    v43 = v42;
                    v44 = @"apple_mighty_mouse";
                    goto LABEL_80;
                  case 781:
LABEL_74:
                    v42 = [NSBundle bundleWithIdentifier:@"com.apple.CoreBluetooth"];
                    v43 = v42;
                    v44 = @"apple_magic_mouse";
                    goto LABEL_80;
                  case 782:
LABEL_65:
                    v42 = [NSBundle bundleWithIdentifier:@"com.apple.CoreBluetooth"];
                    v43 = v42;
                    v44 = @"apple_magic_trackpad";
                    goto LABEL_80;
                  default:
                    goto LABEL_160;
                }
              }

              switch((_DWORD)v40)
              {
                case 0x29A:
LABEL_156:
                  v42 = [NSBundle bundleWithIdentifier:@"com.apple.CoreBluetooth"];
                  v43 = v42;
                  v44 = @"apple_magic_keyboard_touch";
                  break;
                case 0x29C:
LABEL_75:
                  v42 = [NSBundle bundleWithIdentifier:@"com.apple.CoreBluetooth"];
                  v43 = v42;
                  v44 = @"apple_magic_keyboard";
                  break;
                case 0x29F:
LABEL_73:
                  v42 = [NSBundle bundleWithIdentifier:@"com.apple.CoreBluetooth"];
                  v43 = v42;
                  v44 = @"apple_magic_keyboard_touch_keypad";
                  break;
                default:
LABEL_160:
                  v43 = (void *)objc_claimAutoreleasedReturnValue( +[CBProductInfo productInfoWithProductID:]( &OBJC_CLASS___CBProductInfo,  "productInfoWithProductID:",  v40));
                  uint64_t v46 = [v43 productName];
                  goto LABEL_81;
              }
            }

            else
            {
              if ((int)v40 <= 8212)
              {
                switch((int)v40)
                {
                  case 800:
                    goto LABEL_75;
                  case 801:
                    goto LABEL_156;
                  case 802:
                    goto LABEL_73;
                  case 803:
                    goto LABEL_74;
                  case 804:
                    goto LABEL_65;
                  default:
                    goto LABEL_160;
                }
              }

              if ((_DWORD)v40 != 8220 && (_DWORD)v40 != 8216 && (_DWORD)v40 != 8213) {
                goto LABEL_160;
              }
              v42 = [NSBundle bundleWithIdentifier:@"com.apple.CoreBluetooth"];
              v43 = v42;
              v44 = @"apple_airpods_case";
            }
          }

          else
          {
            if ((int)v40 > 570)
            {
              if ((int)v40 > 598)
              {
                switch((int)v40)
                {
                  case 613:
                    goto LABEL_65;
                  case 614:
                  case 616:
                  case 618:
                  case 619:
                    goto LABEL_160;
                  case 615:
                    goto LABEL_75;
                  case 617:
                    goto LABEL_74;
                  case 620:
                    v42 = [NSBundle bundleWithIdentifier:@"com.apple.CoreBluetooth"];
                    v43 = v42;
                    v44 = @"apple_magic_keyboard_keypad";
                    goto LABEL_80;
                  default:
                    if ((_DWORD)v40 != 599) {
                      goto LABEL_160;
                    }
                    goto LABEL_79;
                }
              }

              if ((_DWORD)v40 != 571 && (_DWORD)v40 != 597 && (_DWORD)v40 != 598) {
                goto LABEL_160;
              }
            }

            else if ((int)v40 <= 555)
            {
              if ((int)v40 > 520)
              {
                if ((_DWORD)v40 != 521 && (_DWORD)v40 != 522) {
                  goto LABEL_160;
                }
              }

              else
              {
                if (!(_DWORD)v40)
                {
                  v34 = 0LL;
LABEL_82:
                  v101 = v6;
                  if (v34)
                  {
                    id v47 = v33;
                    id v48 = v34;
                    if (v47 == v48)
                    {
                    }

                    else
                    {
                      v49 = v48;
                      if (v47)
                      {
                        unsigned __int8 v50 = [v47 isEqual:v48];

                        if ((v50 & 1) != 0) {
                          goto LABEL_90;
                        }
                      }

                      else
                      {
                      }

                      -[NSMutableDictionary setObject:forKeyedSubscript:]( v24,  "setObject:forKeyedSubscript:",  v49,  @"Name");
                      BOOL v102 = 1;
                    }
                  }

- (void)powerSourceRemove
{
  powerSourceIDLeft = self->_powerSourceIDLeft;
  if (powerSourceIDLeft)
  {
    uint64_t v4 = IOPSReleasePowerSource(powerSourceIDLeft, a2);
    if (dword_1008D5F68 < 31)
    {
      uint64_t v5 = v4;
      if (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL))
      {
        uint64_t v6 = CUPrintErrorCode(v5);
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
        LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryInfo powerSourceRemove]",  30LL,  "Accessory power source remove: left, %@, %@",  self,  v7);
      }
    }

    self->_powerSourceIDLeft = 0LL;
  }

  powerSourceDetailsLeft = self->_powerSourceDetailsLeft;
  self->_powerSourceDetailsLeft = 0LL;

  powerSourceIDRight = self->_powerSourceIDRight;
  if (powerSourceIDRight)
  {
    uint64_t v11 = IOPSReleasePowerSource(powerSourceIDRight, v9);
    if (dword_1008D5F68 < 31)
    {
      uint64_t v12 = v11;
      if (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL))
      {
        uint64_t v13 = CUPrintErrorCode(v12);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryInfo powerSourceRemove]",  30LL,  "Accessory power source remove: right, %@, %@",  self,  v14);
      }
    }

    self->_powerSourceIDRight = 0LL;
  }

  powerSourceDetailsRight = self->_powerSourceDetailsRight;
  self->_powerSourceDetailsRight = 0LL;

  powerSourceIDCase = self->_powerSourceIDCase;
  if (powerSourceIDCase)
  {
    uint64_t v18 = IOPSReleasePowerSource(powerSourceIDCase, v16);
    if (dword_1008D5F68 < 31)
    {
      uint64_t v19 = v18;
      if (dword_1008D5F68 != -1 || _LogCategory_Initialize(&dword_1008D5F68, 30LL))
      {
        uint64_t v20 = CUPrintErrorCode(v19);
        float v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        LogPrintF_safe( &dword_1008D5F68,  "-[CBAccessoryInfo powerSourceRemove]",  30LL,  "Accessory power source remove: case, %@, %@",  self,  v21);
      }
    }

    self->_powerSourceIDCase = 0LL;
  }

  powerSourceDetailsCase = self->_powerSourceDetailsCase;
  self->_powerSourceDetailsCase = 0LL;
}

- (CBDevice)cbDevice
{
  return self->_cbDevice;
}

- (void)setCbDevice:(id)a3
{
}

- (NSMutableDictionary)powerSourceDetailsLeft
{
  return self->_powerSourceDetailsLeft;
}

- (void)setPowerSourceDetailsLeft:(id)a3
{
}

- (OpaqueIOPSPowerSourceID)powerSourceIDLeft
{
  return self->_powerSourceIDLeft;
}

- (void)setPowerSourceIDLeft:(OpaqueIOPSPowerSourceID *)a3
{
  self->_powerSourceIDLeft = a3;
}

- (NSMutableDictionary)powerSourceDetailsRight
{
  return self->_powerSourceDetailsRight;
}

- (void)setPowerSourceDetailsRight:(id)a3
{
}

- (OpaqueIOPSPowerSourceID)powerSourceIDRight
{
  return self->_powerSourceIDRight;
}

- (void)setPowerSourceIDRight:(OpaqueIOPSPowerSourceID *)a3
{
  self->_powerSourceIDRight = a3;
}

- (NSMutableDictionary)powerSourceDetailsCase
{
  return self->_powerSourceDetailsCase;
}

- (void)setPowerSourceDetailsCase:(id)a3
{
}

- (OpaqueIOPSPowerSourceID)powerSourceIDCase
{
  return self->_powerSourceIDCase;
}

- (void)setPowerSourceIDCase:(OpaqueIOPSPowerSourceID *)a3
{
  self->_powerSourceIDCase = a3;
}

- (CBDevice)primaryCBDevice
{
  return self->_primaryCBDevice;
}

- (void)setPrimaryCBDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end