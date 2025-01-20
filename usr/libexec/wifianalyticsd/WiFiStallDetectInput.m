@interface WiFiStallDetectInput
- (NSSet)featureNames;
- (WiFiStallDetectInput)initWithAC_problem_bitfield:(double)a3 TxBE_expiredCompletions:(double)a4 TxBE_failedCompletions:(double)a5 TxBE_noAckCompletions:(double)a6 TxBE_otherErrCompletions:(double)a7 TxBK_expiredCompletions:(double)a8 TxBK_failedCompletions:(double)a9 TxBK_noAckCompletions:(double)a10 TxBK_otherErrCompletions:(double)a11 TxVI_expiredCompletions:(double)a12 TxVI_failedCompletions:(double)a13 TxVI_noAckCompletions:(double)a14 TxVI_otherErrCompletions:(double)a15 TxVO_expiredCompletions:(double)a16 TxVO_failedCompletions:(double)a17 TxVO_noAckCompletions:(double)a18 TxVO_otherErrCompletions:(double)a19 bt_abort:(double)a20 bt_grant:(double)a21 bt_request:(double)a22 bt_uch_latency:(double)a23 cca_bin:(double)a24 completions_chipmodeerror:(double)a25 completions_expired:(double)a26 completions_internalerror:(double)a27 completions_ioerror:(double)a28 completions_noack:(double)a29 completions_nobuf:(double)a30 completions_noremotepeer:(double)a31 completions_noresources:(double)a32 completions_txfailure:(double)a33 roam_count:(double)a34 roam_duration:(double)a35 rssi_bin:(double)a36 snr_bin:(double)a37;
- (double)AC_problem_bitfield;
- (double)TxBE_expiredCompletions;
- (double)TxBE_failedCompletions;
- (double)TxBE_noAckCompletions;
- (double)TxBE_otherErrCompletions;
- (double)TxBK_expiredCompletions;
- (double)TxBK_failedCompletions;
- (double)TxBK_noAckCompletions;
- (double)TxBK_otherErrCompletions;
- (double)TxVI_expiredCompletions;
- (double)TxVI_failedCompletions;
- (double)TxVI_noAckCompletions;
- (double)TxVI_otherErrCompletions;
- (double)TxVO_expiredCompletions;
- (double)TxVO_failedCompletions;
- (double)TxVO_noAckCompletions;
- (double)TxVO_otherErrCompletions;
- (double)bt_abort;
- (double)bt_grant;
- (double)bt_request;
- (double)bt_uch_latency;
- (double)cca_bin;
- (double)completions_chipmodeerror;
- (double)completions_expired;
- (double)completions_internalerror;
- (double)completions_ioerror;
- (double)completions_noack;
- (double)completions_nobuf;
- (double)completions_noremotepeer;
- (double)completions_noresources;
- (double)completions_txfailure;
- (double)roam_count;
- (double)roam_duration;
- (double)rssi_bin;
- (double)snr_bin;
- (id)featureValueForName:(id)a3;
- (void)setAC_problem_bitfield:(double)a3;
- (void)setBt_abort:(double)a3;
- (void)setBt_grant:(double)a3;
- (void)setBt_request:(double)a3;
- (void)setBt_uch_latency:(double)a3;
- (void)setCca_bin:(double)a3;
- (void)setCompletions_chipmodeerror:(double)a3;
- (void)setCompletions_expired:(double)a3;
- (void)setCompletions_internalerror:(double)a3;
- (void)setCompletions_ioerror:(double)a3;
- (void)setCompletions_noack:(double)a3;
- (void)setCompletions_nobuf:(double)a3;
- (void)setCompletions_noremotepeer:(double)a3;
- (void)setCompletions_noresources:(double)a3;
- (void)setCompletions_txfailure:(double)a3;
- (void)setRoam_count:(double)a3;
- (void)setRoam_duration:(double)a3;
- (void)setRssi_bin:(double)a3;
- (void)setSnr_bin:(double)a3;
- (void)setTxBE_expiredCompletions:(double)a3;
- (void)setTxBE_failedCompletions:(double)a3;
- (void)setTxBE_noAckCompletions:(double)a3;
- (void)setTxBE_otherErrCompletions:(double)a3;
- (void)setTxBK_expiredCompletions:(double)a3;
- (void)setTxBK_failedCompletions:(double)a3;
- (void)setTxBK_noAckCompletions:(double)a3;
- (void)setTxBK_otherErrCompletions:(double)a3;
- (void)setTxVI_expiredCompletions:(double)a3;
- (void)setTxVI_failedCompletions:(double)a3;
- (void)setTxVI_noAckCompletions:(double)a3;
- (void)setTxVI_otherErrCompletions:(double)a3;
- (void)setTxVO_expiredCompletions:(double)a3;
- (void)setTxVO_failedCompletions:(double)a3;
- (void)setTxVO_noAckCompletions:(double)a3;
- (void)setTxVO_otherErrCompletions:(double)a3;
@end

