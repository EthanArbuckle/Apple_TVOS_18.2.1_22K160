@interface IOHIDUPSClass
- (BOOL)pollEventUpdate;
- (BOOL)updateEvent;
- (IOHIDUPSClass)init;
- (id)copyElements:(id)a3 psKey:(id)a4;
- (id)latestElement:(id)a3 psKey:(id)a4;
- (int)createAsyncEventSource:(const void *)a3;
- (int)getCapabilities:(const __CFSet *)a3;
- (int)getEvent:(const __CFDictionary *)a3;
- (int)getProperties:(const __CFDictionary *)a3;
- (int)probe:(id)a3 service:(unsigned int)a4 outScore:(int *)a5;
- (int)queryInterface:(id)a3 outInterface:(void *)a4;
- (int)sendCommand:(id)a3;
- (int)setEventCallback:(void *)a3 target:(void *)a4 refcon:(void *)a5;
- (int)start:(id)a3 service:(unsigned int)a4;
- (int)stop;
- (void)dealloc;
- (void)initialEventUpdate;
- (void)parseElements:(id)a3;
- (void)parseProperties:(id)a3;
- (void)updateElements:(id)a3;
- (void)valueAvailableCallback:(int)a3;
@end

@implementation IOHIDUPSClass

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  CFUUIDRef v6 = CFUUIDCreateFromUUIDBytes(0LL, (CFUUIDBytes)a3);
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes( (CFAllocatorRef)*MEMORY[0x189604DD0],  0,  0,  0,  0,  0,  0,  0,  0,  0xC0u,  0,  0,  0,  0,  0,  0,  0x46u);
  if (CFEqual(v6, v7)
    || (CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu),  CFEqual(v6, v8)))
  {
    v9 = &OBJC_IVAR___IOHIDPlugin__plugin;
  }

  else
  {
    CFUUIDRef v12 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x63u,  0xF8u,  0xBFu,  0xC4u,  0x26u,  0xA0u,  0x11u,  0xD8u,  0x88u,  0xB4u,  0,  0xAu,  0x95u,  0x8Au,  0x2Cu,  0x78u);
    if (!CFEqual(v6, v12))
    {
      CFUUIDRef v13 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xE6u,  0xEu,  7u,  0x99u,  0x9Au,  0xA6u,  0x49u,  0xDFu,  0xB5u,  0x5Bu,  0xA5u,  0xC9u,  0x4Bu,  0xA0u,  0x7Au,  0x4Au);
      if (!CFEqual(v6, v13))
      {
        int v10 = -2147483644;
        if (!v6) {
          return v10;
        }
        goto LABEL_5;
      }
    }

    v9 = &OBJC_IVAR___IOHIDUPSClass__ups;
  }

  *a4 = (char *)self + *v9;
  CFRetain(self);
  int v10 = 0;
  if (v6) {
LABEL_5:
  }
    CFRelease(v6);
  return v10;
}

- (int)probe:(id)a3 service:(unsigned int)a4 outScore:(int *)a5
{
  if (IOObjectConformsTo(a4, "IOHIDDevice")) {
    return 0;
  }
  else {
    return -536870201;
  }
}

- (void)parseProperties:(id)a3
{
  uint64_t v84 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)@"Transport", v6, v7);
  CFUUIDRef v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v9, (uint64_t)v8, (uint64_t)@"Transport Type", v10);

  objc_msgSend_objectForKeyedSubscript_(v4, v11, (uint64_t)@"Product", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v15, (uint64_t)v14, (uint64_t)@"Name", v16);

  objc_msgSend_objectForKeyedSubscript_(self->_properties, v17, (uint64_t)@"Name", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v21, (uint64_t)@"Manufacturer", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v25, (uint64_t)v24, (uint64_t)@"Name", v26);
  }

  objc_msgSend_objectForKeyedSubscript_(v4, v21, (uint64_t)@"VendorID", v22, v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v28, (uint64_t)v27, (uint64_t)@"Vendor ID", v29);

  objc_msgSend_objectForKeyedSubscript_(v4, v30, (uint64_t)@"ProductID", v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v34, (uint64_t)v33, (uint64_t)@"Product ID", v35);

  objc_msgSend_objectForKeyedSubscript_(v4, v36, (uint64_t)@"SerialNumber", v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( self->_properties,  v40,  (uint64_t)v39,  (uint64_t)@"Accessory Identifier",  v41);

  objc_msgSend_objectForKey_(v4, v42, (uint64_t)@"ModelNumber", v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    objc_msgSend_objectForKey_(v4, v46, (uint64_t)@"ModelNumber", v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v50, (uint64_t)v49, (uint64_t)@"Model Number", v51);
  }

  objc_msgSend_objectForKeyedSubscript_(v4, v46, (uint64_t)@"PrimaryUsagePage", v47, v48);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  int v57 = objc_msgSend_intValue(v52, v53, v54, v55, v56);

  objc_msgSend_objectForKeyedSubscript_(v4, v58, (uint64_t)@"PrimaryUsage", v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  int v66 = objc_msgSend_intValue(v61, v62, v63, v64, v65);

  objc_msgSend_objectForKeyedSubscript_(v4, v67, (uint64_t)@"Accessory Category", v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v71, (uint64_t)@"Accessory Category", v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_( self->_properties,  v75,  (uint64_t)v74,  (uint64_t)@"Accessory Category",  v76);
  }

  else if (v57 == 1 && v66 == 6)
  {
    objc_msgSend_setObject_forKeyedSubscript_( self->_properties,  v71,  (uint64_t)@"Keyboard",  (uint64_t)@"Accessory Category",  v73);
  }

  else if (v57 == 1 && v66 == 2)
  {
    objc_msgSend_setObject_forKeyedSubscript_( self->_properties,  v71,  (uint64_t)@"Mouse",  (uint64_t)@"Accessory Category",  v73);
  }

  else
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v71, (uint64_t)@"GameControllerType", v72, v73);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (v77) {
      objc_msgSend_setObject_forKeyedSubscript_( self->_properties,  v78,  (uint64_t)@"Game Controller",  (uint64_t)@"Accessory Category",  v79);
    }
  }

  _IOHIDLogCategory();
  v80 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
  {
    properties = self->_properties;
    int v82 = 138412290;
    v83 = properties;
    _os_log_impl(&dword_189088000, v80, OS_LOG_TYPE_DEFAULT, "properties: %@", (uint8_t *)&v82, 0xCu);
  }
}

