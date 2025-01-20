@interface NWSRouteSnapshot
- (NSData)destination;
- (NSData)gateway;
- (NSData)mask;
- (NWSRouteSnapshot)initWithCounts:(const nstat_counts *)a3 routeDescriptor:(nstat_route_descriptor *)a4 sourceIdent:(unint64_t)a5 seqno:(unint64_t)a6;
- (double)rttAverage;
- (double)rttMinimum;
- (double)rttVariation;
- (id)description;
- (id)traditionalDictionary;
- (unint64_t)gatewayID;
- (unint64_t)parentID;
- (unint64_t)routeID;
- (unsigned)connectAttempts;
- (unsigned)connectSuccesses;
- (unsigned)flags;
- (unsigned)interfaceIndex;
- (unsigned)rxDuplicateBytes;
- (unsigned)rxOutOfOrderBytes;
- (unsigned)txRetransmittedBytes;
- (void)_initWithDescriptor:(nstat_route_descriptor *)a3;
@end

@implementation NWSRouteSnapshot

- (unsigned)rxDuplicateBytes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWSRouteSnapshot;
  return -[NWSSnapshot _rxDuplicateBytes](&v3, sel__rxDuplicateBytes);
}

- (unsigned)rxOutOfOrderBytes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWSRouteSnapshot;
  return -[NWSSnapshot _rxOutOfOrderBytes](&v3, sel__rxOutOfOrderBytes);
}

- (unsigned)txRetransmittedBytes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWSRouteSnapshot;
  return -[NWSSnapshot _txRetransmittedBytes](&v3, sel__txRetransmittedBytes);
}

- (unsigned)connectAttempts
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWSRouteSnapshot;
  return -[NWSSnapshot _connectAttempts](&v3, sel__connectAttempts);
}

- (unsigned)connectSuccesses
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWSRouteSnapshot;
  return -[NWSSnapshot _connectSuccesses](&v3, sel__connectSuccesses);
}

- (double)rttMinimum
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWSRouteSnapshot;
  -[NWSSnapshot _rttMinimum](&v3, sel__rttMinimum);
  return result;
}

- (double)rttAverage
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWSRouteSnapshot;
  -[NWSSnapshot _rttAverage](&v3, sel__rttAverage);
  return result;
}

- (double)rttVariation
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWSRouteSnapshot;
  -[NWSSnapshot _rttVariation](&v3, sel__rttVariation);
  return result;
}

- (unint64_t)routeID
{
  return self->_descriptor.id;
}

- (unint64_t)parentID
{
  return self->_descriptor.parent_id;
}

- (unint64_t)gatewayID
{
  return self->_descriptor.gateway_id;
}

- (unsigned)interfaceIndex
{
  return self->_descriptor.ifindex;
}

- (unsigned)flags
{
  return self->_descriptor.flags;
}

- (NSData)destination
{
  destination = self->_destination;
  if (!destination)
  {
    if (self->_descriptor.dst.v4.sin_len)
    {
      v4 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&self->_descriptor.dst length:self->_descriptor.dst.v4.sin_len];
      v5 = self->_destination;
      self->_destination = v4;

      destination = self->_destination;
    }

    else
    {
      destination = 0LL;
    }
  }

  return destination;
}

- (NSData)gateway
{
  gateway = self->_gateway;
  if (!gateway)
  {
    if (self->_descriptor.gateway.v4.sin_len)
    {
      v4 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&self->_descriptor.gateway length:self->_descriptor.gateway.v4.sin_len];
      v5 = self->_gateway;
      self->_gateway = v4;

      gateway = self->_gateway;
    }

    else
    {
      gateway = 0LL;
    }
  }

  return gateway;
}

- (NSData)mask
{
  mask = self->_mask;
  if (!mask)
  {
    if (self->_descriptor.mask.v4.sin_len)
    {
      v4 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&self->_descriptor.mask length:self->_descriptor.mask.v4.sin_len];
      v5 = self->_mask;
      self->_mask = v4;

      mask = self->_mask;
    }

    else
    {
      mask = 0LL;
    }
  }

  return mask;
}