@implementation WiFiStallDetectInput

- (WiFiStallDetectInput)initWithAC_problem_bitfield:(double)a3 TxBE_expiredCompletions:(double)a4 TxBE_failedCompletions:(double)a5 TxBE_noAckCompletions:(double)a6 TxBE_otherErrCompletions:(double)a7 TxBK_expiredCompletions:(double)a8 TxBK_failedCompletions:(double)a9 TxBK_noAckCompletions:(double)a10 TxBK_otherErrCompletions:(double)a11 TxVI_expiredCompletions:(double)a12 TxVI_failedCompletions:(double)a13 TxVI_noAckCompletions:(double)a14 TxVI_otherErrCompletions:(double)a15 TxVO_expiredCompletions:(double)a16 TxVO_failedCompletions:(double)a17 TxVO_noAckCompletions:(double)a18 TxVO_otherErrCompletions:(double)a19 bt_abort:(double)a20 bt_grant:(double)a21 bt_request:(double)a22 bt_uch_latency:(double)a23 cca_bin:(double)a24 completions_chipmodeerror:(double)a25 completions_expired:(double)a26 completions_internalerror:(double)a27 completions_ioerror:(double)a28 completions_noack:(double)a29 completions_nobuf:(double)a30 completions_noremotepeer:(double)a31 completions_noresources:(double)a32 completions_txfailure:(double)a33 roam_count:(double)a34 roam_duration:(double)a35 rssi_bin:(double)a36 snr_bin:(double)a37
{
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___WiFiStallDetectInput;
  result = -[WiFiStallDetectInput init](&v46, "init");
  if (result)
  {
    result->_AC_problem_bitfield = a3;
    result->_TxBE_expiredCompletions = a4;
    result->_TxBE_failedCompletions = a5;
    result->_TxBE_noAckCompletions = a6;
    result->_TxBE_otherErrCompletions = a7;
    result->_TxBK_expiredCompletions = a8;
    result->_TxBK_failedCompletions = a9;
    result->_TxBK_noAckCompletions = a10;
    result->_TxBK_otherErrCompletions = a11;
    result->_TxVI_expiredCompletions = a12;
    result->_TxVI_failedCompletions = a13;
    result->_TxVI_noAckCompletions = a14;
    result->_TxVI_otherErrCompletions = a15;
    result->_TxVO_expiredCompletions = a16;
    result->_TxVO_failedCompletions = a17;
    result->_TxVO_noAckCompletions = a18;
    result->_TxVO_otherErrCompletions = a19;
    result->_bt_abort = a20;
    result->_bt_grant = a21;
    result->_bt_request = a22;
    result->_bt_uch_latency = a23;
    result->_cca_bin = a24;
    result->_completions_chipmodeerror = a25;
    result->_completions_expired = a26;
    result->_completions_internalerror = a27;
    result->_completions_ioerror = a28;
    result->_completions_noack = a29;
    result->_completions_nobuf = a30;
    result->_completions_noremotepeer = a31;
    result->_completions_noresources = a32;
    result->_completions_txfailure = a33;
    result->_roam_count = a34;
    result->_roam_duration = a35;
    result->_rssi_bin = a36;
    result->_snr_bin = a37;
  }

  return result;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_1000E03A8);
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"AC_problem_bitfield"])
  {
    -[WiFiStallDetectInput AC_problem_bitfield](self, "AC_problem_bitfield");
  }

  else if ([v4 isEqualToString:@"TxBE_expiredCompletions"])
  {
    -[WiFiStallDetectInput TxBE_expiredCompletions](self, "TxBE_expiredCompletions");
  }

  else if ([v4 isEqualToString:@"TxBE_failedCompletions"])
  {
    -[WiFiStallDetectInput TxBE_failedCompletions](self, "TxBE_failedCompletions");
  }

  else if ([v4 isEqualToString:@"TxBE_noAckCompletions"])
  {
    -[WiFiStallDetectInput TxBE_noAckCompletions](self, "TxBE_noAckCompletions");
  }

  else if ([v4 isEqualToString:@"TxBE_otherErrCompletions"])
  {
    -[WiFiStallDetectInput TxBE_otherErrCompletions](self, "TxBE_otherErrCompletions");
  }

  else if ([v4 isEqualToString:@"TxBK_expiredCompletions"])
  {
    -[WiFiStallDetectInput TxBK_expiredCompletions](self, "TxBK_expiredCompletions");
  }

  else if ([v4 isEqualToString:@"TxBK_failedCompletions"])
  {
    -[WiFiStallDetectInput TxBK_failedCompletions](self, "TxBK_failedCompletions");
  }

  else if ([v4 isEqualToString:@"TxBK_noAckCompletions"])
  {
    -[WiFiStallDetectInput TxBK_noAckCompletions](self, "TxBK_noAckCompletions");
  }

  else if ([v4 isEqualToString:@"TxBK_otherErrCompletions"])
  {
    -[WiFiStallDetectInput TxBK_otherErrCompletions](self, "TxBK_otherErrCompletions");
  }

  else if ([v4 isEqualToString:@"TxVI_expiredCompletions"])
  {
    -[WiFiStallDetectInput TxVI_expiredCompletions](self, "TxVI_expiredCompletions");
  }

  else if ([v4 isEqualToString:@"TxVI_failedCompletions"])
  {
    -[WiFiStallDetectInput TxVI_failedCompletions](self, "TxVI_failedCompletions");
  }

  else if ([v4 isEqualToString:@"TxVI_noAckCompletions"])
  {
    -[WiFiStallDetectInput TxVI_noAckCompletions](self, "TxVI_noAckCompletions");
  }

  else if ([v4 isEqualToString:@"TxVI_otherErrCompletions"])
  {
    -[WiFiStallDetectInput TxVI_otherErrCompletions](self, "TxVI_otherErrCompletions");
  }

  else if ([v4 isEqualToString:@"TxVO_expiredCompletions"])
  {
    -[WiFiStallDetectInput TxVO_expiredCompletions](self, "TxVO_expiredCompletions");
  }

  else if ([v4 isEqualToString:@"TxVO_failedCompletions"])
  {
    -[WiFiStallDetectInput TxVO_failedCompletions](self, "TxVO_failedCompletions");
  }

  else if ([v4 isEqualToString:@"TxVO_noAckCompletions"])
  {
    -[WiFiStallDetectInput TxVO_noAckCompletions](self, "TxVO_noAckCompletions");
  }

  else if ([v4 isEqualToString:@"TxVO_otherErrCompletions"])
  {
    -[WiFiStallDetectInput TxVO_otherErrCompletions](self, "TxVO_otherErrCompletions");
  }

  else if ([v4 isEqualToString:@"bt_abort"])
  {
    -[WiFiStallDetectInput bt_abort](self, "bt_abort");
  }

  else if ([v4 isEqualToString:@"bt_grant"])
  {
    -[WiFiStallDetectInput bt_grant](self, "bt_grant");
  }

  else if ([v4 isEqualToString:@"bt_request"])
  {
    -[WiFiStallDetectInput bt_request](self, "bt_request");
  }

  else if ([v4 isEqualToString:@"bt_uch_latency"])
  {
    -[WiFiStallDetectInput bt_uch_latency](self, "bt_uch_latency");
  }

  else if ([v4 isEqualToString:@"cca_bin"])
  {
    -[WiFiStallDetectInput cca_bin](self, "cca_bin");
  }

  else if ([v4 isEqualToString:@"completions_chipmodeerror"])
  {
    -[WiFiStallDetectInput completions_chipmodeerror](self, "completions_chipmodeerror");
  }

  else if ([v4 isEqualToString:@"completions_expired"])
  {
    -[WiFiStallDetectInput completions_expired](self, "completions_expired");
  }

  else if ([v4 isEqualToString:@"completions_internalerror"])
  {
    -[WiFiStallDetectInput completions_internalerror](self, "completions_internalerror");
  }

  else if ([v4 isEqualToString:@"completions_ioerror"])
  {
    -[WiFiStallDetectInput completions_ioerror](self, "completions_ioerror");
  }

  else if ([v4 isEqualToString:@"completions_noack"])
  {
    -[WiFiStallDetectInput completions_noack](self, "completions_noack");
  }

  else if ([v4 isEqualToString:@"completions_nobuf"])
  {
    -[WiFiStallDetectInput completions_nobuf](self, "completions_nobuf");
  }

  else if ([v4 isEqualToString:@"completions_noremotepeer"])
  {
    -[WiFiStallDetectInput completions_noremotepeer](self, "completions_noremotepeer");
  }

  else if ([v4 isEqualToString:@"completions_noresources"])
  {
    -[WiFiStallDetectInput completions_noresources](self, "completions_noresources");
  }

  else if ([v4 isEqualToString:@"completions_txfailure"])
  {
    -[WiFiStallDetectInput completions_txfailure](self, "completions_txfailure");
  }

  else if ([v4 isEqualToString:@"roam_count"])
  {
    -[WiFiStallDetectInput roam_count](self, "roam_count");
  }

  else if ([v4 isEqualToString:@"roam_duration"])
  {
    -[WiFiStallDetectInput roam_duration](self, "roam_duration");
  }

  else if ([v4 isEqualToString:@"rssi_bin"])
  {
    -[WiFiStallDetectInput rssi_bin](self, "rssi_bin");
  }

  else
  {
    if (![v4 isEqualToString:@"snr_bin"])
    {
      v5 = 0LL;
      goto LABEL_72;
    }

    -[WiFiStallDetectInput snr_bin](self, "snr_bin");
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithDouble:](&OBJC_CLASS___MLFeatureValue, "featureValueWithDouble:"));
LABEL_72:

  return v5;
}

