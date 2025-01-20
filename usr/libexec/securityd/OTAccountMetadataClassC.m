@interface OTAccountMetadataClassC
+ (BOOL)deleteFromKeychainForContainer:(id)a3 contextID:(id)a4 personaAdapter:(id)a5 personaUniqueString:(id)a6 error:(id *)a7;
+ (Class)tlkSharesForVouchedIdentityType;
+ (id)loadFromKeychainForContainer:(id)a3 contextID:(id)a4 personaAdapter:(id)a5 personaUniqueString:(id)a6 error:(id *)a7;
- (BOOL)hasAltDSID;
- (BOOL)hasAttemptedJoin;
- (BOOL)hasCdpState;
- (BOOL)hasEpoch;
- (BOOL)hasIcloudAccountState;
- (BOOL)hasIsInheritedAccount;
- (BOOL)hasLastHealthCheckup;
- (BOOL)hasOldPeerID;
- (BOOL)hasPeerID;
- (BOOL)hasSecureElementIdentity;
- (BOOL)hasSendingMetricsPermitted;
- (BOOL)hasSyncingPolicy;
- (BOOL)hasTrustState;
- (BOOL)hasVoucher;
- (BOOL)hasVoucherSignature;
- (BOOL)hasWarmedEscrowCache;
- (BOOL)hasWarnedTooManyPeers;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInheritedAccount;
- (BOOL)readFrom:(id)a3;
- (BOOL)saveToKeychainForContainer:(id)a3 contextID:(id)a4 personaAdapter:(id)a5 personaUniqueString:(id)a6 error:(id *)a7;
- (BOOL)warmedEscrowCache;
- (BOOL)warnedTooManyPeers;
- (NSData)secureElementIdentity;
- (NSData)syncingPolicy;
- (NSData)voucher;
- (NSData)voucherSignature;
- (NSMutableArray)tlkSharesForVouchedIdentitys;
- (NSString)altDSID;
- (NSString)oldPeerID;
- (NSString)peerID;
- (id)attemptedJoinAsString:(int)a3;
- (id)cdpStateAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)getTLKSharesPairedWithVoucher;
- (id)getTPSyncingPolicy;
- (id)icloudAccountStateAsString:(int)a3;
- (id)parsedSecureElementIdentity;
- (id)sendingMetricsPermittedAsString:(int)a3;
- (id)tlkSharesForVouchedIdentityAtIndex:(unint64_t)a3;
- (id)trustStateAsString:(int)a3;
- (int)StringAsAttemptedJoin:(id)a3;
- (int)StringAsCdpState:(id)a3;
- (int)StringAsIcloudAccountState:(id)a3;
- (int)StringAsSendingMetricsPermitted:(id)a3;
- (int)StringAsTrustState:(id)a3;
- (int)attemptedJoin;
- (int)cdpState;
- (int)icloudAccountState;
- (int)sendingMetricsPermitted;
- (int)trustState;
- (int64_t)epoch;
- (unint64_t)hash;
- (unint64_t)lastHealthCheckup;
- (unint64_t)tlkSharesForVouchedIdentitysCount;
- (void)addTlkSharesForVouchedIdentity:(id)a3;
- (void)clearTlkSharesForVouchedIdentitys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setAttemptedJoin:(int)a3;
- (void)setCdpState:(int)a3;
- (void)setEpoch:(int64_t)a3;
- (void)setHasAttemptedJoin:(BOOL)a3;
- (void)setHasCdpState:(BOOL)a3;
- (void)setHasEpoch:(BOOL)a3;
- (void)setHasIcloudAccountState:(BOOL)a3;
- (void)setHasIsInheritedAccount:(BOOL)a3;
- (void)setHasLastHealthCheckup:(BOOL)a3;
- (void)setHasSendingMetricsPermitted:(BOOL)a3;
- (void)setHasTrustState:(BOOL)a3;
- (void)setHasWarmedEscrowCache:(BOOL)a3;
- (void)setHasWarnedTooManyPeers:(BOOL)a3;
- (void)setIcloudAccountState:(int)a3;
- (void)setIsInheritedAccount:(BOOL)a3;
- (void)setLastHealthCheckup:(unint64_t)a3;
- (void)setOctagonSecureElementIdentity:(id)a3;
- (void)setOldPeerID:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setSecureElementIdentity:(id)a3;
- (void)setSendingMetricsPermitted:(int)a3;
- (void)setSyncingPolicy:(id)a3;
- (void)setTLKSharesPairedWithVoucher:(id)a3;
- (void)setTPSyncingPolicy:(id)a3;
- (void)setTlkSharesForVouchedIdentitys:(id)a3;
- (void)setTrustState:(int)a3;
- (void)setVoucher:(id)a3;
- (void)setVoucherSignature:(id)a3;
- (void)setWarmedEscrowCache:(BOOL)a3;
- (void)setWarnedTooManyPeers:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTAccountMetadataClassC

