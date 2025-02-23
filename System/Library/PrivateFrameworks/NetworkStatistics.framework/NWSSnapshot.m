@interface NWSSnapshot
- (NSDictionary)traditionalDictionary;
- (NSString)provider;
- (double)_rttAverage;
- (double)_rttMinimum;
- (double)_rttVariation;
- (id)_createCountsForProvider:(int)a3;
- (id)_initWithCounts:(const nstat_counts *)a3 sourceIdent:(unint64_t)a4 seqno:(unint64_t)a5;
- (id)description;
- (unint64_t)changeSeqno;
- (unint64_t)rxBytes;
- (unint64_t)rxCellularBytes;
- (unint64_t)rxPackets;
- (unint64_t)rxWiFiBytes;
- (unint64_t)rxWiredBytes;
- (unint64_t)sourceIdentifier;
- (unint64_t)txBytes;
- (unint64_t)txCellularBytes;
- (unint64_t)txPackets;
- (unint64_t)txWiFiBytes;
- (unint64_t)txWiredBytes;
- (unsigned)_connectAttempts;
- (unsigned)_connectSuccesses;
- (unsigned)_rxDuplicateBytes;
- (unsigned)_rxOutOfOrderBytes;
- (unsigned)_txRetransmittedBytes;
@end

@implementation NWSSnapshot

- (id)description
{
  return (id)objc_msgSend( NSString,  "stringWithFormat:",  @"pkts rx %lld tx %lld, bytes %lld %lld cell %lld %lld wifi %lld %lld wired %lld %lld",  -[NWSSnapshot rxPackets](self, "rxPackets"),  -[NWSSnapshot txPackets](self, "txPackets"),  -[NWSSnapshot rxBytes](self, "rxBytes"),  -[NWSSnapshot txBytes](self, "txBytes"),  -[NWSSnapshot rxCellularBytes](self, "rxCellularBytes"),  -[NWSSnapshot txCellularBytes](self, "txCellularBytes"),  -[NWSSnapshot rxWiFiBytes](self, "rxWiFiBytes"),  -[NWSSnapshot txWiFiBytes](self, "txWiFiBytes"),  -[NWSSnapshot rxWiredBytes](self, "rxWiredBytes"),  -[NWSSnapshot txWiredBytes](self, "txWiredBytes"));
}

- (unint64_t)rxPackets
{
  return self->_counts.nstat_rxpackets;
}

- (unint64_t)rxBytes
{
  return self->_counts.nstat_rxbytes;
}

- (unint64_t)rxCellularBytes
{
  return self->_counts.nstat_cell_rxbytes;
}

- (unint64_t)rxWiFiBytes
{
  return self->_counts.nstat_wifi_rxbytes;
}

- (unint64_t)rxWiredBytes
{
  return self->_counts.nstat_wired_rxbytes;
}

- (unsigned)_rxDuplicateBytes
{
  return self->_counts.nstat_rxduplicatebytes;
}

- (unsigned)_rxOutOfOrderBytes
{
  return self->_counts.nstat_rxoutoforderbytes;
}

- (unint64_t)txPackets
{
  return self->_counts.nstat_txpackets;
}

- (unint64_t)txBytes
{
  return self->_counts.nstat_txbytes;
}

- (unint64_t)txCellularBytes
{
  return self->_counts.nstat_cell_txbytes;
}

- (unint64_t)txWiFiBytes
{
  return self->_counts.nstat_wifi_txbytes;
}

- (unint64_t)txWiredBytes
{
  return self->_counts.nstat_wired_txbytes;
}

- (unsigned)_txRetransmittedBytes
{
  return self->_counts.nstat_txretransmit;
}

- (unsigned)_connectAttempts
{
  return self->_counts.nstat_connectattempts;
}

- (unsigned)_connectSuccesses
{
  return self->_counts.nstat_connectsuccesses;
}

- (double)_rttMinimum
{
  LODWORD(v2) = self->_counts.nstat_min_rtt;
  return (double)v2 / 32000.0;
}

- (double)_rttAverage
{
  LODWORD(v2) = self->_counts.nstat_avg_rtt;
  return (double)v2 / 32000.0;
}

- (double)_rttVariation
{
  LODWORD(v2) = self->_counts.nstat_var_rtt;
  return (double)v2 / 32000.0;
}