- (double)AC_problem_bitfield
{
  return self->_AC_problem_bitfield;
}

- (void)setAC_problem_bitfield:(double)a3
{
  self->_AC_problem_bitfield = a3;
}

- (double)TxBE_expiredCompletions
{
  return self->_TxBE_expiredCompletions;
}

- (void)setTxBE_expiredCompletions:(double)a3
{
  self->_TxBE_expiredCompletions = a3;
}

- (double)TxBE_failedCompletions
{
  return self->_TxBE_failedCompletions;
}

- (void)setTxBE_failedCompletions:(double)a3
{
  self->_TxBE_failedCompletions = a3;
}

- (double)TxBE_noAckCompletions
{
  return self->_TxBE_noAckCompletions;
}

- (void)setTxBE_noAckCompletions:(double)a3
{
  self->_TxBE_noAckCompletions = a3;
}

- (double)TxBE_otherErrCompletions
{
  return self->_TxBE_otherErrCompletions;
}

- (void)setTxBE_otherErrCompletions:(double)a3
{
  self->_TxBE_otherErrCompletions = a3;
}

- (double)TxBK_expiredCompletions
{
  return self->_TxBK_expiredCompletions;
}

- (void)setTxBK_expiredCompletions:(double)a3
{
  self->_TxBK_expiredCompletions = a3;
}