- (void)parseElements:(id)a3
{
  uint64_t v155 = *MEMORY[0x1895F89C0];
  __int128 v147 = 0u;
  __int128 v148 = 0u;
  __int128 v149 = 0u;
  __int128 v150 = 0u;
  obuint64_t j = a3;
  uint64_t v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v147, (uint64_t)v154, 16);
  if (v139)
  {
    uint64_t v138 = *(void *)v148;
    *(void *)&__int128 v8 = 67109376LL;
    __int128 v135 = v8;
    do
    {
      for (uint64_t i = 0LL; i != v139; ++i)
      {
        if (*(void *)v148 != v138) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v147 + 1) + 8 * i);
        v11 = objc_alloc(&OBJC_CLASS___HIDLibElement);
        v15 = (void *)objc_msgSend_initWithElementRef_(v11, v12, v10, v13, v14);
        id v16 = objc_alloc_init(MEMORY[0x189603FA8]);
        unsigned int v21 = objc_msgSend_type(v15, v17, v18, v19, v20);
        int v26 = objc_msgSend_type(v15, v22, v23, v24, v25);
        int v31 = objc_msgSend_usagePage(v15, v27, v28, v29, v30);
        uint64_t v141 = i;
        if (v31 > 65279)
        {
          if (v31 == 65280)
          {
            if (objc_msgSend_usage(v15, v32, v33, v34, v35) == 33)
            {
              objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Device Color", v34, v35, v135);
LABEL_107:
              objc_msgSend_setIsConstant_(v15, v40, 1, v41, v42);
            }
          }

          else if (v31 == 65293)
          {
            int v37 = objc_msgSend_usage(v15, v32, v33, v34, v35);
            if (v37 <= 4095)
            {
              switch(v37)
              {
                case 1:
                  uint64_t v38 = @"AppleRawCurrentCapacity";
                  goto LABEL_113;
                case 2:
                  uint64_t v38 = @"Nominal Capacity";
                  goto LABEL_113;
                case 3:
                  uint64_t v38 = @"Battery Case Cumulative Current";
                  goto LABEL_113;
                case 4:
                  uint64_t v38 = @"FamilyCode";
                  goto LABEL_113;
                case 5:
                  if (v26 == 129) {
                    uint64_t v38 = @"Set Address";
                  }
                  else {
                    uint64_t v38 = @"Address";
                  }
                  goto LABEL_113;
                case 6:
                  uint64_t v38 = @"Battery Case Charging Voltage";
                  goto LABEL_113;
                case 7:
                  if (v26 == 129) {
                    uint64_t v38 = @"Send Average Charging Current";
                  }
                  else {
                    uint64_t v38 = @"Battery Case Average Charging Current";
                  }
                  goto LABEL_113;
                case 11:
                  uint64_t v38 = @"Incoming Voltage";
                  goto LABEL_113;
                case 12:
                  uint64_t v38 = @"Incoming Current";
                  goto LABEL_113;
                case 13:
                  uint64_t v38 = @"Cell 0 Voltage";
                  goto LABEL_113;
                case 14:
                  uint64_t v38 = @"Cell 1 Voltage";
                  goto LABEL_113;
                case 16:
                  uint64_t v43 = @"Lifetime Cell0 Max Voltage";
                  goto LABEL_106;
                case 17:
                  uint64_t v43 = @"Lifetime Cell1 Max Voltage";
                  goto LABEL_106;
                case 18:
                  uint64_t v43 = @"Lifetime Cell0 Min Voltage";
                  goto LABEL_106;
                case 19:
                  uint64_t v43 = @"Lifetime Cell1 Min Voltage";
                  goto LABEL_106;
                case 20:
                  uint64_t v43 = @"Lifetime Max Charge Current";
                  goto LABEL_106;
                case 21:
                  uint64_t v43 = @"Lifetime Max Discharge Current";
                  goto LABEL_106;
                case 22:
                  uint64_t v43 = @"Lifetime Max Temperature";
                  goto LABEL_106;
                case 23:
                  uint64_t v43 = @"Lifetime Min Temperature";
                  goto LABEL_106;
                case 24:
                  uint64_t v43 = @"Lifetime Firmware Runtime";
                  goto LABEL_106;
                case 25:
                  uint64_t v43 = @"Lifetime Time Below Low Temperature";
                  goto LABEL_106;
                case 26:
                  uint64_t v43 = @"Lifetime Time Above Low Temperature";
                  goto LABEL_106;
                case 27:
                  uint64_t v43 = @"Lifetime Time Above Mid Temperature";
                  goto LABEL_106;
                case 28:
                  uint64_t v43 = @"Lifetime Time Above High Temperature";
                  goto LABEL_106;
                case 29:
                  uint64_t v43 = @"Kiosk Mode Count";
                  goto LABEL_106;
                case 30:
                  uint64_t v43 = @"Attach Count Device Type 0";
                  goto LABEL_106;
                case 31:
                  uint64_t v43 = @"Attach Count Device Type 1";
                  goto LABEL_106;
                case 32:
                  uint64_t v43 = @"Attach Count AirPods Case";
                  goto LABEL_106;
                case 33:
                  uint64_t v43 = @"Attach Count Other";
                  goto LABEL_106;
                case 34:
                  uint64_t v43 = @"Attach Count Less Than 5W Adapter";
                  goto LABEL_106;
                case 35:
                  uint64_t v43 = @"Attach Count 5W Adapter";
                  goto LABEL_106;
                case 36:
                  uint64_t v43 = @"Attach Count 7.5W Adapter";
                  goto LABEL_106;
                case 37:
                  uint64_t v43 = @"Attach Count 10.5W Adapter";
                  goto LABEL_106;
                case 38:
                  uint64_t v43 = @"Attach Count 12W Adapter";
                  goto LABEL_106;
                case 39:
                  uint64_t v43 = @"Attach Count 15W Adapter";
                  goto LABEL_106;
                case 40:
                  uint64_t v43 = @"Attach Count 18 - 20W Adapter";
                  goto LABEL_106;
                case 41:
                  uint64_t v43 = @"Attach Count Over 20W Adapter";
                  goto LABEL_106;
                case 42:
                  uint64_t v38 = @"Host Available Power dW";
                  goto LABEL_113;
                case 43:
                  uint64_t v38 = @"Rx Power Limit";
LABEL_113:
                  objc_msgSend_setPsKey_(v15, v32, (uint64_t)v38, v34, v35, v135);
                  goto LABEL_114;
                case 44:
                  uint64_t v43 = @"Lifetime Cell0 Max Q";
                  goto LABEL_106;
                case 45:
                  uint64_t v43 = @"Lifetime Cell1 Max Q";
LABEL_106:
                  objc_msgSend_setPsKey_(v15, v32, (uint64_t)v43, v34, v35, v135);
                  goto LABEL_107;
                default:
                  goto LABEL_114;
              }
            }

            switch(v37)
            {
              case 4096:
                objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"PowerStatus", v34, v35, v135);
                break;
              case 4097:
                objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"ChargingStatus", v34, v35, v135);
                break;
              case 4098:
                objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"InductiveStatus", v34, v35, v135);
                break;
            }
          }
        }

        else if (v31 == 132)
        {
          int v39 = objc_msgSend_usage(v15, v32, v33, v34, v35);
          if (v39 > 85)
          {
            if (v39 <= 89)
            {
              if (v39 == 86)
              {
                if (v21 >= 5) {
                  objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Startup Delay", v34, v35, v135);
                }
              }

              else if (v39 == 87 && v21 >= 5)
              {
                objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Delayed Remove Power", v34, v35, v135);
              }
            }

            else if (v39 == 90)
            {
              if (v21 >= 5) {
                objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Enable Audible Alarm", v34, v35, v135);
              }
            }

            else if (v39 == 98)
            {
              objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Internal Failure", v34, v35, v135);
            }

            else if (v39 == 109 && v21 >= 5)
            {
              objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Enable Charging", v34, v35, v135);
            }
          }

          else if (v39 <= 53)
          {
            if (v39 == 48)
            {
              objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Voltage", v34, v35, v135);
            }

            else if (v39 == 49)
            {
              objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Current", v34, v35, v135);
            }
          }

          else
          {
            switch(v39)
            {
              case '6':
                if (v26 == 129) {
                  objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Send Current Temperature", v34, v35, v135);
                }
                else {
                  objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Temperature", v34, v35, v135);
                }
                break;
              case '@':
                if (v21 >= 5) {
                  objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Set Required Voltage", v34, v35, v135);
                }
                break;
              case 'A':
                if (v21 > 4)
                {
                  if (v26 == 129) {
                    objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Set Current Limit", v34, v35, v135);
                  }
                }

                else
                {
                  objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Battery Case Available Current", v34, v35, v135);
                }

                break;
            }
          }
        }

        else if (v31 == 133)
        {
          int v36 = objc_msgSend_usage(v15, v32, v33, v34, v35);
          switch(v36)
          {
            case 'e':
            case 'f':
              if (v26 == 129) {
                objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Send Current State of Charge", v34, v35, v135);
              }
              else {
                objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Current Capacity", v34, v35, v135);
              }
              break;
            case 'g':
              objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Max Capacity", v34, v35, v135);
              break;
            case 'h':
              objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Time to Empty", v34, v35, v135);
              break;
            case 'i':
              break;
            case 'j':
              objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Time to Full Charge", v34, v35, v135);
              break;
            case 'k':
              objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"CycleCount", v34, v35, v135);
              break;
            default:
              if ((v36 - 68) >= 2)
              {
                if (v36 == 208) {
                  objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Power Source State", v34, v35, v135);
                }
              }

              else
              {
                objc_msgSend_setPsKey_(v15, v32, (uint64_t)@"Is Charging", v34, v35, v135);
              }

              break;
          }
        }

