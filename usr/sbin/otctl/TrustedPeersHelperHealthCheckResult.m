@interface TrustedPeersHelperHealthCheckResult
+ (BOOL)supportsSecureCoding;
- (BOOL)escrowRecordGarbageCollectionEnabled;
- (BOOL)leaveTrust;
- (BOOL)postEscrowCFU;
- (BOOL)postRepairCFU;
- (BOOL)reroll;
- (BOOL)resetOctagon;
- (BOOL)superfluousPeersCleanupEnabled;
- (BOOL)tlkShareGarbageCollectionEnabled;
- (OTEscrowMoveRequestContext)moveRequest;
- (TrustedPeersHelperHealthCheckResult)initWithCoder:(id)a3;
- (TrustedPeersHelperHealthCheckResult)initWithPostRepairCFU:(BOOL)a3 postEscrowCFU:(BOOL)a4 resetOctagon:(BOOL)a5 leaveTrust:(BOOL)a6 reroll:(BOOL)a7 moveRequest:(id)a8 totalEscrowRecords:(unint64_t)a9 collectableEscrowRecords:(unint64_t)a10 collectedEscrowRecords:(unint64_t)a11 escrowRecordGarbageCollectionEnabled:(BOOL)a12 totalTlkShares:(unint64_t)a13 collectableTlkShares:(unint64_t)a14 collectedTlkShares:(unint64_t)a15 tlkShareGarbageCollectionEnabled:(BOOL)a16 totalPeers:(unint64_t)a17 trustedPeers:(unint64_t)a18 superfluousPeers:(unint64_t)a19 peersCleanedup:(unint64_t)a20 superfluousPeersCleanupEnabled:(BOOL)a21;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)collectableEscrowRecords;
- (unint64_t)collectableTlkShares;
- (unint64_t)collectedEscrowRecords;
- (unint64_t)collectedTlkShares;
- (unint64_t)peersCleanedup;
- (unint64_t)superfluousPeers;
- (unint64_t)totalEscrowRecords;
- (unint64_t)totalPeers;
- (unint64_t)totalTlkShares;
- (unint64_t)trustedPeers;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectableEscrowRecords:(unint64_t)a3;
- (void)setCollectableTlkShares:(unint64_t)a3;
- (void)setCollectedEscrowRecords:(unint64_t)a3;
- (void)setCollectedTlkShares:(unint64_t)a3;
- (void)setEscrowRecordGarbageCollectionEnabled:(BOOL)a3;
- (void)setLeaveTrust:(BOOL)a3;
- (void)setMoveRequest:(id)a3;
- (void)setPeersCleanedup:(unint64_t)a3;
- (void)setPostEscrowCFU:(BOOL)a3;
- (void)setPostRepairCFU:(BOOL)a3;
- (void)setReroll:(BOOL)a3;
- (void)setResetOctagon:(BOOL)a3;
- (void)setSuperfluousPeers:(unint64_t)a3;
- (void)setSuperfluousPeersCleanupEnabled:(BOOL)a3;
- (void)setTlkShareGarbageCollectionEnabled:(BOOL)a3;
- (void)setTotalEscrowRecords:(unint64_t)a3;
- (void)setTotalPeers:(unint64_t)a3;
- (void)setTotalTlkShares:(unint64_t)a3;
- (void)setTrustedPeers:(unint64_t)a3;
@end

@implementation TrustedPeersHelperHealthCheckResult

