@interface CCAModeSupportedProperty
- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7;
- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int)a5 andData:(const void *)a6 forClient:(int)a7;
- (BOOL)supported;
- (CCAModeSupportedProperty)init;
- (unsigned)dataSizeWithQualifierSize:(unsigned int)a3 andQualifierData:(const void *)a4;
- (void)setSupported:(BOOL)a3;
@end

@implementation CCAModeSupportedProperty

- (CCAModeSupportedProperty)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CCAModeSupportedProperty;
  v2 = -[CCAModeSupportedProperty initWithSelector:scope:element:propertyDataType:andQualifierDataType:]( &v5,  "initWithSelector:scope:element:propertyDataType:andQualifierDataType:",  1835299696LL,  1768845428LL,  0LL,  1918990199LL,  0LL);
  v3 = v2;
  if (v2)
  {
    v2->_supported = 1;
    -[CCAModeSupportedProperty setSettable:](v2, "setSettable:", 0LL);
  }

  return v3;
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
    *(_DWORD *)a6 = self->_supported;
    *a5 = 4;
  }

  return v7 > 3;
}

- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int)a5 andData:(const void *)a6 forClient:(int)a7
{
  BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v7) {
    sub_A318(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  return 0;
}

- (BOOL)supported
{
  return self->_supported;
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

@end