- (id)copyElements:(id)a3 psKey:(id)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v8 = v5;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v10)
  {
    uint64_t v15 = v10;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v8);
        }
        uint64_t v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_msgSend_psKey(v18, v11, v12, v13, v14, (void)v25);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        int isEqualToString = objc_msgSend_isEqualToString_(v19, v20, (uint64_t)v6, v21, v22);

        if (isEqualToString) {
          objc_msgSend_addObject_(v7, v11, (uint64_t)v18, v13, v14);
        }
      }

      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v25, (uint64_t)v29, 16);
    }

    while (v15);
  }

  return v7;
}

- (id)latestElement:(id)a3 psKey:(id)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v10 = (id)objc_msgSend_copyElements_psKey_(self, v8, (uint64_t)v6, (uint64_t)v7, v9);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v12)
  {
    uint64_t v17 = v12;
    uint64_t v18 = 0LL;
    unint64_t v19 = 0LL;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (uint64_t i = 0LL; i != v17; ++i)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v10);
        }
        uint64_t v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (objc_msgSend_timestamp(v22, v13, v14, v15, v16, (void)v29) > v19)
        {
          id v23 = v22;

          unint64_t v19 = objc_msgSend_timestamp(v23, v24, v25, v26, v27);
          uint64_t v18 = v23;
        }
      }

      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v29, (uint64_t)v33, 16);
    }

    while (v17);
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  return v18;
}

- (void)updateElements:(id)a3
{
  uint64_t v106 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  transaction = self->_transaction;
  if (!transaction)
  {
    _IOHIDLogCategory();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_189096838();
    }
    goto LABEL_7;
  }

  if (((unsigned int (*)(IOHIDDeviceTransactionInterface **, void, void))(*transaction)->setDirection)( transaction,  0LL,  0LL))
  {
    _IOHIDLogCategory();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1890968C4();
    }