- (double)TxBK_failedCompletions
{
  return self->_TxBK_failedCompletions;
}

- (void)setTxBK_failedCompletions:(double)a3
{
  self->_TxBK_failedCompletions = a3;
}

- (double)TxBK_noAckCompletions
{
  return self->_TxBK_noAckCompletions;
}

- (void)setTxBK_noAckCompletions:(double)a3
{
  self->_TxBK_noAckCompletions = a3;
}

- (double)TxBK_otherErrCompletions
{
  return self->_TxBK_otherErrCompletions;
}

- (void)setTxBK_otherErrCompletions:(double)a3
{
  self->_TxBK_otherErrCompletions = a3;
}

- (double)TxVI_expiredCompletions
{
  return self->_TxVI_expiredCompletions;
}

- (void)setTxVI_expiredCompletions:(double)a3
{
  self->_TxVI_expiredCompletions = a3;
}

- (double)TxVI_failedCompletions
{
  return self->_TxVI_failedCompletions;
}

- (void)setTxVI_failedCompletions:(double)a3
{
  self->_TxVI_failedCompletions = a3;
}

- (double)TxVI_noAckCompletions
{
  return self->_TxVI_noAckCompletions;
}

- (void)setTxVI_noAckCompletions:(double)a3
{
  self->_TxVI_noAckCompletions = a3;
}

