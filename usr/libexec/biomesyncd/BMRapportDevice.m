@interface BMRapportDevice
+ (BOOL)supportsSecureCoding;
- (BMAccount)account;
- (BMRapportDevice)initWithCoder:(id)a3;
- (BMRapportDevice)initWithRPCompanionLinkDevice:(id)a3;
- (BMRapportDeviceCommunicationClient)client;
- (BOOL)isEqual:(id)a3;
- (NSArray)serviceTypes;
- (NSMutableArray)requestQueue;
- (NSString)bmDeviceIdentifier;
- (NSString)model;
- (NSString)name;
- (NSString)rapportIdentifier;
- (NSString)shortenedRapportIdentifier;
- (RPCompanionLinkDevice)device;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)platform;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)handleInvalidationWithError:(id)a3;
- (void)invalidateClientWithError:(id)a3;
- (void)setBmDeviceIdentifier:(id)a3;
- (void)setClient:(id)a3;
- (void)setDevice:(id)a3;
- (void)setRequestQueue:(id)a3;
@end

@implementation BMRapportDevice

- (BMRapportDevice)initWithRPCompanionLinkDevice:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___BMRapportDevice;
  v6 = -[BMRapportDevice init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bm_companionLinkDeviceIdentifier"));
    rapportIdentifier = v7->_rapportIdentifier;
    v7->_rapportIdentifier = (NSString *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    requestQueue = v7->_requestQueue;
    v7->_requestQueue = (NSMutableArray *)v10;
  }

  return v7;
}

- (BMAccount)account
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice accountAltDSID](self->_device, "accountAltDSID"));
  if (v2) {
    v3 = -[BMAccount initWithAccountIdentifier:](objc_alloc(&OBJC_CLASS___BMAccount), "initWithAccountIdentifier:", v2);
  }
  else {
    v3 = 0LL;
  }

  return v3;
}

- (NSString)shortenedRapportIdentifier
{
  return -[NSString substringToIndex:](self->_rapportIdentifier, "substringToIndex:", 8LL);
}

- (NSString)name
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);

  return (NSString *)v3;
}

- (NSString)model
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 model]);

  return (NSString *)v3;
}

- (NSArray)serviceTypes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 serviceTypes]);

  return (NSArray *)v3;
}

- (int64_t)platform
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 model]);
  int64_t v4 = BMDevicePlatformFromModelString(v3);

  return v4;
}

- (void)invalidateClientWithError:(id)a3
{
  client = self->_client;
  if (client)
  {
    self->_client = 0LL;
    v6 = client;
    id v7 = a3;

    -[BMRapportDeviceCommunicationClient invalidate](v6, "invalidate");
    -[BMRapportDevice handleInvalidationWithError:](self, "handleInvalidationWithError:", v7);
  }

- (void)handleInvalidationWithError:(id)a3
{
  id v4 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v16 = self;
  id v5 = self->_requestQueue;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v23,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v17 + 1) + 8 * (void)i) objectForKeyedSubscript:@"~~RESPONSE_HANDLER~~"]);
        v11 = (void (**)(void, void, void, void))v10;
        if (v10)
        {
          if (v4)
          {
            (*(void (**)(uint64_t, void, void, id))(v10 + 16))(v10, 0LL, 0LL, v4);
          }

          else
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMRapportErrorDomain",  4LL,  0LL));
            ((void (**)(void, void, void, void *))v11)[2](v11, 0LL, 0LL, v12);
          }
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v23,  16LL);
    }

    while (v7);
  }

  -[NSMutableArray removeAllObjects](v16->_requestQueue, "removeAllObjects");
  uint64_t v13 = __biome_log_for_category(11LL);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice shortenedRapportIdentifier](v16, "shortenedRapportIdentifier"));
    *(_DWORD *)buf = 138412290;
    v22 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "BMRapportDevice[%@]: invalidated", buf, 0xCu);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 rapportIdentifier]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice rapportIdentifier](self, "rapportIdentifier"));
    unsigned __int8 v9 = [v7 isEqual:v8];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice rapportIdentifier](self, "rapportIdentifier"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice device](self, "device"));
  id v4 = v3;
  if (v3)
  {
    [v3 operatingSystemVersion];
  }

  else
  {
    __int128 v13 = 0uLL;
    uint64_t v14 = 0LL;
  }

  uint64_t v5 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice shortenedRapportIdentifier](self, "shortenedRapportIdentifier"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice rapportIdentifier](self, "rapportIdentifier"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice bmDeviceIdentifier](self, "bmDeviceIdentifier"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice model](self, "model"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice name](self, "name"));
  v11 = -[NSString initWithFormat:]( v5,  "initWithFormat:",  @"BMRapportDevice[%@]: id=%@ bmID=%@ model=%@ name=%@ version=%ld.%ld.%ld",  v6,  v7,  v8,  v9,  v10,  v13,  v14);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = self;
  return -[BMRapportDevice initWithRPCompanionLinkDevice:](v3, "initWithRPCompanionLinkDevice:", v3->_device);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BMRapportDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(RPCompanionLinkDevice, v5),  @"device");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = -[BMRapportDevice initWithRPCompanionLinkDevice:](self, "initWithRPCompanionLinkDevice:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[BMRapportDevice device](self, "device"));
  [v4 encodeObject:v5 forKey:@"device"];
}

- (NSString)rapportIdentifier
{
  return self->_rapportIdentifier;
}

- (NSString)bmDeviceIdentifier
{
  return self->_bmDeviceIdentifier;
}

- (void)setBmDeviceIdentifier:(id)a3
{
}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (BMRapportDeviceCommunicationClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSMutableArray)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end