LABEL_7:

    goto LABEL_8;
  }

  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  id v7 = v4;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v94, (uint64_t)v105, 16);
  if (v9)
  {
    uint64_t v14 = v9;
    id v88 = v4;
    uint64_t v15 = 0LL;
    uint64_t v16 = *(void *)v95;
    do
    {
      for (uint64_t i = 0LL; i != v14; ++i)
      {
        if (*(void *)v95 != v16) {
          objc_enumerationMutation(v7);
        }
        uint64_t v18 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        if (!objc_msgSend_isConstant(v18, v10, v11, v12, v13)
          || (objc_msgSend_isUpdated(v18, v10, v11, v12, v13) & 1) == 0)
        {
          unint64_t v19 = self->_transaction;
          addElement = (*v19)->addElement;
          uint64_t v21 = objc_msgSend_elementRef(v18, v10, v11, v12, v13);
          int v22 = ((uint64_t (*)(IOHIDDeviceTransactionInterface **, uint64_t, void))addElement)(v19, v21, 0LL);
          if (v22)
          {
            int v23 = v22;
            _IOHIDLogCategory();
            uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              int v99 = v23;
              _os_log_impl( &dword_189088000,  v24,  OS_LOG_TYPE_DEFAULT,  "Failed to add element to transaction %x",  buf,  8u);
            }
          }

          else
          {
            ++v15;
          }
        }
      }

      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v94, (uint64_t)v105, 16);
    }

    while (v14);

    id v4 = v88;
    if (v15)
    {
      if (((unsigned int (*)(IOHIDDeviceTransactionInterface **, void, void, void, void))(*self->_transaction)->commit)( self->_transaction,  0LL,  0LL,  0LL,  0LL))
      {
        ((void (*)(IOHIDDeviceTransactionInterface **, void))(*self->_transaction)->clear)( self->_transaction,  0LL);
        _IOHIDLogCategory();
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_189096864();
        }
        goto LABEL_7;
      }

      __int128 v92 = 0u;
      __int128 v93 = 0u;
      __int128 v90 = 0u;
      __int128 v91 = 0u;
      id v26 = v7;
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v90, (uint64_t)v104, 16);
      if (!v28) {
        goto LABEL_56;
      }
      uint64_t v34 = v28;
      uint64_t v35 = *(void *)v91;
      *(void *)&__int128 v33 = 67109632LL;
      __int128 v87 = v33;
LABEL_33:
      uint64_t v36 = 0LL;
      while (1)
      {
        if (*(void *)v91 != v35) {
          objc_enumerationMutation(v26);
        }
        int v37 = *(void **)(*((void *)&v90 + 1) + 8 * v36);
        uint64_t v89 = 0LL;
        if (objc_msgSend_isConstant(v37, v29, v30, v31, v32, v87)
          && (objc_msgSend_isUpdated(v37, v29, v30, v31, v32) & 1) != 0)
        {
          goto LABEL_51;
        }

        uint64_t v38 = self->_transaction;
        getValue = (*v38)->getValue;
        uint64_t v40 = objc_msgSend_elementRef(v37, v29, v30, v31, v32);
        int v41 = ((uint64_t (*)(IOHIDDeviceTransactionInterface **, uint64_t, uint64_t *, void))getValue)( v38,  v40,  &v89,  0LL);
        if (v41) {
          BOOL v45 = 1;
        }
        else {
          BOOL v45 = v89 == 0;
        }
        if (v45)
        {
          int v46 = v41;
          _IOHIDLogCategory();
          uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
          if (v46)
          {
            if (v48)
            {
              int v53 = objc_msgSend_usagePage(v37, v49, v50, v51, v52);
              int v58 = objc_msgSend_usage(v37, v54, v55, v56, v57);
              *(_DWORD *)buf = v87;
              int v99 = v53;
              __int16 v100 = 1024;
              int v101 = v58;
              __int16 v102 = 1024;
              int v103 = v46;
              uint64_t v59 = v47;
              uint64_t v60 = "Unable to update element UP: %x, U : %x failed(%#x)";
              uint32_t v61 = 20;
LABEL_54:
              _os_log_error_impl(&dword_189088000, v59, OS_LOG_TYPE_ERROR, v60, buf, v61);
            }
          }

          else if (v48)
          {
            int v80 = objc_msgSend_usagePage(v37, v49, v50, v51, v52);
            int v85 = objc_msgSend_usage(v37, v81, v82, v83, v84);
            *(_DWORD *)buf = 67109376;
            int v99 = v80;
            __int16 v100 = 1024;
            int v101 = v85;
            uint64_t v59 = v47;
            uint64_t v60 = "Unable to update element UP: %x, U : %x no value";
            uint32_t v61 = 14;
            goto LABEL_54;
          }
        }

        else
        {
          objc_msgSend_setValueRef_(v37, v42, v89, v43, v44);
          objc_msgSend_setIsUpdated_(v37, v62, 1, v63, v64);
          _IOHIDLogCategory();
          uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            int v74 = objc_msgSend_usagePage(v37, v70, v71, v72, v73);
            int v79 = objc_msgSend_usage(v37, v75, v76, v77, v78);
            *(_DWORD *)buf = 67109376;
            int v99 = v74;
            __int16 v100 = 1024;
            int v101 = v79;
            _os_log_impl( &dword_189088000,  v47,  OS_LOG_TYPE_DEFAULT,  "Constant feature element UP : %x , U : %x updated",  buf,  0xEu);
          }
        }

LABEL_51:
        if (v34 == ++v36)
        {
          uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v90, (uint64_t)v104, 16);
          uint64_t v34 = v86;
          if (!v86)
          {
LABEL_56:

            ((void (*)(IOHIDDeviceTransactionInterface **, void))(*self->_transaction)->clear)( self->_transaction,  0LL);
            id v4 = v88;
            goto LABEL_8;
          }

          goto LABEL_33;
        }
      }
    }
  }

  else
  {
  }

  _IOHIDLogCategory();
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_189088000, v25, OS_LOG_TYPE_DEFAULT, "Nothing to commit skip", buf, 2u);
  }

  ((void (*)(IOHIDDeviceTransactionInterface **, void))(*self->_transaction)->clear)( self->_transaction,  0LL);
LABEL_8:
}