- (TrustedPeersHelperHealthCheckResult)initWithPostRepairCFU:(BOOL)a3 postEscrowCFU:(BOOL)a4 resetOctagon:(BOOL)a5 leaveTrust:(BOOL)a6 reroll:(BOOL)a7 moveRequest:(id)a8 totalEscrowRecords:(unint64_t)a9 collectableEscrowRecords:(unint64_t)a10 collectedEscrowRecords:(unint64_t)a11 escrowRecordGarbageCollectionEnabled:(BOOL)a12 totalTlkShares:(unint64_t)a13 collectableTlkShares:(unint64_t)a14 collectedTlkShares:(unint64_t)a15 tlkShareGarbageCollectionEnabled:(BOOL)a16 totalPeers:(unint64_t)a17 trustedPeers:(unint64_t)a18 superfluousPeers:(unint64_t)a19 peersCleanedup:(unint64_t)a20 superfluousPeersCleanupEnabled:(BOOL)a21
{
  id v28 = a8;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___TrustedPeersHelperHealthCheckResult;
  v29 = -[TrustedPeersHelperHealthCheckResult init](&v32, "init");
  v30 = v29;
  if (v29)
  {
    v29->_postRepairCFU = a3;
    v29->_postEscrowCFU = a4;
    v29->_resetOctagon = a5;
    v29->_leaveTrust = a6;
    v29->_reroll = a7;
    objc_storeStrong((id *)&v29->_moveRequest, a8);
    v30->_totalEscrowRecords = a9;
    v30->_collectableEscrowRecords = a10;
    v30->_escrowRecordGarbageCollectionEnabled = a12;
    v30->_collectedEscrowRecords = a11;
    v30->_totalTlkShares = a13;
    v30->_collectableTlkShares = a14;
    v30->_collectedTlkShares = a15;
    v30->_tlkShareGarbageCollectionEnabled = a16;
    v30->_totalPeers = a17;
    v30->_trustedPeers = a18;
    v30->_superfluousPeers = a19;
    v30->_peersCleanedup = a20;
    v30->_superfluousPeersCleanupEnabled = a21;
  }

  return v30;
}