- (BOOL)hasPeerID
{
  return self->_peerID != 0LL;
}

- (int)icloudAccountState
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_icloudAccountState;
  }
  else {
    return 0;
  }
}

- (void)setIcloudAccountState:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_icloudAccountState = a3;
}

- (void)setHasIcloudAccountState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIcloudAccountState
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)icloudAccountStateAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_100283860 + a3);
  }
}

- (int)StringAsIcloudAccountState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"NO_ACCOUNT"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"ACCOUNT_AVAILABLE"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"ACCOUNT_AVAILABLE_UNUSED"])
  {
    int v4 = 3;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setEpoch:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_epoch = a3;
}

- (void)setHasEpoch:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasEpoch
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasAltDSID
{
  return self->_altDSID != 0LL;
}

- (int)trustState
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_trustState;
  }
  else {
    return 0;
  }
}

- (void)setTrustState:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_trustState = a3;
}

- (void)setHasTrustState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTrustState
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)trustStateAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_100283880 + a3);
  }
}

- (int)StringAsTrustState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"UNTRUSTED"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"TRUSTED"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setLastHealthCheckup:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_lastHealthCheckup = a3;
}

- (void)setHasLastHealthCheckup:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasLastHealthCheckup
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (int)attemptedJoin
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_attemptedJoin;
  }
  else {
    return 0;
  }
}

- (void)setAttemptedJoin:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_attemptedJoin = a3;
}

- (void)setHasAttemptedJoin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAttemptedJoin
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)attemptedJoinAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_100283898 + a3);
  }
}

- (int)StringAsAttemptedJoin:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"NOTATTEMPTED"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"ATTEMPTED"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)cdpState
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_cdpState;
  }
  else {
    return 0;
  }
}

- (void)setCdpState:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_cdpState = a3;
}

- (void)setHasCdpState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCdpState
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)cdpStateAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_1002838B0 + a3);
  }
}

- (int)StringAsCdpState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"DISABLED"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"ENABLED"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasSyncingPolicy
{
  return self->_syncingPolicy != 0LL;
}

- (BOOL)hasVoucher
{
  return self->_voucher != 0LL;
}

- (BOOL)hasVoucherSignature
{
  return self->_voucherSignature != 0LL;
}

- (void)clearTlkSharesForVouchedIdentitys
{
}

- (void)addTlkSharesForVouchedIdentity:(id)a3
{
  id v4 = a3;
  tlkSharesForVouchedIdentitys = self->_tlkSharesForVouchedIdentitys;
  id v8 = v4;
  if (!tlkSharesForVouchedIdentitys)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_tlkSharesForVouchedIdentitys;
    self->_tlkSharesForVouchedIdentitys = v6;

    id v4 = v8;
    tlkSharesForVouchedIdentitys = self->_tlkSharesForVouchedIdentitys;
  }

  -[NSMutableArray addObject:](tlkSharesForVouchedIdentitys, "addObject:", v4);
}

- (unint64_t)tlkSharesForVouchedIdentitysCount
{
  return (unint64_t)-[NSMutableArray count](self->_tlkSharesForVouchedIdentitys, "count");
}

- (id)tlkSharesForVouchedIdentityAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_tlkSharesForVouchedIdentitys, "objectAtIndex:", a3);
}

- (BOOL)hasSecureElementIdentity
{
  return self->_secureElementIdentity != 0LL;
}

- (void)setIsInheritedAccount:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isInheritedAccount = a3;
}

- (void)setHasIsInheritedAccount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsInheritedAccount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setWarmedEscrowCache:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_warmedEscrowCache = a3;
}

- (void)setHasWarmedEscrowCache:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasWarmedEscrowCache
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setWarnedTooManyPeers:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_warnedTooManyPeers = a3;
}

- (void)setHasWarnedTooManyPeers:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasWarnedTooManyPeers
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)sendingMetricsPermitted
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_sendingMetricsPermitted;
  }
  else {
    return 0;
  }
}

- (void)setSendingMetricsPermitted:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_sendingMetricsPermitted = a3;
}

- (void)setHasSendingMetricsPermitted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasSendingMetricsPermitted
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)sendingMetricsPermittedAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_1002838C8 + a3);
  }
}