- (BOOL)updateEvent
{
  uint64_t v267 = *MEMORY[0x1895F89C0];
  objc_msgSend_removeAllObjects(self->_upsUpdatedEvent, a2, v2, v3, v4);
  __int128 v259 = 0u;
  __int128 v260 = 0u;
  __int128 v257 = 0u;
  __int128 v258 = 0u;
  obuint64_t j = self->_eventElements;
  uint64_t v255 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v257, (uint64_t)v266, 16);
  if (!v255)
  {
    char v256 = 0;
    uint64_t v249 = 0LL;
    uint64_t v250 = 0LL;
    uint64_t v248 = 0LL;
    goto LABEL_99;
  }

  char v256 = 0;
  uint64_t v249 = 0LL;
  uint64_t v250 = 0LL;
  uint64_t v248 = 0LL;
  uint64_t v254 = *(void *)v258;
  do
  {
    uint64_t v11 = 0LL;
    do
    {
      if (*(void *)v258 != v254) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v257 + 1) + 8 * v11);
      eventElements = self->_eventElements;
      objc_msgSend_psKey(v12, v7, v8, v9, v10);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_latestElement_psKey_(self, v15, (uint64_t)eventElements, (uint64_t)v14, v16);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17 || (objc_msgSend_isEqual_(v12, v18, (uint64_t)v17, v20, v21) & 1) != 0)
      {
        upsEvent = self->_upsEvent;
        objc_msgSend_psKey(v12, v18, v19, v20, v21);
        int v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(upsEvent, v24, (uint64_t)v23, v25, v26);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_psKey(v12, v28, v29, v30, v31);
        uint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v37 = objc_msgSend_integerValue(v12, v33, v34, v35, v36);
        LODWORD(upsEvent) = objc_msgSend_unitExponent(v12, v38, v39, v40, v41);
        int v46 = objc_msgSend_unitExponent(v12, v42, v43, v44, v45);
        int v51 = v46 - 16;
        double v52 = (double)v51;
        int v53 = objc_msgSend_usagePage(v12, v47, v48, v49, v50);
        if (v53 != 65293)
        {
          if (v53 == 133)
          {
            int v88 = objc_msgSend_usage(v12, v54, v55, v56, v57);
            if (v88 <= 100)
            {
              if (v88 == 68)
              {
                uint64_t v178 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
                uint64_t v179 = MEMORY[0x189604A88];
                v180 = (void *)MEMORY[0x189604A80];
                if (v178) {
                  v180 = (void *)MEMORY[0x189604A88];
                }
                v136 = v180;
                HIDWORD(v250) |= objc_msgSend_integerValue(v12, v181, v182, v183, v184) != 0;
                LODWORD(v249) = objc_msgSend_isEqual_(v27, v185, v179, v186, v187);
              }

              else
              {
                if (v88 != 69) {
                  goto LABEL_57;
                }
                uint64_t v139 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
                id v140 = &unk_18A341A78;
                if (!v139) {
                  id v140 = &unk_18A341A60;
                }
                v136 = v140;
                LODWORD(v250) = v250 | (objc_msgSend_integerValue(v12, v141, v142, v143, v144) != 0);
                HIDWORD(v248) = objc_msgSend_isEqual_(v27, v145, (uint64_t)&unk_18A341A60, v146, v147);
              }
            }

            else
            {
              switch(v88)
              {
                case 'e':
                case 'f':
                  if (!objc_msgSend_unit(v12, v89, v90, v91, v92))
                  {
                    objc_msgSend_numberWithInt_(MEMORY[0x189607968], v54, v37, v56, v57);
                    __int128 v93 = (void *)objc_claimAutoreleasedReturnValue();
                    char isEqual = objc_msgSend_isEqual_(v27, v94, (uint64_t)v93, v95, v96);

                    if ((isEqual & 1) == 0)
                    {
                      int v99 = objc_msgSend_integerValue(v12, v54, v98, v56, v57);
                      __int16 v102 = (void *)objc_msgSend_copyElements_psKey_( self,  v100,  (uint64_t)self->_eventElements,  (uint64_t)@"Time to Full Charge",  v101);
                      int v107 = v102;
                      if (v102 && objc_msgSend_count(v102, v103, v104, v105, v106))
                      {
                        int v246 = v99;
                        objc_msgSend_objectAtIndex_(v107, v103, 0, v108, v106);
                        uint64_t v109 = (void *)objc_claimAutoreleasedReturnValue();
                        uint64_t v245 = objc_msgSend_integerValue(v109, v110, v111, v112, v113);
                        v251 = v109;
                        if ((objc_msgSend_isEqual_(v109, v114, (uint64_t)v27, v115, v116) & 1) == 0)
                        {
                          objc_msgSend_numberWithInt_( MEMORY[0x189607968],  v103,  ((int)((double)(100 - v246) / 100.0 * (double)v245) / 60),  v117,  v106);
                          uint64_t v118 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_setObject_forKeyedSubscript_( self->_upsUpdatedEvent,  v119,  (uint64_t)v118,  (uint64_t)@"Time to Full Charge",  v120);
                        }
                      }

                      else
                      {
                        v251 = 0LL;
                      }

                      v196 = (void *)objc_msgSend_copyElements_psKey_( self,  v103,  (uint64_t)self->_eventElements,  (uint64_t)@"Time to Empty",  v106);

                      if (v196 && objc_msgSend_count(v196, v197, v198, v199, v200))
                      {
                        objc_msgSend_objectAtIndex_(v196, v201, 0, v202, v203);
                        v247 = (void *)objc_claimAutoreleasedReturnValue();

                        v252 = (void *)MEMORY[0x189607968];
                        uint64_t v208 = objc_msgSend_integerValue(v247, v204, v205, v206, v207);
                        objc_msgSend_numberWithInteger_(v252, v209, v208 / 60, v210, v211);
                        v212 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_setObject_forKeyedSubscript_( self->_upsUpdatedEvent,  v213,  (uint64_t)v212,  (uint64_t)@"Time to Empty",  v214);

                        v215 = v247;
                      }

                      else
                      {
                        v215 = v251;
                      }
                    }
                  }

                  goto LABEL_57;
                case 'g':
                  goto LABEL_54;
                case 'h':
                  objc_msgSend_numberWithInt_(MEMORY[0x189607968], v54, ((int)v37 / 60), v56, v57);
                  goto LABEL_58;
                case 'i':
                  goto LABEL_57;
                case 'j':
                  v164 = (void *)objc_msgSend_copyElements_psKey_( self,  v54,  (uint64_t)self->_eventElements,  (uint64_t)@"Current Capacity",  v57);
                  v169 = v164;
                  if (v164 && objc_msgSend_count(v164, v165, v166, v167, v168))
                  {
                    objc_msgSend_objectAtIndex_(v169, v170, 0, v171, v172);
                    v173 = (void *)objc_claimAutoreleasedReturnValue();
                    uint64_t v37 = ((int)((double)(100
                                                                    - objc_msgSend_integerValue( v173,  v174,  v175,  v176,  v177))
                                                           / 100.0
                  }

                  goto LABEL_57;
                default:
                  if (v88 != 208) {
                    goto LABEL_57;
                  }
                  uint64_t v155 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
                  v156 = @"Battery Power";
                  if (v155) {
                    v156 = @"AC Power";
                  }
                  v136 = v156;
                  HIDWORD(v249) |= objc_msgSend_integerValue(v12, v157, v158, v159, v160) != 0;
                  LODWORD(v248) = objc_msgSend_isEqual_(v27, v161, (uint64_t)@"AC Power", v162, v163);
                  break;
              }
            }

            goto LABEL_60;
          }

          if (v53 != 132) {
            goto LABEL_57;
          }
          int v58 = objc_msgSend_usage(v12, v54, v55, v56, v57);
          if (v58 <= 53)
          {
            if (v58 != 48)
            {
              if (v58 != 49) {
                goto LABEL_57;
              }
              goto LABEL_44;
            }

- (void)valueAvailableCallback:(int)a3
{
  if (!a3)
  {
    do
    {
      IOHIDValueRef value = 0LL;
      int v6 = ((uint64_t (*)(IOHIDDeviceQueueInterface **, IOHIDValueRef *, void, void))(*self->_queue)->copyNextValue)( self->_queue,  &value,  0LL,  0LL);
      if (value)
      {
        IOHIDElementRef Element = IOHIDValueGetElement(value);
        uint64_t v8 = objc_alloc(&OBJC_CLASS___HIDLibElement);
        uint64_t v12 = (void *)objc_msgSend_initWithElementRef_(v8, v9, (uint64_t)Element, v10, v11);
        uint64_t v16 = objc_msgSend_indexOfObject_(self->_elements.input, v13, (uint64_t)v12, v14, v15);
        objc_msgSend_objectAtIndex_(self->_elements.input, v17, v16, v18, v19);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValueRef_(v20, v21, (uint64_t)value, v22, v23);
        CFRelease(value);
      }
    }

    while (!v6);
  }

  objc_msgSend_updateEvent(self, a2, *(uint64_t *)&a3, v3, v4);
  if (self->_eventCallback)
  {
    sub_18908F71C(self->_upsEvent, @"dispatchEvent");
    ((void (*)(void *, void, void *, IOUPSPlugInInterface_v140 **, NSMutableDictionary *))self->_eventCallback)( self->_eventTarget,  0LL,  self->_eventRefcon,  &self->_ups,  self->_upsUpdatedEvent);
  }

- (void)initialEventUpdate
{
  p_elements = &self->_elements;
  objc_msgSend_updateElements_(self, a2, (uint64_t)self->_elements.input, v2, v3);
  objc_msgSend_updateElements_(self, v6, (uint64_t)p_elements->feature, v7, v8);
  objc_msgSend_updateEvent(self, v9, v10, v11, v12);
}

- (BOOL)pollEventUpdate
{
  return objc_msgSend_updateEvent(self, v5, v6, v7, v8);
}

- (int)start:(id)a3 service:(unsigned int)a4
{
  kern_return_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CFUUIDRef v10;
  CFUUIDRef v11;
  kern_return_t v12;
  IOCFPlugInInterface **v13;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  CFUUIDRef v15;
  CFUUIDBytes v16;
  IOHIDDeviceTimeStampedDeviceInterface ***p_device;
  int v18;
  int v19;
  IOHIDDeviceTimeStampedDeviceInterface **v20;
  HRESULT (__cdecl *v21)(void *, REFIID, LPVOID *);
  CFUUIDRef v22;
  CFUUIDBytes v23;
  IOHIDDeviceQueueInterface ***p_queue;
  IOHIDDeviceTimeStampedDeviceInterface **v25;
  HRESULT (__cdecl *v26)(void *, REFIID, LPVOID *);
  CFUUIDRef v27;
  CFUUIDBytes v28;
  IOHIDDeviceTransactionInterface ***p_transaction;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  IOHIDDeviceQueueInterface **v33;
  IOReturn (__cdecl *setDepth)(void *, uint32_t, IOOptionBits);
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSMutableArray *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  IOHIDDeviceQueueInterface **v51;
  IOReturn (__cdecl *addElement)(void *, IOHIDElementRef, IOOptionBits);
  uint64_t v53;
  int v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  os_log_s *v61;
  os_log_s *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  SInt32 theScore;
  IOCFPlugInInterface **theInterface;
  CFTypeRef cf;
  CFMutableDictionaryRef properties;
  _BYTE v71[128];
  uint64_t v72;
  int v72 = *MEMORY[0x1895F89C0];
  cf = 0LL;
  properties = 0LL;
  theInterface = 0LL;
  theScore = 0;
  uint64_t v6 = IORegistryEntryCreateCFProperties(a4, &properties, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
  if (v6)
  {
    uint64_t v59 = v6;
    _IOHIDLogCategory();
    uint32_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_189096C6C();
    }
    goto LABEL_61;
  }

  if (!properties)
  {
    _IOHIDLogCategory();
    v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_189096924();
    }
    goto LABEL_64;
  }

  objc_msgSend_parseProperties_(self, v7, (uint64_t)properties, v8, v9);
  uint64_t v10 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x7Du,  0xDEu,  0xECu,  0xA8u,  0xA7u,  0xB4u,  0x11u,  0xDAu,  0x8Au,  0xEu,  0,  0x14u,  0x51u,  0x97u,  0x58u,  0xEFu);
  uint64_t v11 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu);
  uint64_t v12 = IOCreatePlugInInterfaceForService(a4, v10, v11, &theInterface, &theScore);
  if (v12)
  {
    uint64_t v59 = v12;
    _IOHIDLogCategory();
    uint32_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_189096C0C();
    }
    goto LABEL_61;
  }

  uint64_t v13 = theInterface;
  if (!theInterface)
  {
    _IOHIDLogCategory();
    v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_189096950();
    }
    goto LABEL_64;
  }

  QueryInterface = (*theInterface)->QueryInterface;
  uint64_t v15 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x47u,  0x4Bu,  0xDCu,  0x8Eu,  0x9Fu,  0x4Au,  0x11u,  0xDAu,  0xB3u,  0x66u,  0,  0xDu,  0x93u,  0x6Du,  6u,  0xD2u);
  uint64_t v16 = CFUUIDGetUUIDBytes(v15);
  p_device = &self->_device;
  if (((unsigned int (*)(IOCFPlugInInterface **, void, void, IOHIDDeviceTimeStampedDeviceInterface ***))QueryInterface)( v13,  *(void *)&v16.byte0,  *(void *)&v16.byte8,  &self->_device))
  {
    _IOHIDLogCategory();
    uint32_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_189096BAC();
    }
    goto LABEL_60;
  }

  if (!*p_device)
  {
    _IOHIDLogCategory();
    v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_18909697C();
    }
    goto LABEL_64;
  }

  uint64_t v18 = ((uint64_t (*)(IOHIDDeviceTimeStampedDeviceInterface **, void))(**p_device)->open)(*p_device, 0LL);
  if (v18)
  {
    uint64_t v59 = v18;
    _IOHIDLogCategory();
    uint32_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_189096B4C();
    }
    goto LABEL_61;
  }

  uint64_t v19 = ((uint64_t (*)(IOHIDDeviceTimeStampedDeviceInterface **, void, CFTypeRef *, void))(**p_device)->copyMatchingElements)( *p_device,  0LL,  &cf,  0LL);
  if (v19)
  {
    uint64_t v59 = v19;
    _IOHIDLogCategory();
    uint32_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_189096AEC();
    }
    goto LABEL_61;
  }

  if (!cf)
  {
    _IOHIDLogCategory();
    v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_1890969A8();
    }
    goto LABEL_64;
  }

  uint64_t v20 = *p_device;
  uint64_t v21 = (**p_device)->QueryInterface;
  uint64_t v22 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x2Eu,  0xC7u,  0x8Bu,  0xDBu,  0x9Fu,  0x4Eu,  0x11u,  0xDAu,  0xB6u,  0x5Cu,  0,  0xDu,  0x93u,  0x6Du,  6u,  0xD2u);
  uint64_t v23 = CFUUIDGetUUIDBytes(v22);
  p_queue = &self->_queue;
  if (((unsigned int (*)(IOHIDDeviceTimeStampedDeviceInterface **, void, void, IOHIDDeviceQueueInterface ***))v21)( v20,  *(void *)&v23.byte0,  *(void *)&v23.byte8,  &self->_queue))
  {
    _IOHIDLogCategory();
    uint32_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_189096A8C();
    }
    goto LABEL_60;
  }

  if (!*p_queue)
  {
    _IOHIDLogCategory();
    v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_1890969D4();
    }
    goto LABEL_64;
  }

  uint64_t v25 = *p_device;
  uint64_t v26 = (**p_device)->QueryInterface;
  uint64_t v27 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x1Fu,  0x2Eu,  0x78u,  0xFAu,  0x9Fu,  0xFAu,  0x11u,  0xDAu,  0x90u,  0xB4u,  0,  0xDu,  0x93u,  0x6Du,  6u,  0xD2u);
  uint64_t v28 = CFUUIDGetUUIDBytes(v27);
  p_transaction = &self->_transaction;
  if (((unsigned int (*)(IOHIDDeviceTimeStampedDeviceInterface **, void, void, IOHIDDeviceTransactionInterface ***))v26)( v25,  *(void *)&v28.byte0,  *(void *)&v28.byte8,  &self->_transaction))
  {
    _IOHIDLogCategory();
    uint32_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_189096A2C();
    }
