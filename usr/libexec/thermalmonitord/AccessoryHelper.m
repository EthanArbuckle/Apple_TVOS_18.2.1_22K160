@interface AccessoryHelper
- (ACCConnectionInfo)accConnectionInfo;
- (AccessoryHelper)initWithProduct:(id)a3;
- (BOOL)isAccessoryAttached;
- (NSMutableDictionary)connectedEndpoints;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7;
- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4;
- (void)applyUpdatedAccessoryState:(int)a3;
- (void)handleAccessoryEventForEndpointUUID:(id)a3 andAttachedState:(BOOL)a4;
- (void)initializeFilteredAttachedState:(BOOL)a3;
- (void)setAccConnectionInfo:(id)a3;
- (void)setConnectedEndpoints:(id)a3;
- (void)updateFilter:(BOOL)a3;
@end

@implementation AccessoryHelper

- (AccessoryHelper)initWithProduct:(id)a3
{
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___AccessoryHelper;
  v4 = -[AccessoryHelper init](&v35, "init");
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_product = (CommonProduct *)a3;
    }

    else
    {
      v6 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003D034(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }

    -[AccessoryHelper setConnectedEndpoints:]( v5,  "setConnectedEndpoints:",  objc_alloc_init(&OBJC_CLASS___NSMutableDictionary));
    if (!-[AccessoryHelper connectedEndpoints](v5, "connectedEndpoints"))
    {
      v14 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003D004(v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }

    *(_WORD *)&v5->_BOOL accessoryAttached = 0;
    v5->_filteredAttachValue = 0;
    v5->_filterCount = 0;
    -[AccessoryHelper setAccConnectionInfo:]( v5,  "setAccConnectionInfo:",  +[ACCConnectionInfo sharedInstance](&OBJC_CLASS___ACCConnectionInfo, "sharedInstance"));
    if (!-[AccessoryHelper accConnectionInfo](v5, "accConnectionInfo"))
    {
      v22 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003CFD4(v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }

    -[ACCConnectionInfo registerDelegate:]( -[AccessoryHelper accConnectionInfo](v5, "accConnectionInfo"),  "registerDelegate:",  v5);
    if (v5->_accessoryAttached)
    {
      if (byte_10007CB30
        && (v30 = (os_log_s *)qword_10007CF50, os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT)))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "<Notice> Accessory attached at boot: skipping initial filtering requirements",  v34,  2u);
        BOOL accessoryAttached = v5->_accessoryAttached;
      }

      else
      {
        BOOL accessoryAttached = 1LL;
      }

      -[AccessoryHelper initializeFilteredAttachedState:](v5, "initializeFilteredAttachedState:", accessoryAttached);
    }

    if (byte_10007D470)
    {
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  6LL,  @"zETM",  6LL);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  7LL,  @"zETM",  7LL);
      float v32 = 0.0;
      if (v5->_accessoryAttached) {
        float v32 = 1.0;
      }
      dword_10007D188 = LODWORD(v32);
      *(float *)&dword_10007D18C = (float)v5->_filteredAttachValue;
    }

    -[TGraphSampler addtGraphDataSource:]( +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance"),  "addtGraphDataSource:",  v5);
  }

  return v5;
}

- (void)updateFilter:(BOOL)a3
{
  uint64_t filteredAttachValue = self->_filteredAttachValue;
  if (a3) {
    -[AccessoryHelper initializeFilteredAttachedState:]( self,  "initializeFilteredAttachedState:",  self->_accessoryAttached);
  }
  BOOL accessoryAttached = self->_accessoryAttached;
  if (accessoryAttached == self->_previousAttachedState)
  {
    int filterCount = self->_filterCount;
    if (filterCount >= 6)
    {
      if (self->_accessoryAttached) {
        uint64_t filteredAttachValue = 100LL;
      }
      else {
        uint64_t filteredAttachValue = 0LL;
      }
    }

    else
    {
      self->_int filterCount = filterCount + 1;
      if (accessoryAttached) {
        uint64_t v7 = 100LL;
      }
      else {
        uint64_t v7 = 0LL;
      }
      if (filterCount == 5) {
        uint64_t filteredAttachValue = v7;
      }
    }
  }

  else
  {
    self->_int filterCount = 0;
    self->_previousAttachedState = accessoryAttached;
  }

  -[AccessoryHelper applyUpdatedAccessoryState:](self, "applyUpdatedAccessoryState:", filteredAttachValue);
}

- (void)initializeFilteredAttachedState:(BOOL)a3
{
  BOOL v3 = a3;
  self->_int filterCount = 6;
  self->_previousAttachedState = a3;
  if (byte_10007CB30)
  {
    v5 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "false";
      if (v3) {
        v6 = "true";
      }
      int v8 = 136315138;
      uint64_t v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> Initializing Attached state to %s",  (uint8_t *)&v8,  0xCu);
    }
  }

  if (v3) {
    uint64_t v7 = 100LL;
  }
  else {
    uint64_t v7 = 0LL;
  }
  -[AccessoryHelper applyUpdatedAccessoryState:](self, "applyUpdatedAccessoryState:", v7);
}

- (void)applyUpdatedAccessoryState:(int)a3
{
  if (self->_filteredAttachValue != a3)
  {
    if (byte_10007CB30)
    {
      v5 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        v6[0] = 67109120;
        v6[1] = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> Applying alternate HS targets for attached state: %d",  (uint8_t *)v6,  8u);
      }
    }

    -[CommonProduct applyAlternateHotSpotTargets:](self->_product, "applyAlternateHotSpotTargets:", a3 != 0);
  }

  self->_uint64_t filteredAttachValue = a3;
  *(float *)&dword_10007D18C = (float)(a3 / 100);
}

