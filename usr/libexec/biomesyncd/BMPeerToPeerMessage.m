@interface BMPeerToPeerMessage
- (BMSyncDevicePeer)peer;
- (double)walltime;
- (id)dictionaryRepresentation;
- (id)initFromDictionary:(id)a3;
- (unint64_t)protocolVersion;
- (unint64_t)syncReason;
- (void)setPeer:(id)a3;
- (void)setProtocolVersion:(unint64_t)a3;
- (void)setSyncReason:(unint64_t)a3;
- (void)setWalltime:(double)a3;
@end

@implementation BMPeerToPeerMessage

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___BMPeerToPeerMessage;
  v5 = -[BMPeerToPeerMessage init](&v15, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"protocolVersion"]);
    v5->_protocolVersion = (unint64_t)[v6 unsignedIntegerValue];

    v7 = objc_alloc(&OBJC_CLASS___BMSyncDevicePeer);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"peer"]);
    v9 = -[BMSyncDevicePeer initFromDictionary:](v7, "initFromDictionary:", v8);
    peer = v5->_peer;
    v5->_peer = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"walltime"]);
    [v11 doubleValue];
    v5->_walltime = v12;

    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"syncReason"]);
    v5->_syncReason = (unint64_t)[v13 unsignedIntegerValue];
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v9[0] = @"protocolVersion";
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_protocolVersion));
  v10[0] = v3;
  v9[1] = @"peer";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDevicePeer dictionaryRepresentation](self->_peer, "dictionaryRepresentation"));
  v10[1] = v4;
  v9[2] = @"walltime";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_walltime));
  v10[2] = v5;
  v9[3] = @"syncReason";
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_syncReason));
  v10[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4LL));

  return v7;
}

- (BMSyncDevicePeer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(unint64_t)a3
{
  self->_protocolVersion = a3;
}

- (double)walltime
{
  return self->_walltime;
}

- (void)setWalltime:(double)a3
{
  self->_walltime = a3;
}

- (unint64_t)syncReason
{
  return self->_syncReason;
}

- (void)setSyncReason:(unint64_t)a3
{
  self->_syncReason = a3;
}

- (void).cxx_destruct
{
}

@end