LABEL_60:
    uint64_t v59 = -536870212;
LABEL_61:

    goto LABEL_28;
  }

  if (!*p_transaction)
  {
    _IOHIDLogCategory();
    v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_189096A00();
    }
LABEL_64:

    uint64_t v59 = -536870911;
    goto LABEL_28;
  }

  ((void (*)(IOHIDDeviceTransactionInterface **, uint64_t, void))(**p_transaction)->setDirection)( *p_transaction,  1LL,  0LL);
  objc_msgSend_parseElements_(self, v30, (uint64_t)cf, v31, v32);
  __int128 v33 = *p_queue;
  setDepth = (**p_queue)->setDepth;
  uint64_t v39 = objc_msgSend_count(self->_elements.input, v35, v36, v37, v38);
  ((void (*)(IOHIDDeviceQueueInterface **, uint64_t, void))setDepth)(v33, v39, 0LL);
  uint64_t v63 = 0u;
  uint64_t v64 = 0u;
  uint64_t v65 = 0u;
  uint64_t v66 = 0u;
  uint64_t v40 = self->_elements.input;
  uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v63, (uint64_t)v71, 16);
  if (v42)
  {
    uint64_t v47 = v42;
    uint64_t v48 = *(void *)v64;
    do
    {
      for (uint64_t i = 0LL; i != v47; ++i)
      {
        if (*(void *)v64 != v48) {
          objc_enumerationMutation(v40);
        }
        uint64_t v50 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        if (objc_msgSend_type(v50, v43, v44, v45, v46) <= 4)
        {
          int v51 = *p_queue;
          addIOHIDElementRef Element = (**p_queue)->addElement;
          int v53 = objc_msgSend_elementRef(v50, v43, v44, v45, v46);
          ((void (*)(IOHIDDeviceQueueInterface **, uint64_t, void))addElement)(v51, v53, 0LL);
        }
      }

      uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v63, (uint64_t)v71, 16);
    }

    while (v47);
  }

  uint64_t v54 = ((uint64_t (*)(IOHIDDeviceQueueInterface **, __CFRunLoopSource **))(**p_queue)->getAsyncEventSource)( *p_queue,  &self->_runLoopSource);
  if (v54) {
    goto LABEL_35;
  }
  if (!self->_runLoopSource)
  {
    uint64_t v59 = 0;
    goto LABEL_28;
  }

  uint64_t v54 = ((uint64_t (*)(IOHIDDeviceQueueInterface **, uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), IOHIDUPSClass *))(**p_queue)->setValueAvailableCallback)( *p_queue,  sub_18909159C,  self);
  if (v54)
  {
LABEL_35:
    uint64_t v59 = v54;
    goto LABEL_28;
  }

  uint64_t v59 = ((uint64_t (*)(IOHIDDeviceQueueInterface **, void))(**p_queue)->start)(*p_queue, 0LL);
  if (!v59) {
    objc_msgSend_initialEventUpdate(self, v55, v56, v57, v58);
  }