- (int)StringAsSendingMetricsPermitted:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"PERMITTED"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"NOTPERMITTED"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasOldPeerID
{
  return self->_oldPeerID != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTAccountMetadataClassC;
  id v3 = -[OTAccountMetadataClassC description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTAccountMetadataClassC dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v4 = v3;
  peerID = self->_peerID;
  if (peerID) {
    [v3 setObject:peerID forKey:@"peerID"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t icloudAccountState = self->_icloudAccountState;
    if (icloudAccountState >= 4) {
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_icloudAccountState));
    }
    else {
      objc_super v8 = *(&off_100283860 + icloudAccountState);
    }
    [v4 setObject:v8 forKey:@"icloudAccountState"];

    __int16 has = (__int16)self->_has;
  }

  if ((has & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_epoch));
    [v4 setObject:v9 forKey:@"epoch"];
  }

  altDSID = self->_altDSID;
  if (altDSID) {
    [v4 setObject:altDSID forKey:@"altDSID"];
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x40) != 0)
  {
    uint64_t trustState = self->_trustState;
    if (trustState >= 3) {
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_trustState));
    }
    else {
      v13 = *(&off_100283880 + trustState);
    }
    [v4 setObject:v13 forKey:@"trustState"];

    __int16 v11 = (__int16)self->_has;
    if ((v11 & 2) == 0)
    {
LABEL_14:
      if ((v11 & 4) == 0) {
        goto LABEL_15;
      }
      goto LABEL_22;
    }
  }

  else if ((v11 & 2) == 0)
  {
    goto LABEL_14;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_lastHealthCheckup));
  [v4 setObject:v14 forKey:@"lastHealthCheckup"];

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 4) == 0)
  {
LABEL_15:
    if ((v11 & 8) == 0) {
      goto LABEL_30;
    }
    goto LABEL_26;
  }

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    v5 = &selRef_hasTimestampDnsEnd;
    v6 = &selRef_hasTimestampDnsEnd;
    do
    {
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
        break;
      }
      char v7 = 0;
      unsigned int v8 = 0;
      unint64_t v9 = 0LL;
      while (1)
      {
        unint64_t v10 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        char v11 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v10);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v10 + 1;
        v9 |= (unint64_t)(v11 & 0x7F) << v7;
        if ((v11 & 0x80) == 0) {
          goto LABEL_12;
        }
        v7 += 7;
        BOOL v12 = v8++ >= 9;
        if (v12)
        {
          unint64_t v9 = 0LL;
          int v13 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_14;
        }
      }

      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_12:
      int v13 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v9 = 0LL;
      }
LABEL_14:
      if (v13 || (v9 & 7) == 4) {
        break;
      }
      switch((v9 >> 3))
      {
        case 1u:
          uint64_t String = PBReaderReadString(a3);
          uint64_t v16 = objc_claimAutoreleasedReturnValue(String);
          uint64_t v17 = *((int *)v5 + 677);
          goto LABEL_101;
        case 2u:
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0LL;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 678)] |= 0x10u;
          while (2)
          {
            unint64_t v21 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v21 == -1LL || v21 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v22 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v21);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
              v20 |= (unint64_t)(v22 & 0x7F) << v18;
              if (v22 < 0)
              {
                v18 += 7;
                BOOL v12 = v19++ >= 9;
                if (v12)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_105;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v20) = 0;
          }
LABEL_105:
          uint64_t v75 = 40LL;
          goto LABEL_144;
        case 3u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0LL;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 678)] |= 1u;
          while (2)
          {
            unint64_t v26 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v26 == -1LL || v26 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v27 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v26);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
              v25 |= (unint64_t)(v27 & 0x7F) << v23;
              if (v27 < 0)
              {
                v23 += 7;
                BOOL v12 = v24++ >= 9;
                if (v12)
                {
                  uint64_t v25 = 0LL;
                  goto LABEL_109;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v25 = 0LL;
          }
LABEL_109:
          uint64_t v76 = 8LL;
          goto LABEL_118;
        case 4u:
          uint64_t v28 = PBReaderReadString(a3);
          uint64_t v16 = objc_claimAutoreleasedReturnValue(v28);
          uint64_t v17 = 24LL;
          goto LABEL_101;
        case 5u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v20 = 0LL;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 678)] |= 0x40u;
          while (2)
          {
            unint64_t v31 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v31 == -1LL || v31 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v32 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v31);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v31 + 1;
              v20 |= (unint64_t)(v32 & 0x7F) << v29;
              if (v32 < 0)
              {
                v29 += 7;
                BOOL v12 = v30++ >= 9;
                if (v12)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_113;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v20) = 0;
          }