- (id)traditionalDictionary
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___NWSRouteSnapshot;
  -[NWSSnapshot _createCountsForProvider:](&v25, sel__createCountsForProvider_, 1LL);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    [v3 setObject:kNStatProviderRoute forKeyedSubscript:kNStatSrcKeyProvider];
    p_descriptor = &self->_descriptor;
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_descriptor.id];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v6 forKeyedSubscript:kNStatSrcKeyRouteID];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_descriptor.parent_id];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v7 forKeyedSubscript:kNStatSrcKeyRouteParentID];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_descriptor.gateway_id];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v8 forKeyedSubscript:kNStatSrcKeyRouteGatewayID];
    v9 = -[NWSRouteSnapshot destination](self, "destination");
    if (v9)
    {
      v10 = (void *)MEMORY[0x189603F48];
      v11 = -[NWSRouteSnapshot destination](self, "destination");
      [v10 dataWithData:v11];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setObject:v12 forKeyedSubscript:kNStatSrcKeyRouteDestination];
    }
    v13 = -[NWSRouteSnapshot mask](self, "mask");
    if (v13)
    {
      v14 = (void *)MEMORY[0x189603F48];
      v15 = -[NWSRouteSnapshot mask](self, "mask");
      [v14 dataWithData:v15];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setObject:v16 forKeyedSubscript:kNStatSrcKeyRouteMask];
    }
    v17 = -[NWSRouteSnapshot gateway](self, "gateway");
    if (v17)
    {
      v18 = (void *)MEMORY[0x189603F48];
      v19 = -[NWSRouteSnapshot gateway](self, "gateway");
      [v18 dataWithData:v19];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setObject:v20 forKeyedSubscript:kNStatSrcKeyRouteGateway];
    }

    [MEMORY[0x189607968] numberWithUnsignedInt:p_descriptor->ifindex];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v21 forKeyedSubscript:kNStatSrcKeyInterface];

    [MEMORY[0x189607968] numberWithUnsignedInt:p_descriptor->flags];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v22 forKeyedSubscript:kNStatSrcKeyRouteFlags];

    id v23 = v4;
  }

  return v4;
}

- (void)_initWithDescriptor:(nstat_route_descriptor *)a3
{
  sockaddr v3 = *(sockaddr *)((char *)&a3->dst.sa + 24);
  __int128 v5 = *(_OWORD *)&a3->id;
  __int128 v4 = *(_OWORD *)&a3->gateway_id;
  *(_OWORD *)&self->_descriptor.dst.sa.sa_data[6] = *(_OWORD *)&a3->dst.sa.sa_data[6];
  *(sockaddr *)((char *)&self->_descriptor.dst.sa + 24) = v3;
  *(_OWORD *)&self->_descriptor.id = v5;
  *(_OWORD *)&self->_descriptor.gateway_id = v4;
  sockaddr_in v7 = a3->gateway.v4;
  __int128 v6 = *((_OWORD *)&a3->gateway.sa + 1);
  __int128 v8 = *(_OWORD *)&a3->mask.sa.sa_data[10];
  *(void *)&self->_descriptor.flags = *(void *)&a3->flags;
  self->_descriptor.gateway.__int128 v4 = v7;
  *((_OWORD *)&self->_descriptor.gateway.sa + 1) = v6;
  *(_OWORD *)&self->_descriptor.mask.sa.sa_data[10] = v8;
}

- (id)description
{
  __ret = 0LL;
  p_descriptor = &self->_descriptor;
  if ((self->_descriptor.flags & 4) != 0)
  {
    __int128 v6 = (_printf_domain *)printf_domain();
    sockaddr_in v7 = "Scoped ";
    if ((p_descriptor->flags & 0x1000000) == 0) {
      sockaddr_in v7 = "";
    }
    asxprintf( &__ret,  v6,  0LL,  "NWRouteSnapshot %s%N->%I->%N",  v7,  &p_descriptor->dst,  p_descriptor->ifindex,  &p_descriptor->gateway);
  }

  else
  {
    uint64_t v3 = maskLeadingBitsCount(&self->_descriptor.mask.v4.sin_len);
    __int128 v4 = (_printf_domain *)printf_domain();
    if ((p_descriptor->flags & 0x1000000) != 0) {
      __int128 v5 = "Scoped ";
    }
    else {
      __int128 v5 = "";
    }
    if (v3) {
      asxprintf( &__ret,  v4,  0LL,  "NWRouteSnapshot %s%N/%d->%I->%N",  v5,  &p_descriptor->dst,  v3,  p_descriptor->ifindex,  &p_descriptor->gateway);
    }
    else {
      asxprintf(&__ret, v4, 0LL, "NWRouteSnapshot %sDefault->%I->%N", v5, p_descriptor->ifindex, &p_descriptor->gateway);
    }
  }

  if (!__ret) {
    return 0LL;
  }
  [NSString stringWithCString:__ret encoding:4];
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();
  free(__ret);
  return v8;
}

- (NWSRouteSnapshot)initWithCounts:(const nstat_counts *)a3 routeDescriptor:(nstat_route_descriptor *)a4 sourceIdent:(unint64_t)a5 seqno:(unint64_t)a6
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NWSRouteSnapshot;
  sockaddr_in v7 = -[NWSSnapshot _initWithCounts:sourceIdent:seqno:](&v10, sel__initWithCounts_sourceIdent_seqno_, a3, a5, a6);
  __int128 v8 = v7;
  if (v7) {
    -[NWSRouteSnapshot _initWithDescriptor:](v7, "_initWithDescriptor:", a4);
  }
  return v8;
}

- (void).cxx_destruct
{
}

@end