LABEL_28:
  if (theInterface) {
    ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (properties) {
    CFRelease(properties);
  }
  return v59;
}

- (int)stop
{
  queue = self->_queue;
  if (queue) {
    ((void (*)(IOHIDDeviceQueueInterface **, void))(*queue)->stop)(queue, 0LL);
  }
  ((void (*)(IOHIDDeviceTimeStampedDeviceInterface **, void))(*self->_device)->close)(self->_device, 0LL);
  return 0;
}

- (int)getProperties:(const __CFDictionary *)a3
{
  if (!a3) {
    return -536870206;
  }
  int result = 0;
  *a3 = (const __CFDictionary *)self->_properties;
  return result;
}

- (int)getCapabilities:(const __CFSet *)a3
{
  if (!a3) {
    return -536870206;
  }
  int result = 0;
  *a3 = (const __CFSet *)self->_capabilities;
  return result;
}

- (int)getEvent:(const __CFDictionary *)a3
{
  if (!a3) {
    return -536870206;
  }
  *a3 = (const __CFDictionary *)self->_upsEvent;
  sub_18908F71C(self->_upsEvent, @"getEvent");
  return 0;
}

- (int)setEventCallback:(void *)a3 target:(void *)a4 refcon:(void *)a5
{
  self->_eventCallback = a3;
  self->_eventTarget = a4;
  self->_eventRefcon = a5;
  return 0;
}