LABEL_113:
          uint64_t v75 = 96LL;
          goto LABEL_144;
        case 6u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v25 = 0LL;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 678)] |= 2u;
          while (2)
          {
            unint64_t v35 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v35 == -1LL || v35 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v36 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v35);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v35 + 1;
              v25 |= (unint64_t)(v36 & 0x7F) << v33;
              if (v36 < 0)
              {
                v33 += 7;
                BOOL v12 = v34++ >= 9;
                if (v12)
                {
                  uint64_t v25 = 0LL;
                  goto LABEL_117;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v25 = 0LL;
          }
LABEL_117:
          uint64_t v76 = 16LL;
LABEL_118:
          *(void *)&self->PBCodable_opaque[v76] = v25;
          continue;
        case 7u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v20 = 0LL;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 678)] |= 4u;
          while (2)
          {
            unint64_t v39 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v39 == -1LL || v39 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v40 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v39);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v39 + 1;
              v20 |= (unint64_t)(v40 & 0x7F) << v37;
              if (v40 < 0)
              {
                v37 += 7;
                BOOL v12 = v38++ >= 9;
                if (v12)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_122;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v20) = 0;
          }
LABEL_122:
          uint64_t v75 = 32LL;
          goto LABEL_144;
        case 8u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v20 = 0LL;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 678)] |= 8u;
          while (2)
          {
            unint64_t v43 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v43 == -1LL || v43 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v44 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v43);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v43 + 1;
              v20 |= (unint64_t)(v44 & 0x7F) << v41;
              if (v44 < 0)
              {
                v41 += 7;
                BOOL v12 = v42++ >= 9;
                if (v12)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_126;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v20) = 0;
          }
LABEL_126:
          uint64_t v75 = 36LL;
          goto LABEL_144;
        case 0xBu:
          uint64_t Data = PBReaderReadData(a3);
          uint64_t v16 = objc_claimAutoreleasedReturnValue(Data);
          uint64_t v17 = 80LL;
          goto LABEL_101;
        case 0xCu:
          uint64_t v47 = PBReaderReadData(a3);
          uint64_t v16 = objc_claimAutoreleasedReturnValue(v47);
          uint64_t v17 = 104LL;
          goto LABEL_101;
        case 0xDu:
          uint64_t v48 = PBReaderReadData(a3);
          uint64_t v16 = objc_claimAutoreleasedReturnValue(v48);
          uint64_t v17 = 112LL;
          goto LABEL_101;
        case 0xEu:
          v49 = v6;
          v50 = v5;
          uint64_t v51 = PBReaderReadData(a3);
          v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
          if (v52) {
            -[OTAccountMetadataClassC addTlkSharesForVouchedIdentity:](self, "addTlkSharesForVouchedIdentity:", v52);
          }

          v5 = v50;
          v6 = v49;
          continue;
        case 0xFu:
          uint64_t v53 = PBReaderReadData(a3);
          uint64_t v16 = objc_claimAutoreleasedReturnValue(v53);
          uint64_t v17 = 64LL;
          goto LABEL_101;
        case 0x12u:
          char v54 = 0;
          unsigned int v55 = 0;
          uint64_t v56 = 0LL;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 678)] |= 0x80u;
          while (2)
          {
            unint64_t v57 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v57 == -1LL || v57 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v58 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v57);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v57 + 1;
              v56 |= (unint64_t)(v58 & 0x7F) << v54;
              if (v58 < 0)
              {
                v54 += 7;
                BOOL v12 = v55++ >= 9;
                if (v12)
                {
                  uint64_t v56 = 0LL;
                  goto LABEL_130;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v56 = 0LL;
          }
LABEL_130:
          BOOL v77 = v56 != 0;
          uint64_t v78 = 120LL;
          goto LABEL_139;
        case 0x13u:
          char v59 = 0;
          unsigned int v60 = 0;
          uint64_t v61 = 0LL;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 678)] |= 0x100u;
          while (2)
          {
            unint64_t v62 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v62 == -1LL || v62 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v63 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v62);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v62 + 1;
              v61 |= (unint64_t)(v63 & 0x7F) << v59;
              if (v63 < 0)
              {
                v59 += 7;
                BOOL v12 = v60++ >= 9;
                if (v12)
                {
                  uint64_t v61 = 0LL;
                  goto LABEL_134;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v61 = 0LL;
          }
LABEL_134:
          BOOL v77 = v61 != 0;
          uint64_t v78 = 121LL;
          goto LABEL_139;
        case 0x14u:
          char v64 = 0;
          unsigned int v65 = 0;
          uint64_t v66 = 0LL;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 678)] |= 0x200u;
          while (2)
          {
            unint64_t v67 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v67 == -1LL || v67 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v68 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v67);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v67 + 1;
              v66 |= (unint64_t)(v68 & 0x7F) << v64;
              if (v68 < 0)
              {
                v64 += 7;
                BOOL v12 = v65++ >= 9;
                if (v12)
                {
                  uint64_t v66 = 0LL;
                  goto LABEL_138;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v66 = 0LL;
          }
LABEL_138:
          BOOL v77 = v66 != 0;
          uint64_t v78 = 122LL;
LABEL_139:
          self->PBCodable_opaque[v78] = v77;
          continue;
        case 0x16u:
          char v69 = 0;
          unsigned int v70 = 0;
          uint64_t v20 = 0LL;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 678)] |= 0x20u;
          break;
        case 0x17u:
          uint64_t v73 = PBReaderReadString(a3);
          uint64_t v16 = objc_claimAutoreleasedReturnValue(v73);
          uint64_t v17 = 48LL;