- (id)_initWithCounts:(const nstat_counts *)a3 sourceIdent:(unint64_t)a4 seqno:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NWSSnapshot;
  id result = -[NWSSnapshot init](&v14, sel_init);
  if (result)
  {
    __int128 v9 = *(_OWORD *)&a3->nstat_rxpackets;
    __int128 v10 = *(_OWORD *)&a3->nstat_txpackets;
    *(_OWORD *)((char *)result + 40) = *(_OWORD *)&a3->nstat_cell_rxbytes;
    *(_OWORD *)((char *)result + 24) = v10;
    *(_OWORD *)((char *)result + 8) = v9;
    __int128 v11 = *(_OWORD *)&a3->nstat_wifi_rxbytes;
    __int128 v12 = *(_OWORD *)&a3->nstat_wired_rxbytes;
    __int128 v13 = *(_OWORD *)&a3->nstat_rxduplicatebytes;
    *(_OWORD *)((char *)result + 104) = *(_OWORD *)&a3->nstat_connectsuccesses;
    *(_OWORD *)((char *)result + 88) = v13;
    *(_OWORD *)((char *)result + 72) = v12;
    *(_OWORD *)((char *)result + 56) = v11;
    *((void *)result + 15) = a5;
    *((void *)result + 16) = a4;
  }

  return result;
}

- (id)_createCountsForProvider:(int)a3
{
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (v5)
  {
    if ((a3 - 1) < 3)
    {
      [MEMORY[0x189607968] numberWithUnsignedInt:self->_counts.nstat_connectattempts];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v7 forKeyedSubscript:kNStatSrcKeyConnectAttempt];

      [MEMORY[0x189607968] numberWithUnsignedInt:self->_counts.nstat_connectsuccesses];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v8 forKeyedSubscript:kNStatSrcKeyConnectSuccess];

      [MEMORY[0x189607968] numberWithUnsignedInt:self->_counts.nstat_rxduplicatebytes];
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v9 forKeyedSubscript:kNStatSrcKeyRxDupeBytes];

      [MEMORY[0x189607968] numberWithUnsignedInt:self->_counts.nstat_rxoutoforderbytes];
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v10 forKeyedSubscript:kNStatSrcKeyRxOOOBytes];

      [MEMORY[0x189607968] numberWithUnsignedInt:self->_counts.nstat_txretransmit];
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v11 forKeyedSubscript:kNStatSrcKeyTxReTx];
    }

    else
    {
      if ((a3 - 4) < 2)
      {
LABEL_8:
        [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_counts.nstat_cell_rxbytes];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 setObject:v17 forKeyedSubscript:kNStatSrcKeyRxCellularBytes];

        [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_counts.nstat_cell_txbytes];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 setObject:v18 forKeyedSubscript:kNStatSrcKeyTxCellularBytes];

        [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_counts.nstat_wifi_rxbytes];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 setObject:v19 forKeyedSubscript:kNStatSrcKeyRxWiFiBytes];

        [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_counts.nstat_wifi_txbytes];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 setObject:v20 forKeyedSubscript:kNStatSrcKeyTxWiFiBytes];

        [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_counts.nstat_wired_rxbytes];
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 setObject:v21 forKeyedSubscript:kNStatSrcKeyRxWiredBytes];

        [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_counts.nstat_wired_txbytes];
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 setObject:v22 forKeyedSubscript:kNStatSrcKeyTxWiredBytes];

LABEL_9:
        [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_counts.nstat_rxpackets];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 setObject:v23 forKeyedSubscript:kNStatSrcKeyRxPackets];

        [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_counts.nstat_rxbytes];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 setObject:v24 forKeyedSubscript:kNStatSrcKeyRxBytes];

        [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_counts.nstat_txpackets];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 setObject:v25 forKeyedSubscript:kNStatSrcKeyTxPackets];

        [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_counts.nstat_txbytes];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 setObject:v26 forKeyedSubscript:kNStatSrcKeyTxBytes];

        id v27 = v5;
        goto LABEL_10;
      }

      if (a3 != 8) {
        goto LABEL_9;
      }
    }

    LODWORD(v6) = self->_counts.nstat_min_rtt;
    [MEMORY[0x189607968] numberWithDouble:(double)v6 / 32000.0];
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v12 forKeyedSubscript:kNStatSrcKeyMinRTT];

    LODWORD(v13) = self->_counts.nstat_avg_rtt;
    [MEMORY[0x189607968] numberWithDouble:(double)v13 / 32000.0];
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v14 forKeyedSubscript:kNStatSrcKeyAvgRTT];

    LODWORD(v15) = self->_counts.nstat_var_rtt;
    [MEMORY[0x189607968] numberWithDouble:(double)v15 / 16000.0];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v16 forKeyedSubscript:kNStatSrcKeyVarRTT];

    goto LABEL_8;
  }

- (unint64_t)changeSeqno
{
  return self->_changeSeqno;
}

- (unint64_t)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSString)provider
{
  return (NSString *)objc_getProperty(self, a2, 136LL, 1);
}

- (NSDictionary)traditionalDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 144LL, 1);
}

- (void).cxx_destruct
{
}

@end