- (id)description
{
  if (-[TrustedPeersHelperHealthCheckResult postRepairCFU](self, "postRepairCFU")) {
    v3 = @"true";
  }
  else {
    v3 = @"false";
  }
  v29 = v3;
  if (-[TrustedPeersHelperHealthCheckResult postEscrowCFU](self, "postEscrowCFU")) {
    v4 = @"true";
  }
  else {
    v4 = @"false";
  }
  id v28 = v4;
  if (-[TrustedPeersHelperHealthCheckResult resetOctagon](self, "resetOctagon")) {
    v5 = @"true";
  }
  else {
    v5 = @"false";
  }
  v27 = v5;
  if (-[TrustedPeersHelperHealthCheckResult leaveTrust](self, "leaveTrust")) {
    v6 = @"true";
  }
  else {
    v6 = @"false";
  }
  v26 = v6;
  if (-[TrustedPeersHelperHealthCheckResult reroll](self, "reroll")) {
    v7 = @"true";
  }
  else {
    v7 = @"false";
  }
  v25 = v7;
  v24 = [self moveRequest];
  unint64_t v23 = -[TrustedPeersHelperHealthCheckResult totalEscrowRecords](self, "totalEscrowRecords");
  unint64_t v22 = -[TrustedPeersHelperHealthCheckResult collectableEscrowRecords](self, "collectableEscrowRecords");
  unint64_t v21 = -[TrustedPeersHelperHealthCheckResult collectedEscrowRecords](self, "collectedEscrowRecords");
  if (-[TrustedPeersHelperHealthCheckResult escrowRecordGarbageCollectionEnabled]( self,  "escrowRecordGarbageCollectionEnabled"))
  {
    v8 = @"true";
  }

  else
  {
    v8 = @"false";
  }

  v20 = v8;
  unint64_t v19 = -[TrustedPeersHelperHealthCheckResult totalTlkShares](self, "totalTlkShares");
  unint64_t v9 = -[TrustedPeersHelperHealthCheckResult collectableTlkShares](self, "collectableTlkShares");
  unint64_t v10 = -[TrustedPeersHelperHealthCheckResult collectedTlkShares](self, "collectedTlkShares");
  if (-[TrustedPeersHelperHealthCheckResult tlkShareGarbageCollectionEnabled](self, "tlkShareGarbageCollectionEnabled")) {
    v11 = @"true";
  }
  else {
    v11 = @"false";
  }
  unint64_t v12 = -[TrustedPeersHelperHealthCheckResult totalPeers](self, "totalPeers");
  unint64_t v13 = -[TrustedPeersHelperHealthCheckResult trustedPeers](self, "trustedPeers");
  unint64_t v14 = -[TrustedPeersHelperHealthCheckResult superfluousPeers](self, "superfluousPeers");
  unint64_t v15 = -[TrustedPeersHelperHealthCheckResult peersCleanedup](self, "peersCleanedup");
  if (-[TrustedPeersHelperHealthCheckResult superfluousPeersCleanupEnabled](self, "superfluousPeersCleanupEnabled")) {
    v16 = @"true";
  }
  else {
    v16 = @"false";
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<HealthCheckResult: postRepairCFU: %@, postEscrowCFU: %@, resetOctagon: %@, leaveTrust: %@, reroll: %@, moveRequest? %@, totalEscrowRecords: %llu, collectableEscrowRecords: %llu, collectedEscrowRecords: %llu, escrowRecordGarbageCollectionEnabled: %@, totalTlkShares: %llu, collectableTlkShares: %llu, collectedTlkShares: %llu, tlkShareGarbageCollectionEnabled: %@, totalPeers: %llu, trustedPeers: %llu, superfluousPeers: %llu, peersCleanedup: %llu, superfluousPeersCleanupEnabled: %@>",  v29,  v28,  v27,  v26,  v25,  v24,  v23,  v22,  v21,  v20,  v19,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  v16));

  return v17;
}

- (TrustedPeersHelperHealthCheckResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TrustedPeersHelperHealthCheckResult;
  v5 = -[TrustedPeersHelperHealthCheckResult init](&v11, "init");
  if (v5)
  {
    v5->_postRepairCFU = [v4 decodeBoolForKey:@"postRepairCFU"];
    v5->_postEscrowCFU = [v4 decodeBoolForKey:@"postEscrowCFU"];
    v5->_resetOctagon = [v4 decodeBoolForKey:@"resetOctagon"];
    v5->_leaveTrust = [v4 decodeBoolForKey:@"leaveTrust"];
    v5->_reroll = [v4 decodeBoolForKey:@"reroll"];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class(OTEscrowMoveRequestContext, v6) forKey:@"moveRequest"];
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    moveRequest = v5->_moveRequest;
    v5->_moveRequest = (OTEscrowMoveRequestContext *)v8;

    v5->_totalEscrowRecords = (unint64_t)[v4 decodeInt64ForKey:@"totalEscrowRecords"];
    v5->_collectableEscrowRecords = (unint64_t)[v4 decodeInt64ForKey:@"collectableEscrowRecords"];
    v5->_collectedEscrowRecords = (unint64_t)[v4 decodeInt64ForKey:@"collectedEscrowRecords"];
    v5->_escrowRecordGarbageCollectionEnabled = [v4 decodeBoolForKey:@"escrowRecordGarbageCollectionEnabled"];
    v5->_totalTlkShares = (unint64_t)[v4 decodeInt64ForKey:@"totalTlkShares"];
    v5->_collectableTlkShares = (unint64_t)[v4 decodeInt64ForKey:@"collectableTlkShares"];
    v5->_collectedTlkShares = (unint64_t)[v4 decodeInt64ForKey:@"collectedTlkShares"];
    v5->_tlkShareGarbageCollectionEnabled = [v4 decodeBoolForKey:@"tlkShareGarbageCollectionEnabled"];
    v5->_totalPeers = (unint64_t)[v4 decodeInt64ForKey:@"totalPeers"];
    v5->_trustedPeers = (unint64_t)[v4 decodeInt64ForKey:@"trustedPeers"];
    v5->_superfluousPeers = (unint64_t)[v4 decodeInt64ForKey:@"superfluousPeers"];
    v5->_peersCleanedup = (unint64_t)[v4 decodeInt64ForKey:@"peersCleanedup"];
    v5->_superfluousPeersCleanupEnabled = [v4 decodeBoolForKey:@"superfluousPeersCleanupEnabled"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeBool:[self postRepairCFU] forKey:@"postRepairCFU"];
  [v5 encodeBool:[self postEscrowCFU] forKey:@"postEscrowCFU"];
  [v5 encodeBool:[self resetOctagon] forKey:@"resetOctagon"];
  [v5 encodeBool:[self leaveTrust] forKey:@"leaveTrust"];
  [v5 encodeBool:[self reroll] forKey:@"reroll"];
  id v4 = [self moveRequest];
  [v5 encodeObject:v4 forKey:@"moveRequest"];

  [v5 encodeInt64:-[TrustedPeersHelperHealthCheckResult totalEscrowRecords](self, "totalEscrowRecords") forKey:@"totalEscrowRecords"];
  [v5 encodeInt64:-[TrustedPeersHelperHealthCheckResult collectableEscrowRecords](self, "collectableEscrowRecords") forKey:@"collectableEscrowRecords"];
  [v5 encodeInt64:-[TrustedPeersHelperHealthCheckResult collectedEscrowRecords](self, "collectedEscrowRecords") forKey:@"collectedEscrowRecords"];
  [v5 encodeBool:[self escrowRecordGarbageCollectionEnabled] forKey:@"escrowRecordGarbageCollectionEnabled"];
  [v5 encodeInt64:-[TrustedPeersHelperHealthCheckResult totalTlkShares](self, "totalTlkShares") forKey:@"totalTlkShares"];
  [v5 encodeInt64:-[TrustedPeersHelperHealthCheckResult collectableTlkShares](self, "collectableTlkShares") forKey:@"collectableTlkShares"];
  [v5 encodeInt64:-[TrustedPeersHelperHealthCheckResult collectedTlkShares](self, "collectedTlkShares") forKey:@"collectedTlkShares"];
  [v5 encodeBool:[self tlkShareGarbageCollectionEnabled] forKey:@"tlkShareGarbageCollectionEnabled"];
  [v5 encodeInt64:-[TrustedPeersHelperHealthCheckResult totalPeers](self, "totalPeers") forKey:@"totalPeers"];
  [v5 encodeInt64:-[TrustedPeersHelperHealthCheckResult trustedPeers](self, "trustedPeers") forKey:@"trustedPeers"];
  objc_msgSend( v5,  "encodeInt64:forKey:",  -[TrustedPeersHelperHealthCheckResult superfluousPeers](self, "superfluousPeers"),  @"superfluousPeers");
  [v5 encodeInt64:-[TrustedPeersHelperHealthCheckResult peersCleanedup](self, "peersCleanedup") forKey:@"peersCleanedup"];
  [v5 encodeBool:[self superfluousPeersCleanupEnabled] forKey:@"superfluousPeersCleanupEnabled"];
}

- (id)dictionaryRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = [NSNumber numberWithBool: +[TrustedPeersHelperHealthCheckResult postRepairCFU](self, "postRepairCFU")];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"postRepairCFU");

  id v5 = [NSNumber numberWithBool:YES];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"postEscrowCFU");

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[TrustedPeersHelperHealthCheckResult resetOctagon](self, "resetOctagon")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"resetOctagon");

  id v7 = [NSNumber numberWithBool:[self leaveTrust]];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"leaveTrust");

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[TrustedPeersHelperHealthCheckResult reroll](self, "reroll")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, @"reroll");

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperHealthCheckResult moveRequest](self, "moveRequest"));
  if (v9)
  {
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperHealthCheckResult moveRequest](self, "moveRequest"));
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dictionaryRepresentation]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, @"moveRequest");
  }

  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[TrustedPeersHelperHealthCheckResult totalEscrowRecords](self, "totalEscrowRecords")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v12,  @"totalEscrowRecords");

  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[TrustedPeersHelperHealthCheckResult collectableEscrowRecords](self, "collectableEscrowRecords")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v13,  @"collectableEscrowRecords");

  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[TrustedPeersHelperHealthCheckResult collectedEscrowRecords](self, "collectedEscrowRecords")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v14,  @"collectedEscrowRecords");

  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[TrustedPeersHelperHealthCheckResult escrowRecordGarbageCollectionEnabled]( self,  "escrowRecordGarbageCollectionEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v15,  @"escrowRecordGarbageCollectionEnabled");

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[TrustedPeersHelperHealthCheckResult totalTlkShares](self, "totalTlkShares")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v16, @"totalTlkShares");

  v17 = [NSNumber numberWithUnsignedLongLong: -[TrustedPeersHelperHealthCheckResult collectableTlkShares](self, "collectableTlkShares")];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v17,  @"collectableTlkShares");

  v18 = [NSNumber numberWithUnsignedLongLong: -[TrustedPeersHelperHealthCheckResult collectedTlkShares](self, "collectedTlkShares")];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v18,  @"collectedTlkShares");

  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[TrustedPeersHelperHealthCheckResult tlkShareGarbageCollectionEnabled]( self,  "tlkShareGarbageCollectionEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v19,  @"tlkShareGarbageCollectionEnabled");

  v20 = [NSNumber numberWithUnsignedLongLong: -[TrustedPeersHelperHealthCheckResult totalPeers](self, "totalPeers")];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v20, @"totalPeers");

  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[TrustedPeersHelperHealthCheckResult trustedPeers](self, "trustedPeers")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v21, @"trustedPeers");

  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[TrustedPeersHelperHealthCheckResult superfluousPeers](self, "superfluousPeers")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v22,  @"superfluousPeers");

  unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[TrustedPeersHelperHealthCheckResult peersCleanedup](self, "peersCleanedup")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v23, @"peersCleanedup");

  v24 = [NSNumber numberWithBool: -[TrustedPeersHelperHealthCheckResult superfluousPeersCleanupEnabled]( self,  "superfluousPeersCleanupEnabled")];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v24,  @"superfluousPeersCleanupEnabled");

  return v3;
}