LABEL_101:
          v74 = *(void **)&self->PBCodable_opaque[v17];
          *(void *)&self->PBCodable_opaque[v17] = v16;

          continue;
        default:
          int v45 = PBReaderSkipValueWithTag(a3);
          if (!v45) {
            return v45;
          }
          continue;
      }

      while (1)
      {
        unint64_t v71 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        char v72 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v71);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v71 + 1;
        v20 |= (unint64_t)(v72 & 0x7F) << v69;
        if ((v72 & 0x80) == 0) {
          goto LABEL_141;
        }
        v69 += 7;
        BOOL v12 = v70++ >= 9;
        if (v12)
        {
          LODWORD(v20) = 0;
          goto LABEL_143;
        }
      }

      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_141:
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v20) = 0;
      }
LABEL_143:
      uint64_t v75 = 72LL;
LABEL_144:
      *(_DWORD *)&self->PBCodable_opaque[v75] = v20;
    }

    while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length));
  }

  LOBYTE(v45) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v45;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  peerID = self->_peerID;
  if (peerID) {
    PBDataWriterWriteStringField(v4, peerID, 1LL);
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_icloudAccountState, 2LL);
    __int16 has = (__int16)self->_has;
  }

  if ((has & 1) != 0) {
    PBDataWriterWriteInt64Field(v5, self->_epoch, 3LL);
  }
  altDSID = self->_altDSID;
  if (altDSID) {
    PBDataWriterWriteStringField(v5, altDSID, 4LL);
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_trustState, 5LL);
    __int16 v9 = (__int16)self->_has;
    if ((v9 & 2) == 0)
    {
LABEL_11:
      if ((v9 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_39;
    }
  }

  else if ((v9 & 2) == 0)
  {
    goto LABEL_11;
  }

  PBDataWriterWriteUint64Field(v5, self->_lastHealthCheckup, 6LL);
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 4) == 0)
  {
LABEL_12:
    if ((v9 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (self->_peerID)
  {
    objc_msgSend(v4, "setPeerID:");
    id v4 = v13;
  }

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_icloudAccountState;
    *((_WORD *)v4 + 62) |= 0x10u;
    __int16 has = (__int16)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((void *)v4 + 1) = self->_epoch;
    *((_WORD *)v4 + 62) |= 1u;
  }

  if (self->_altDSID)
  {
    objc_msgSend(v13, "setAltDSID:");
    id v4 = v13;
  }

  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_trustState;
    *((_WORD *)v4 + 62) |= 0x40u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_11:
      if ((v6 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_36;
    }
  }

  else if ((v6 & 2) == 0)
  {
    goto LABEL_11;
  }

  *((void *)v4 + 2) = self->_lastHealthCheckup;
  *((_WORD *)v4 + 62) |= 2u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_12:
    if ((v6 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_peerID, "copyWithZone:", a3);
  unint64_t v7 = (void *)v5[7];
  v5[7] = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_icloudAccountState;
    *((_WORD *)v5 + 62) |= 0x10u;
    __int16 has = (__int16)self->_has;
  }

  if ((has & 1) != 0)
  {
    v5[1] = self->_epoch;
    *((_WORD *)v5 + 62) |= 1u;
  }

  id v9 = -[NSString copyWithZone:](self->_altDSID, "copyWithZone:", a3);
  unint64_t v10 = (void *)v5[3];
  v5[3] = v9;

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x40) != 0)
  {
    *((_DWORD *)v5 + 24) = self->_trustState;
    *((_WORD *)v5 + 62) |= 0x40u;
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 2) == 0)
    {
LABEL_7:
      if ((v11 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }

  else if ((v11 & 2) == 0)
  {
    goto LABEL_7;
  }

  v5[2] = self->_lastHealthCheckup;
  *((_WORD *)v5 + 62) |= 2u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 4) == 0)
  {
LABEL_8:
    if ((v11 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  peerID = self->_peerID;
  if ((unint64_t)peerID | *((void *)v4 + 7))
  {
  }

  __int16 has = (__int16)self->_has;
  __int16 v8 = *((_WORD *)v4 + 62);
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_icloudAccountState != *((_DWORD *)v4 + 10)) {
      goto LABEL_78;
    }
  }

  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_78;
  }

  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_epoch != *((void *)v4 + 1)) {
      goto LABEL_78;
    }
  }

  else if ((v8 & 1) != 0)
  {
    goto LABEL_78;
  }

  altDSID = self->_altDSID;
  if ((unint64_t)altDSID | *((void *)v4 + 3))
  {
    __int16 has = (__int16)self->_has;
    __int16 v8 = *((_WORD *)v4 + 62);
  }

  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_trustState != *((_DWORD *)v4 + 24)) {
      goto LABEL_78;
    }
  }

  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_78;
  }

  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_lastHealthCheckup != *((void *)v4 + 2)) {
      goto LABEL_78;
    }
  }

  else if ((v8 & 2) != 0)
  {
    goto LABEL_78;
  }

  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_attemptedJoin != *((_DWORD *)v4 + 8)) {
      goto LABEL_78;
    }
  }

  else if ((v8 & 4) != 0)
  {
    goto LABEL_78;
  }

  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_cdpState != *((_DWORD *)v4 + 9)) {
      goto LABEL_78;
    }
  }

  else if ((v8 & 8) != 0)
  {
    goto LABEL_78;
  }

  syncingPolicy = self->_syncingPolicy;
  if ((unint64_t)syncingPolicy | *((void *)v4 + 10)
    && !-[NSData isEqual:](syncingPolicy, "isEqual:"))
  {
    goto LABEL_78;
  }

  voucher = self->_voucher;
  if ((unint64_t)voucher | *((void *)v4 + 13))
  {
  }

  voucherSignature = self->_voucherSignature;
  if ((unint64_t)voucherSignature | *((void *)v4 + 14))
  {
  }

  tlkSharesForVouchedIdentitys = self->_tlkSharesForVouchedIdentitys;
  if ((unint64_t)tlkSharesForVouchedIdentitys | *((void *)v4 + 11))
  {
  }

  secureElementIdentity = self->_secureElementIdentity;
  if ((unint64_t)secureElementIdentity | *((void *)v4 + 8))
  {
  }

  __int16 v15 = (__int16)self->_has;
  __int16 v16 = *((_WORD *)v4 + 62);
  if ((v15 & 0x80) != 0)
  {
    if ((v16 & 0x80) == 0) {
      goto LABEL_78;
    }
    if (self->_isInheritedAccount)
    {
      if (!*((_BYTE *)v4 + 120)) {
        goto LABEL_78;
      }
    }

    else if (*((_BYTE *)v4 + 120))
    {
      goto LABEL_78;
    }
  }

  else if ((v16 & 0x80) != 0)
  {
    goto LABEL_78;
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x100) == 0) {
      goto LABEL_78;
    }
    if (self->_warmedEscrowCache)
    {
      if (!*((_BYTE *)v4 + 121)) {
        goto LABEL_78;
      }
    }

    else if (*((_BYTE *)v4 + 121))
    {
      goto LABEL_78;
    }
  }

  else if ((*((_WORD *)v4 + 62) & 0x100) != 0)
  {
    goto LABEL_78;
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x200) != 0)
    {
      if (self->_warnedTooManyPeers)
      {
        if (!*((_BYTE *)v4 + 122)) {
          goto LABEL_78;
        }
        goto LABEL_71;
      }

      if (!*((_BYTE *)v4 + 122)) {
        goto LABEL_71;
      }
    }

