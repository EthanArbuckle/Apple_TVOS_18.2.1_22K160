@interface NRLinkManager
- (BOOL)endpointsAreCompatible:(id)a3 remoteEndpoint:(id)a4;
- (BOOL)shouldCreateLinkForNRUUID:(id)a3;
- (id)copyName;
- (id)copyStatusString;
- (id)initManagerWithQueue:(id)a3 managerDelegate:(id)a4;
- (void)invalidateManager;
- (void)reportEvent:(unsigned int)a3;
- (void)reportEvent:(unsigned int)a3 details:(id)a4;
- (void)reportEvent:(unsigned int)a3 detailsFormat:(id)a4;
@end

@implementation NRLinkManager

- (id)initManagerWithQueue:(id)a3 managerDelegate:(id)a4
{
  v7 = (dispatch_queue_s *)a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = sub_1000CA434();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v13, 17LL);

    if (IsLevelEnabled)
    {
      id v15 = sub_1000CA434();
      _NRLogWithArgs(v15, 17LL, "%s called with null queue");
LABEL_10:

      v11 = 0LL;
      goto LABEL_5;
    }

- (id)copyStatusString
{
  return @"No status";
}

- (id)copyName
{
  return 0LL;
}

- (void)reportEvent:(unsigned int)a3 details:(id)a4
{
  id v6 = a4;
  id v7 = -[NRLinkManager copyName](self, "copyName");
  sub_10011BB18(0LL, a3, v7, v6);
}

- (void)reportEvent:(unsigned int)a3 detailsFormat:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v6, &v8);

  -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", v4, v7);
}

- (void)reportEvent:(unsigned int)a3
{
}

- (void)invalidateManager
{
}

- (BOOL)shouldCreateLinkForNRUUID:(id)a3
{
  id v4 = a3;
  if (self)
  {
    if (self->_type)
    {
      v5 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, v4);
      id v6 = v5;
      if (v5) {
        id v7 = (void *)*((void *)v5 + 16);
      }
      else {
        id v7 = 0LL;
      }
      id v8 = v7;

      if (v8)
      {
        if (v6) {
          v9 = (void *)*((void *)v6 + 16);
        }
        else {
          v9 = 0LL;
        }
        id v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allowedLinkTypes]);
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  self->_type));
        LOBYTE(self) = [v11 containsObject:v12];
      }

      else
      {
        LOBYTE(self) = 1;
      }
    }

    else
    {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (BOOL)endpointsAreCompatible:(id)a3 remoteEndpoint:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 addressFamily];
  if (v7 != [v6 addressFamily]) {
    goto LABEL_3;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 hostname]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 hostname]);
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) != 0) {
    goto LABEL_3;
  }
  id v13 = [v5 address];
  v14 = [v6 address];
  if ([v5 addressFamily] != (id)2)
  {
    if ([v5 addressFamily] == (id)30)
    {
      BOOL v15 = v13[8] == 254 && (v13[9] & 0xC0) == 128;
      if (v14[8] == 254)
      {
        if (v15 == ((v14[9] & 0xC0) == 128)) {
          goto LABEL_16;
        }
        goto LABEL_3;
      }

      if (v15) {
        goto LABEL_3;
      }
    }

- (void).cxx_destruct
{
}

@end