- (BOOL)postRepairCFU
{
  return self->_postRepairCFU;
}

- (void)setPostRepairCFU:(BOOL)a3
{
  self->_postRepairCFU = a3;
}

- (BOOL)postEscrowCFU
{
  return self->_postEscrowCFU;
}

- (void)setPostEscrowCFU:(BOOL)a3
{
  self->_postEscrowCFU = a3;
}

- (BOOL)resetOctagon
{
  return self->_resetOctagon;
}

- (void)setResetOctagon:(BOOL)a3
{
  self->_resetOctagon = a3;
}

- (BOOL)leaveTrust
{
  return self->_leaveTrust;
}

- (void)setLeaveTrust:(BOOL)a3
{
  self->_leaveTrust = a3;
}

- (BOOL)reroll
{
  return self->_reroll;
}

- (void)setReroll:(BOOL)a3
{
  self->_reroll = a3;
}

- (OTEscrowMoveRequestContext)moveRequest
{
  return (OTEscrowMoveRequestContext *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setMoveRequest:(id)a3
{
}

- (unint64_t)totalEscrowRecords
{
  return self->_totalEscrowRecords;
}

- (void)setTotalEscrowRecords:(unint64_t)a3
{
  self->_totalEscrowRecords = a3;
}

- (unint64_t)collectableEscrowRecords
{
  return self->_collectableEscrowRecords;
}

- (void)setCollectableEscrowRecords:(unint64_t)a3
{
  self->_collectableEscrowRecords = a3;
}

- (unint64_t)collectedEscrowRecords
{
  return self->_collectedEscrowRecords;
}

- (void)setCollectedEscrowRecords:(unint64_t)a3
{
  self->_collectedEscrowRecords = a3;
}

- (BOOL)escrowRecordGarbageCollectionEnabled
{
  return self->_escrowRecordGarbageCollectionEnabled;
}

- (void)setEscrowRecordGarbageCollectionEnabled:(BOOL)a3
{
  self->_escrowRecordGarbageCollectionEnabled = a3;
}

- (unint64_t)totalTlkShares
{
  return self->_totalTlkShares;
}

- (void)setTotalTlkShares:(unint64_t)a3
{
  self->_totalTlkShares = a3;
}

- (unint64_t)collectableTlkShares
{
  return self->_collectableTlkShares;
}

- (void)setCollectableTlkShares:(unint64_t)a3
{
  self->_collectableTlkShares = a3;
}

- (unint64_t)collectedTlkShares
{
  return self->_collectedTlkShares;
}

- (void)setCollectedTlkShares:(unint64_t)a3
{
  self->_collectedTlkShares = a3;
}

- (BOOL)tlkShareGarbageCollectionEnabled
{
  return self->_tlkShareGarbageCollectionEnabled;
}

- (void)setTlkShareGarbageCollectionEnabled:(BOOL)a3
{
  self->_tlkShareGarbageCollectionEnabled = a3;
}

- (unint64_t)totalPeers
{
  return self->_totalPeers;
}

- (void)setTotalPeers:(unint64_t)a3
{
  self->_totalPeers = a3;
}

- (unint64_t)trustedPeers
{
  return self->_trustedPeers;
}

- (void)setTrustedPeers:(unint64_t)a3
{
  self->_trustedPeers = a3;
}

- (unint64_t)superfluousPeers
{
  return self->_superfluousPeers;
}

- (void)setSuperfluousPeers:(unint64_t)a3
{
  self->_superfluousPeers = a3;
}

- (unint64_t)peersCleanedup
{
  return self->_peersCleanedup;
}

- (void)setPeersCleanedup:(unint64_t)a3
{
  self->_peersCleanedup = a3;
}

- (BOOL)superfluousPeersCleanupEnabled
{
  return self->_superfluousPeersCleanupEnabled;
}

- (void)setSuperfluousPeersCleanupEnabled:(BOOL)a3
{
  self->_superfluousPeersCleanupEnabled = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end