- (unint64_t)hash
{
  NSUInteger v23 = -[NSString hash](self->_peerID, "hash");
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t v22 = 2654435761LL * self->_icloudAccountState;
    if ((has & 1) != 0) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v22 = 0LL;
    if ((has & 1) != 0)
    {
LABEL_3:
      uint64_t v21 = 2654435761LL * self->_epoch;
      goto LABEL_6;
    }
  }

  uint64_t v21 = 0LL;
LABEL_6:
  NSUInteger v20 = -[NSString hash](self->_altDSID, "hash");
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 0x40) != 0)
  {
    uint64_t v19 = 2654435761LL * self->_trustState;
    if ((v4 & 2) != 0)
    {
LABEL_8:
      unint64_t v5 = 2654435761u * self->_lastHealthCheckup;
      if ((v4 & 4) != 0) {
        goto LABEL_9;
      }
LABEL_13:
      uint64_t v6 = 0LL;
      if ((v4 & 8) != 0) {
        goto LABEL_10;
      }
      goto LABEL_14;
    }
  }

  else
  {
    uint64_t v19 = 0LL;
    if ((v4 & 2) != 0) {
      goto LABEL_8;
    }
  }

  unint64_t v5 = 0LL;
  if ((v4 & 4) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  uint64_t v6 = 2654435761LL * self->_attemptedJoin;
  if ((v4 & 8) != 0)
  {
LABEL_10:
    uint64_t v7 = 2654435761LL * self->_cdpState;
    goto LABEL_15;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 7)) {
    -[OTAccountMetadataClassC setPeerID:](self, "setPeerID:");
  }
  __int16 v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x10) != 0)
  {
    self->_uint64_t icloudAccountState = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v5 = *((_WORD *)v4 + 62);
  }

  if ((v5 & 1) != 0)
  {
    self->_epoch = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 3)) {
    -[OTAccountMetadataClassC setAltDSID:](self, "setAltDSID:");
  }
  __int16 v6 = *((_WORD *)v4 + 62);
  if ((v6 & 0x40) != 0)
  {
    self->_uint64_t trustState = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v6 = *((_WORD *)v4 + 62);
    if ((v6 & 2) == 0)
    {
LABEL_11:
      if ((v6 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_39;
    }
  }

  else if ((v6 & 2) == 0)
  {
    goto LABEL_11;
  }

  self->_lastHealthCheckup = *((void *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v6 = *((_WORD *)v4 + 62);
  if ((v6 & 4) == 0)
  {
LABEL_12:
    if ((v6 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (unint64_t)lastHealthCheckup
{
  return self->_lastHealthCheckup;
}

- (NSData)syncingPolicy
{
  return self->_syncingPolicy;
}

- (void)setSyncingPolicy:(id)a3
{
}

- (NSData)voucher
{
  return self->_voucher;
}

- (void)setVoucher:(id)a3
{
}

- (NSData)voucherSignature
{
  return self->_voucherSignature;
}

- (void)setVoucherSignature:(id)a3
{
}

- (NSMutableArray)tlkSharesForVouchedIdentitys
{
  return self->_tlkSharesForVouchedIdentitys;
}

- (void)setTlkSharesForVouchedIdentitys:(id)a3
{
}

- (NSData)secureElementIdentity
{
  return self->_secureElementIdentity;
}

- (void)setSecureElementIdentity:(id)a3
{
}

- (BOOL)isInheritedAccount
{
  return self->_isInheritedAccount;
}

- (BOOL)warmedEscrowCache
{
  return self->_warmedEscrowCache;
}

- (BOOL)warnedTooManyPeers
{
  return self->_warnedTooManyPeers;
}

- (NSString)oldPeerID
{
  return self->_oldPeerID;
}

- (void)setOldPeerID:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (Class)tlkSharesForVouchedIdentityType
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSData, a2);
}

- (BOOL)saveToKeychainForContainer:(id)a3 contextID:(id)a4 personaAdapter:(id)a5 personaUniqueString:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v25 = 0LL;
  __int16 v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = sub_10008808C;
  char v29 = sub_10008809C;
  id v30 = 0LL;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000880A4;
  v20[3] = &unk_1002847A8;
  id v16 = v12;
  id v21 = v16;
  id v17 = v13;
  id v22 = v17;
  NSUInteger v23 = self;
  id v24 = &v25;
  [v14 performBlockWithPersonaIdentifier:v15 block:v20];
  unsigned __int8 v18 = (void *)v26[5];
  if (a7 && v18) {
    *a7 = v18;
  }

  _Block_object_dispose(&v25, 8);
  return v18 == 0LL;
}

- (void)setTPSyncingPolicy:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v4 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
    [v6 encodeWithCoder:v4];
    __int16 v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v4, "encodedData"));
    -[OTAccountMetadataClassC setSyncingPolicy:](self, "setSyncingPolicy:", v5);
  }

  else
  {
    -[OTAccountMetadataClassC setSyncingPolicy:](self, "setSyncingPolicy:", 0LL);
  }
}

