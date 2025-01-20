@interface RPTransportServiceHandoverMessage
+ (RPTransportServiceHandoverMessage)messageWithMetadata:(id)a3 applicationLabel:(id)a4 payload:(id)a5 version:(id)a6;
- (NSArray)transportServicesMetadata;
- (NSString)applicationLabel;
- (NSString)version;
- (RPNearFieldMessagePayload)payload;
- (RPTransportServiceHandoverMessage)initWithMetadata:(id)a3 applicationLabel:(id)a4 payload:(id)a5 version:(id)a6;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)transportServicesMetadataDictionaryRepresentation;
@end

@implementation RPTransportServiceHandoverMessage

- (RPTransportServiceHandoverMessage)initWithMetadata:(id)a3 applicationLabel:(id)a4 payload:(id)a5 version:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___RPTransportServiceHandoverMessage;
  v14 = -[RPTransportServiceHandoverMessage init](&v22, "init");
  if (v14)
  {
    v15 = (NSArray *)[v10 copy];
    transportServicesMetadata = v14->_transportServicesMetadata;
    v14->_transportServicesMetadata = v15;

    v17 = (NSString *)[v11 copy];
    applicationLabel = v14->_applicationLabel;
    v14->_applicationLabel = v17;

    objc_storeStrong((id *)&v14->_payload, a5);
    v19 = (NSString *)[v13 copy];
    version = v14->_version;
    v14->_version = v19;
  }

  return v14;
}

+ (RPTransportServiceHandoverMessage)messageWithMetadata:(id)a3 applicationLabel:(id)a4 payload:(id)a5 version:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v16 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v14, v15)),  "initWithMetadata:applicationLabel:payload:version:",  v13,  v12,  v11,  v10);

  return (RPTransportServiceHandoverMessage *)v16;
}

- (id)transportServicesMetadataDictionaryRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v4 = self->_transportServicesMetadata;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v11 + 1) + 8 * (void)v8),  "dictionaryRepresentation",  (void)v11));
        -[NSMutableArray addObject:](v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (id)description
{
  return -[RPTransportServiceHandoverMessage descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v34 = 0LL;
  uint64_t v5 = objc_opt_class(self, a2, *(void *)&a3);
  NSAppendPrintF(&v34, "%@", v5);
  id v6 = v34;
  id v7 = v6;
  version = self->_version;
  if (version)
  {
    id v33 = v6;
    v9 = version;
    NSAppendPrintF(&v33, " Ver %@", v9);
    id v10 = v33;

    id v7 = v10;
  }

  applicationLabel = self->_applicationLabel;
  if (applicationLabel)
  {
    id v32 = v7;
    __int128 v12 = applicationLabel;
    NSAppendPrintF(&v32, " applicationLabel %@", v12);
    id v13 = v32;

    id v7 = v13;
  }

  payload = self->_payload;
  if (payload)
  {
    id v31 = v7;
    uint64_t v15 = payload;
    NSAppendPrintF(&v31, " payload: %@", v15);
    id v16 = v31;

    id v7 = v16;
  }

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  v17 = self->_transportServicesMetadata;
  id v18 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      v21 = 0LL;
      objc_super v22 = v7;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        v23 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v21);
        id v26 = v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 descriptionWithLevel:v3]);
        NSAppendPrintF(&v26, "\n\t%@", v24);
        id v7 = v26;

        v21 = (char *)v21 + 1;
        objc_super v22 = v7;
      }

      while (v19 != v21);
      id v19 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
    }

    while (v19);
  }

  return v7;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)applicationLabel
{
  return self->_applicationLabel;
}

- (RPNearFieldMessagePayload)payload
{
  return self->_payload;
}

- (NSArray)transportServicesMetadata
{
  return self->_transportServicesMetadata;
}

- (void).cxx_destruct
{
}

@end