@interface PLDuetActivitySchedulerUsageSnapshot
- (NSDate)startDate;
- (NSDate)stopDate;
- (NSString)bundleID;
- (double)numberOfBytesDownloadedCell;
- (double)numberOfBytesDownloadedWiFi;
- (double)numberOfBytesUploadedCell;
- (double)numberOfBytesUploadedWiFi;
- (id)description;
- (void)setBundleID:(id)a3;
- (void)setNumberOfBytesDownloadedCell:(double)a3;
- (void)setNumberOfBytesDownloadedWiFi:(double)a3;
- (void)setNumberOfBytesUploadedCell:(double)a3;
- (void)setNumberOfBytesUploadedWiFi:(double)a3;
- (void)setStartDate:(id)a3;
- (void)setStopDate:(id)a3;
@end

@implementation PLDuetActivitySchedulerUsageSnapshot

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[PLDuetActivitySchedulerUsageSnapshot startDate](self, "startDate");
  v5 = -[PLDuetActivitySchedulerUsageSnapshot stopDate](self, "stopDate");
  -[PLDuetActivitySchedulerUsageSnapshot numberOfBytesUploadedCell](self, "numberOfBytesUploadedCell");
  uint64_t v7 = v6;
  -[PLDuetActivitySchedulerUsageSnapshot numberOfBytesDownloadedCell](self, "numberOfBytesDownloadedCell");
  uint64_t v9 = v8;
  -[PLDuetActivitySchedulerUsageSnapshot numberOfBytesUploadedWiFi](self, "numberOfBytesUploadedWiFi");
  uint64_t v11 = v10;
  -[PLDuetActivitySchedulerUsageSnapshot numberOfBytesDownloadedWiFi](self, "numberOfBytesDownloadedWiFi");
  uint64_t v13 = v12;
  v14 = -[PLDuetActivitySchedulerUsageSnapshot bundleID](self, "bundleID");
  [v3 stringWithFormat:@"PLDuetActivitySchedulerUsageSnapshot (%@, %@, %f, %f, %f, %f, %@)", v4, v5, v7, v9, v11, v13, v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)stopDate
{
  return (NSDate *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setStopDate:(id)a3
{
}

- (double)numberOfBytesUploadedWiFi
{
  return self->_numberOfBytesUploadedWiFi;
}

- (void)setNumberOfBytesUploadedWiFi:(double)a3
{
  self->_numberOfBytesUploadedWiFi = a3;
}

- (double)numberOfBytesDownloadedWiFi
{
  return self->_numberOfBytesDownloadedWiFi;
}

- (void)setNumberOfBytesDownloadedWiFi:(double)a3
{
  self->_numberOfBytesDownloadedWiFi = a3;
}

- (double)numberOfBytesUploadedCell
{
  return self->_numberOfBytesUploadedCell;
}

- (void)setNumberOfBytesUploadedCell:(double)a3
{
  self->_numberOfBytesUploadedCell = a3;
}

- (double)numberOfBytesDownloadedCell
{
  return self->_numberOfBytesDownloadedCell;
}

- (void)setNumberOfBytesDownloadedCell:(double)a3
{
  self->_numberOfBytesDownloadedCell = a3;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end