- (BOOL)isAccessoryAttached
{
  return self->_accessoryAttached;
}

- (void)handleAccessoryEventForEndpointUUID:(id)a3 andAttachedState:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = -[NSMutableDictionary objectForKeyedSubscript:]( -[AccessoryHelper connectedEndpoints](self, "connectedEndpoints"),  "objectForKeyedSubscript:",  a3);
  if (v7)
  {
    unsigned __int8 v8 = objc_msgSend( objc_msgSend(v7, "objectForKeyedSubscript:", @"AccessoryType"),  "charValue");
    int v9 = v8;
    BOOL v10 = v8 - 67 > 0x3E || ((1LL << (v8 - 67)) & 0x6000800000070E07LL) == 0;
    if (v10 && (v8 - 133 > 0x10 || ((1 << (v8 + 123)) & 0x11801) == 0))
    {
      uint64_t v17 = qword_10007CF50;
      if (!os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      LOWORD(v18[0]) = 0;
      uint64_t v12 = "<Notice> Not in approved type list";
      uint64_t v13 = (os_log_s *)v17;
      uint32_t v14 = 2;
    }

    else
    {
      self->_BOOL accessoryAttached = v4;
      uint64_t v11 = qword_10007CF50;
      if (!os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:
        float v15 = 0.0;
        if (self->_accessoryAttached) {
          float v15 = 1.0;
        }
        dword_10007D188 = LODWORD(v15);
        return;
      }

      v18[0] = 67109376;
      v18[1] = v9;
      __int16 v19 = 1024;
      BOOL v20 = v4;
      uint64_t v12 = "<Notice> Got accessory event with type: %d and attached state: %d";
      uint64_t v13 = (os_log_s *)v11;
      uint32_t v14 = 14;
    }

    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)v18, v14);
    goto LABEL_12;
  }

  uint64_t v16 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003D064((uint64_t)a3, v16);
  }
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v12 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412802;
    id v15 = a7;
    __int16 v16 = 2112;
    id v17 = a3;
    __int16 v18 = 2112;
    id v19 = a6;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "<Notice> Accessory attached: %@, %@, %@",  (uint8_t *)&v14,  0x20u);
  }

  if ((v9 - 14) >= 0xFFFFFFFE)
  {
    id v13 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    objc_msgSend( v13,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v9),  @"EndpointType");
    objc_msgSend( v13,  "setObject:forKeyedSubscript:",  objc_msgSend(a6, "objectForKeyedSubscript:", kACCProperties_Endpoint_NFC_Type),  @"AccessoryType");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( -[AccessoryHelper connectedEndpoints](self, "connectedEndpoints"),  "setObject:forKeyedSubscript:",  v13,  a3);
    -[AccessoryHelper handleAccessoryEventForEndpointUUID:andAttachedState:]( self,  "handleAccessoryEventForEndpointUUID:andAttachedState:",  a3,  1LL);
  }

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
  id v7 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = a4;
    __int16 v12 = 2112;
    id v13 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> Accessory detached: %@, %@",  (uint8_t *)&v10,  0x16u);
  }

  if (-[NSMutableDictionary objectForKeyedSubscript:]( -[AccessoryHelper connectedEndpoints](self, "connectedEndpoints"),  "objectForKeyedSubscript:",  a3))
  {
    -[AccessoryHelper handleAccessoryEventForEndpointUUID:andAttachedState:]( self,  "handleAccessoryEventForEndpointUUID:andAttachedState:",  a3,  0LL);
    if (byte_10007CB30)
    {
      unsigned __int8 v8 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412546;
        id v11 = a4;
        __int16 v12 = 2112;
        id v13 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<Notice> Removing connected endpoints dict entry: %@, %@",  (uint8_t *)&v10,  0x16u);
      }
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( -[AccessoryHelper connectedEndpoints](self, "connectedEndpoints"),  "setObject:forKeyedSubscript:",  0LL,  a3);
  }

  else
  {
    uint64_t v9 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "<Notice> Accessory properties do not exist: %@",  (uint8_t *)&v10,  0xCu);
    }
  }

- (int)numberOfFields
{
  return 2;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  BOOL v3 = @"Accessory Attached Filtered";
  if (a3 != 1) {
    BOOL v3 = 0LL;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"Accessory Attached Current";
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  if (a3 == 1)
  {
    BOOL v3 = kCFAllocatorDefault;
    uint64_t filteredAttachValue = self->_filteredAttachValue;
    return (__CFString *)CFStringCreateWithFormat(v3, 0LL, @"%d", filteredAttachValue);
  }

  if (!a3)
  {
    BOOL v3 = kCFAllocatorDefault;
    uint64_t filteredAttachValue = 100LL;
    if (!self->_accessoryAttached) {
      uint64_t filteredAttachValue = 0LL;
    }
    return (__CFString *)CFStringCreateWithFormat(v3, 0LL, @"%d", filteredAttachValue);
  }

  return 0LL;
}

- (ACCConnectionInfo)accConnectionInfo
{
  return self->_accConnectionInfo;
}

- (void)setAccConnectionInfo:(id)a3
{
  self->_accConnectionInfo = (ACCConnectionInfo *)a3;
}

- (NSMutableDictionary)connectedEndpoints
{
  return self->_connectedEndpoints;
}

- (void)setConnectedEndpoints:(id)a3
{
  self->_connectedEndpoints = (NSMutableDictionary *)a3;
}

@end