- (id)getTPSyncingPolicy
{
  id v3 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTAccountMetadataClassC syncingPolicy](self, "syncingPolicy"));
  __int16 v5 = -[NSKeyedUnarchiver initForReadingFromData:error:](v3, "initForReadingFromData:error:", v4, 0LL);

  id v6 = -[TPSyncingPolicy initWithCoder:](objc_alloc(&OBJC_CLASS___TPSyncingPolicy), "initWithCoder:", v5);
  -[NSKeyedUnarchiver finishDecoding](v5, "finishDecoding");

  return v6;
}

- (void)setTLKSharesPairedWithVoucher:(id)a3
{
  id v4 = a3;
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)v10);
        id v12 = objc_alloc(&OBJC_CLASS___NSKeyedArchiver);
        id v13 = -[NSKeyedArchiver initRequiringSecureCoding:](v12, "initRequiringSecureCoding:", 1LL, (void)v15);
        [v11 encodeWithCoder:v13];
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v13, "encodedData"));
        [v5 addObject:v14];

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  -[OTAccountMetadataClassC setTlkSharesForVouchedIdentitys:](self, "setTlkSharesForVouchedIdentitys:", v5);
}

- (id)getTLKSharesPairedWithVoucher
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTAccountMetadataClassC tlkSharesForVouchedIdentitys](self, "tlkSharesForVouchedIdentitys", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v8),  0LL);
        uint64_t v10 = -[CKKSTLKShare initWithCoder:](objc_alloc(&OBJC_CLASS___CKKSTLKShare), "initWithCoder:", v9);
        -[NSKeyedUnarchiver finishDecoding](v9, "finishDecoding");
        [v3 addObject:v10];

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  return v3;
}