- (double)TxVI_otherErrCompletions
{
  return self->_TxVI_otherErrCompletions;
}

- (void)setTxVI_otherErrCompletions:(double)a3
{
  self->_TxVI_otherErrCompletions = a3;
}

- (double)TxVO_expiredCompletions
{
  return self->_TxVO_expiredCompletions;
}

- (void)setTxVO_expiredCompletions:(double)a3
{
  self->_TxVO_expiredCompletions = a3;
}

- (double)TxVO_failedCompletions
{
  return self->_TxVO_failedCompletions;
}

- (void)setTxVO_failedCompletions:(double)a3
{
  self->_TxVO_failedCompletions = a3;
}

- (double)TxVO_noAckCompletions
{
  return self->_TxVO_noAckCompletions;
}

- (void)setTxVO_noAckCompletions:(double)a3
{
  self->_TxVO_noAckCompletions = a3;
}

- (double)TxVO_otherErrCompletions
{
  return self->_TxVO_otherErrCompletions;
}

- (void)setTxVO_otherErrCompletions:(double)a3
{
  self->_TxVO_otherErrCompletions = a3;
}

- (double)bt_abort
{
  return self->_bt_abort;
}

- (void)setBt_abort:(double)a3
{
  self->_bt_abort = a3;
}

- (double)bt_grant
{
  return self->_bt_grant;
}

- (void)setBt_grant:(double)a3
{
  self->_bt_grant = a3;
}

- (double)bt_request
{
  return self->_bt_request;
}

- (void)setBt_request:(double)a3
{
  self->_bt_request = a3;
}

- (double)bt_uch_latency
{
  return self->_bt_uch_latency;
}

- (void)setBt_uch_latency:(double)a3
{
  self->_bt_uch_latency = a3;
}

- (double)cca_bin
{
  return self->_cca_bin;
}

- (void)setCca_bin:(double)a3
{
  self->_cca_bin = a3;
}

- (double)completions_chipmodeerror
{
  return self->_completions_chipmodeerror;
}

- (void)setCompletions_chipmodeerror:(double)a3
{
  self->_completions_chipmodeerror = a3;
}

- (double)completions_expired
{
  return self->_completions_expired;
}

- (void)setCompletions_expired:(double)a3
{
  self->_completions_expired = a3;
}

- (double)completions_internalerror
{
  return self->_completions_internalerror;
}

- (void)setCompletions_internalerror:(double)a3
{
  self->_completions_internalerror = a3;
}

- (double)completions_ioerror
{
  return self->_completions_ioerror;
}

- (void)setCompletions_ioerror:(double)a3
{
  self->_completions_ioerror = a3;
}

- (double)completions_noack
{
  return self->_completions_noack;
}

- (void)setCompletions_noack:(double)a3
{
  self->_completions_noack = a3;
}

- (double)completions_nobuf
{
  return self->_completions_nobuf;
}

- (void)setCompletions_nobuf:(double)a3
{
  self->_completions_nobuf = a3;
}

- (double)completions_noremotepeer
{
  return self->_completions_noremotepeer;
}

- (void)setCompletions_noremotepeer:(double)a3
{
  self->_completions_noremotepeer = a3;
}

- (double)completions_noresources
{
  return self->_completions_noresources;
}

- (void)setCompletions_noresources:(double)a3
{
  self->_completions_noresources = a3;
}

- (double)completions_txfailure
{
  return self->_completions_txfailure;
}

- (void)setCompletions_txfailure:(double)a3
{
  self->_completions_txfailure = a3;
}

- (double)roam_count
{
  return self->_roam_count;
}

- (void)setRoam_count:(double)a3
{
  self->_roam_count = a3;
}

- (double)roam_duration
{
  return self->_roam_duration;
}

- (void)setRoam_duration:(double)a3
{
  self->_roam_duration = a3;
}

- (double)rssi_bin
{
  return self->_rssi_bin;
}

- (void)setRssi_bin:(double)a3
{
  self->_rssi_bin = a3;
}

- (double)snr_bin
{
  return self->_snr_bin;
}

- (void)setSnr_bin:(double)a3
{
  self->_snr_bin = a3;
}

@end