@interface RPTransportServiceMetadata
+ (id)metadataWithDictionary:(id)a3;
- (RPTransportServiceMetadata)initWithDictionary:(id)a3;
- (RPTransportServiceMetadata)initWithTransportServiceType:(unint64_t)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)dictionaryRepresentation;
- (unint64_t)serviceType;
@end

@implementation RPTransportServiceMetadata

+ (id)metadataWithDictionary:(id)a3
{
  id v3 = a3;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v3, &off_10011AFE8, TypeID, 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  v7 = v6;
  else {
    v8 = &off_1001106C8;
  }

  id v9 = [objc_alloc(*v8) initWithDictionary:v3];
  return v9;
}

- (RPTransportServiceMetadata)initWithTransportServiceType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RPTransportServiceMetadata;
  result = -[RPTransportServiceMetadata init](&v5, "init");
  if (result) {
    result->_serviceType = a3;
  }
  return result;
}

- (RPTransportServiceMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RPTransportServiceMetadata;
  objc_super v5 = -[RPTransportServiceMetadata init](&v12, "init");
  if (v5)
  {
    id v6 = v4;
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue(v6, &off_10011AFE8, TypeID, 0LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

    if (v9)
    {
      else {
        uint64_t v10 = -1LL;
      }
    }

    else
    {
      uint64_t v10 = -1LL;
    }

    v5->_serviceType = v10;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v2 = @"Other";
  if (self->_serviceType == 1) {
    v2 = @"Bonjour";
  }
  id v6 = &off_10011AFE8;
  v7 = v2;
  id v3 = v2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));

  return v4;
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (id)description
{
  return -[RPTransportServiceMetadata descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  id v10 = 0LL;
  uint64_t v4 = objc_opt_class(self, a2, *(void *)&a3);
  NSAppendPrintF(&v10, "%@", v4);
  id v5 = v10;
  id v9 = v5;
  if (self->_serviceType == 1) {
    id v6 = @"Bonjour";
  }
  else {
    id v6 = @"Other";
  }
  NSAppendPrintF(&v9, ", serviceType %@", v6);
  id v7 = v9;

  return v7;
}

@end