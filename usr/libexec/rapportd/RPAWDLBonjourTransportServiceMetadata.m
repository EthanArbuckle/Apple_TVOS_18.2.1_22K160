@interface RPAWDLBonjourTransportServiceMetadata
- (BOOL)isSingleBandModeRequired;
- (RPAWDLBonjourTransportServiceMetadata)initWithDictionary:(id)a3;
- (RPAWDLBonjourTransportServiceMetadata)initWithSingleBandModeRequired:(BOOL)a3;
- (id)descriptionWithLevel:(int)a3;
- (id)dictionaryRepresentation;
@end

@implementation RPAWDLBonjourTransportServiceMetadata

- (RPAWDLBonjourTransportServiceMetadata)initWithSingleBandModeRequired:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RPAWDLBonjourTransportServiceMetadata;
  v4 = -[RPTransportServiceMetadata initWithTransportServiceType:](&v8, "initWithTransportServiceType:", 1LL);
  v5 = v4;
  if (v4)
  {
    v4->_isSingleBandModeRequired = a3;
    v6 = v4;
  }

  return v5;
}

- (RPAWDLBonjourTransportServiceMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v4, &off_10011AFE8, TypeID, 0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  objc_super v8 = v7;
  if (v7 && ([v7 isEqual:@"Bonjour"] & 1) != 0)
  {

    uint64_t Int64 = CFDictionaryGetInt64(v4, &off_10011B000, &v17);
    int v10 = v17;
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___RPAWDLBonjourTransportServiceMetadata;
    v11 = -[RPTransportServiceMetadata initWithDictionary:](&v16, "initWithDictionary:", v4);
    if (v11)
    {
      if (v10) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = Int64 == 0;
      }
      char v13 = !v12;
      v11->_isSingleBandModeRequired = v13;
    }

    self = v11;
    v14 = self;
  }

  else
  {

    v14 = 0LL;
  }

  return v14;
}

- (id)dictionaryRepresentation
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RPAWDLBonjourTransportServiceMetadata;
  id v3 = -[RPTransportServiceMetadata dictionaryRepresentation](&v8, "dictionaryRepresentation");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v4));

  if (self->_isSingleBandModeRequired) {
    v6 = (const void **)&kCFBooleanTrue;
  }
  else {
    v6 = (const void **)&kCFBooleanFalse;
  }
  CFDictionarySetValue(v5, &off_10011B000, *v6);
  return v5;
}

- (id)descriptionWithLevel:(int)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RPAWDLBonjourTransportServiceMetadata;
  id v4 = -[RPTransportServiceMetadata descriptionWithLevel:](&v11, "descriptionWithLevel:", *(void *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v5 mutableCopy];

  BOOL isSingleBandModeRequired = self->_isSingleBandModeRequired;
  id v10 = v6;
  NSAppendPrintF(&v10, " single band required: %d", isSingleBandModeRequired);
  id v7 = v10;

  return v7;
}

- (BOOL)isSingleBandModeRequired
{
  return self->_isSingleBandModeRequired;
}

@end