- (int)sendCommand:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  _IOHIDLogCategory();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl(&dword_189088000, v5, OS_LOG_TYPE_DEFAULT, "sendCommand: %@", buf, 0xCu);
  }

  int v6 = -536870206;

  if (v4 && objc_msgSend_count(v4, v7, v8, v9, v10))
  {
    transaction = self->_transaction;
    if (transaction)
    {
      ((void (*)(IOHIDDeviceTransactionInterface **, uint64_t, void))(*transaction)->setDirection)( transaction,  1LL,  0LL);
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = sub_189091868;
      v17[3] = &unk_18A33F188;
      v17[4] = self;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v4, v12, (uint64_t)v17, v13, v14);
      int v6 = ((uint64_t (*)(IOHIDDeviceTransactionInterface **, void, void, void, void))(*self->_transaction)->commit)( self->_transaction,  0LL,  0LL,  0LL,  0LL);
      ((void (*)(IOHIDDeviceTransactionInterface **, void))(*self->_transaction)->clear)( self->_transaction,  0LL);
    }

    else
    {
      _IOHIDLogCategory();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_189096838();
      }

      int v6 = -536870212;
    }
  }

  return v6;
}

- (int)createAsyncEventSource:(const void *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  timer = self->_timer;
  if (timer)
  {
    CFRetain(timer);
    objc_msgSend_addObject_(v5, v7, (uint64_t)self->_timer, v8, v9);
  }

  runLoopSource = self->_runLoopSource;
  if (runLoopSource)
  {
    CFRetain(runLoopSource);
    objc_msgSend_addObject_(v5, v11, (uint64_t)self->_runLoopSource, v12, v13);
  }

  *a3 = v5;
  return 0;
}

- (IOHIDUPSClass)init
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___IOHIDUPSClass;
  uint64_t v2 = -[IOHIDPlugin init](&v29, sel_init);
  if (v2)
  {
    uint64_t v3 = (char *)malloc(0x50uLL);
    v2->_ups = (IOUPSPlugInInterface_v140 *)v3;
    vtbl = v2->super.super._vtbl;
    Release = vtbl->Release;
    __int128 v6 = *(_OWORD *)&vtbl->QueryInterface;
    *(void *)uint64_t v3 = v2;
    *(_OWORD *)(v3 + 8) = v6;
    *((void *)v3 + 3) = Release;
    *((void *)v3 + 4) = sub_189091D18;
    *((void *)v3 + 5) = sub_189091D28;
    *((void *)v3 + 6) = sub_189091D38;
    *((void *)v3 + 7) = sub_189091D48;
    *((void *)v3 + 8) = sub_189091D60;
    *((void *)v3 + 9) = sub_189091D70;
    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    properties = v2->_properties;
    v2->_properties = v7;

    uint64_t v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    capabilities = v2->_capabilities;
    v2->_capabilities = v9;

    uint64_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    input = v2->_elements.input;
    v2->_elements.input = v11;

    uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    output = v2->_elements.output;
    v2->_elements.output = v13;

    uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    feature = v2->_elements.feature;
    v2->_elements.feature = v15;

    uint64_t v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    commandElements = v2->_commandElements;
    v2->_commandElements = v17;

    id v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    eventElements = v2->_eventElements;
    v2->_eventElements = v19;

    uint64_t v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    upsEvent = v2->_upsEvent;
    v2->_upsEvent = v21;

    uint64_t v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    upsUpdatedEvent = v2->_upsUpdatedEvent;
    v2->_upsUpdatedEvent = v23;

    uint64_t v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    debugInformation = v2->_debugInformation;
    v2->_debugInformation = v25;

    uint64_t v27 = v2;
  }

  return v2;
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue) {
    ((void (*)(IOHIDDeviceQueueInterface **))(*queue)->Release)(queue);
  }
  transaction = self->_transaction;
  if (transaction) {
    ((void (*)(IOHIDDeviceTransactionInterface **))(*transaction)->Release)(transaction);
  }
  device = self->_device;
  if (device) {
    ((void (*)(IOHIDDeviceTimeStampedDeviceInterface **))(*device)->Release)(device);
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IOHIDUPSClass;
  -[IOHIDPlugin dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end