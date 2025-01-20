@interface CCAModeProperty
- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7;
- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int)a5 andData:(const void *)a6 forClient:(int)a7;
- (CCAModeProperty)initWithOwningDevice:(id)a3;
- (unsigned)dataSizeWithQualifierSize:(unsigned int)a3 andQualifierData:(const void *)a4;
- (unsigned)mode;
- (void)setMode:(unsigned int)a3;
@end

@implementation CCAModeProperty

- (CCAModeProperty)initWithOwningDevice:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CCAModeProperty;
  v5 = -[CCAModeProperty initWithSelector:scope:element:propertyDataType:andQualifierDataType:]( &v8,  "initWithSelector:scope:element:propertyDataType:andQualifierDataType:",  1836016741LL,  1768845428LL,  0LL,  1918990199LL,  0LL);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_owningDevice, v4);
    v6->_mode = 1684434036;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_A350((uint64_t)v6);
    }
    -[CCAModeProperty setSettable:](v6, "setSettable:", 1LL);
  }

  return v6;
}

- (unsigned)dataSizeWithQualifierSize:(unsigned int)a3 andQualifierData:(const void *)a4
{
  return 4;
}

- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7
{
  unsigned int v7 = *a5;
  if (*a5 >= 4)
  {
    *(_DWORD *)a6 = self->_mode;
    *a5 = 4;
  }

  return v7 > 3;
}

- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int)a5 andData:(const void *)a6 forClient:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_A404((uint64_t)self, v7);
  }
  if (a5 == 4 && self->_mode != *(_DWORD *)a6)
  {
    self->_mode = *(_DWORD *)a6;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_owningDevice);
    v12 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained modeProperty:self changedValueTo:self->_mode];
    }

    else
    {
      BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v13) {
        sub_A3CC(v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }

  return a5 == 4;
}

- (void)setMode:(unsigned int)a3
{
  self->_mode = a3;
  -[CCAModeProperty sendPropertyChangeNotification](self, "sendPropertyChangeNotification");
}

- (unsigned)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
}

@end