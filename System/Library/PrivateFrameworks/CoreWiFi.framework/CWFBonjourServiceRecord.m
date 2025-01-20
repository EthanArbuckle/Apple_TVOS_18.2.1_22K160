@interface CWFBonjourServiceRecord
+ (id)serviceRecordFromRecordName:(id)a3;
- (NSString)deviceName;
- (NSString)rawString;
- (NSString)serviceName;
- (id)description;
- (void)setDeviceName:(id)a3;
- (void)setRawString:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation CWFBonjourServiceRecord

+ (id)serviceRecordFromRecordName:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___CWFBonjourServiceRecord);
  objc_msgSend__bonjourServiceName(v3, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServiceName_(v4, v10, (uint64_t)v9, v11, v12);

  objc_msgSend__stringByRemovingServiceName(v3, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDeviceName_(v4, v18, (uint64_t)v17, v19, v20);

  objc_msgSend_setRawString_(v4, v21, (uint64_t)v3, v22, v23);
  return v4;
}

- (id)description
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v9, (uint64_t)@"<%@ : %p", v10, v11, v8, self);

  objc_msgSend_deviceName(self, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_deviceName(self, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v22, (uint64_t)@" deviceName='%@'", v23, v24, v21);
  }

  objc_msgSend_serviceName(self, v17, v18, v19, v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend_serviceName(self, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v31, (uint64_t)@" serviceName='%@'", v32, v33, v30);
  }

  objc_msgSend_appendString_(v6, v26, (uint64_t)@">", v28, v29);
  return v6;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)rawString
{
  return self->_rawString;
}

- (void)setRawString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end