- (void)setOctagonSecureElementIdentity:(id)a3
{
  id v4 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___TPPBSecureElementIdentity);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peerIdentifier]);
  -[TPPBSecureElementIdentity setPeerIdentifier:](v8, "setPeerIdentifier:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 peerData]);
  -[TPPBSecureElementIdentity setPeerData:](v8, "setPeerData:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPPBSecureElementIdentity data](v8, "data"));
  -[OTAccountMetadataClassC setSecureElementIdentity:](self, "setSecureElementIdentity:", v7);
}

- (id)parsedSecureElementIdentity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTAccountMetadataClassC secureElementIdentity](self, "secureElementIdentity"));
  id v3 = v2;
  if (v2 && [v2 length]) {
    id v4 = -[TPPBSecureElementIdentity initWithData:]( objc_alloc(&OBJC_CLASS___TPPBSecureElementIdentity),  "initWithData:",  v3);
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

+ (BOOL)deleteFromKeychainForContainer:(id)a3 contextID:(id)a4 personaAdapter:(id)a5 personaUniqueString:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  int v29 = -1;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100088DB0;
  v22[3] = &unk_1002912B8;
  id v15 = v11;
  id v23 = v15;
  id v16 = v12;
  id v24 = v16;
  uint64_t v25 = &v26;
  [v13 performBlockWithPersonaIdentifier:v14 block:v22];
  int v17 = *((_DWORD *)v27 + 6);
  uint64_t v18 = v17;
  if (a7 && v17)
  {
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SecItemDelete: %d",  v17));
    __int128 v31 = v19;
    NSUInteger v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
    *a7 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v18,  v20));
  }

  _Block_object_dispose(&v26, 8);
  return (_DWORD)v18 == 0;
}

+ (id)loadFromKeychainForContainer:(id)a3 contextID:(id)a4 personaAdapter:(id)a5 personaUniqueString:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v35 = 0LL;
  char v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  unsigned int v38 = sub_10008808C;
  unint64_t v39 = sub_10008809C;
  id v40 = 0LL;
  uint64_t v29 = 0LL;
  NSErrorUserInfoKey v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  __int128 v32 = sub_10008808C;
  __int128 v33 = sub_10008809C;
  id v34 = 0LL;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100088964;
  v22[3] = &unk_1002847D0;
  id v15 = v11;
  id v23 = v15;
  id v16 = v12;
  id v24 = v16;
  uint64_t v27 = &v29;
  uint64_t v28 = &v35;
  id v17 = v13;
  id v25 = v17;
  id v18 = v14;
  id v26 = v18;
  [v17 performBlockWithPersonaIdentifier:v18 block:v22];
  if (a7)
  {
    uint64_t v19 = (void *)v30[5];
    if (v19) {
      *a7 = v19;
    }
  }

  id v20 = (id)v36[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v20;
}

@end