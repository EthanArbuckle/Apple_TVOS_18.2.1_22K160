@interface CKOperationGroup
- (id)cplDebugDescription;
- (void)setRoughCPLDownloadEstimatedSize:(unint64_t)a3;
- (void)setRoughCPLDownloadEstimatedSizeWithEstimatedRecordCount:(unint64_t)a3;
- (void)setRoughCPLRecordCount:(unint64_t)a3;
- (void)setRoughCPLUploadEstimatedSize:(unint64_t)a3;
@end

@implementation CKOperationGroup

- (void)setRoughCPLUploadEstimatedSize:(unint64_t)a3
{
  uint64_t v3 = 2LL;
  uint64_t v4 = 3LL;
  uint64_t v5 = 4LL;
  uint64_t v6 = 5LL;
  uint64_t v7 = 6LL;
  if (HIDWORD(a3) >= 0x19) {
    uint64_t v7 = 7LL;
  }
  if (a3 >> 31 >= 5) {
    uint64_t v6 = v7;
  }
  if (a3 >> 30) {
    uint64_t v5 = v6;
  }
  if (a3 >> 22 >= 0x19) {
    uint64_t v4 = v5;
  }
  if (a3 >= 0xA00000) {
    uint64_t v3 = v4;
  }
  if (a3 >= 0x100000) {
    -[CKOperationGroup setExpectedSendSize:](self, "setExpectedSendSize:", v3);
  }
  else {
    -[CKOperationGroup setExpectedSendSize:](self, "setExpectedSendSize:", 1LL);
  }
}

- (void)setRoughCPLDownloadEstimatedSize:(unint64_t)a3
{
  uint64_t v3 = 2LL;
  uint64_t v4 = 3LL;
  uint64_t v5 = 4LL;
  uint64_t v6 = 5LL;
  uint64_t v7 = 6LL;
  if (HIDWORD(a3) >= 0x19) {
    uint64_t v7 = 7LL;
  }
  if (a3 >> 31 >= 5) {
    uint64_t v6 = v7;
  }
  if (a3 >> 30) {
    uint64_t v5 = v6;
  }
  if (a3 >> 22 >= 0x19) {
    uint64_t v4 = v5;
  }
  if (a3 >= 0xA00000) {
    uint64_t v3 = v4;
  }
  if (a3 >= 0x100000) {
    -[CKOperationGroup setExpectedReceiveSize:](self, "setExpectedReceiveSize:", v3);
  }
  else {
    -[CKOperationGroup setExpectedReceiveSize:](self, "setExpectedReceiveSize:", 1LL);
  }
}

- (void)setRoughCPLDownloadEstimatedSizeWithEstimatedRecordCount:(unint64_t)a3
{
  unint64_t v3 = a3 << 10;
  uint64_t v4 = 2LL;
  uint64_t v5 = 3LL;
  uint64_t v6 = 4LL;
  uint64_t v7 = 5LL;
  uint64_t v8 = 6LL;
  if (a3 << 10 >> 32 >= 0x19) {
    uint64_t v8 = 7LL;
  }
  if (a3 << 10 >> 31 >= 5) {
    uint64_t v7 = v8;
  }
  if (a3 << 10 >> 30) {
    uint64_t v6 = v7;
  }
  if (a3 << 10 >> 22 >= 0x19) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0xA00000) {
    uint64_t v4 = v5;
  }
  if (v3 >= 0x100000) {
    -[CKOperationGroup setExpectedReceiveSize:](self, "setExpectedReceiveSize:", v4);
  }
  else {
    -[CKOperationGroup setExpectedReceiveSize:](self, "setExpectedReceiveSize:", 1LL);
  }
}

- (void)setRoughCPLRecordCount:(unint64_t)a3
{
}

- (id)cplDebugDescription
{
  switch(-[CKOperationGroup expectedSendSize](self, "expectedSendSize"))
  {
    case CKOperationGroupTransferSizeKilobytes:
      char v3 = 0;
      uint64_t v4 = @"Kilobytes";
      break;
    case CKOperationGroupTransferSizeMegabytes:
      char v3 = 0;
      uint64_t v4 = @"Megabytes";
      break;
    case CKOperationGroupTransferSizeTensOfMegabytes:
      char v3 = 0;
      uint64_t v4 = @"10s of Megabytes";
      break;
    case CKOperationGroupTransferSizeHundredsOfMegabytes:
      char v3 = 0;
      uint64_t v4 = @"100s of Megabytes";
      break;
    case CKOperationGroupTransferSizeGigabytes:
      char v3 = 0;
      uint64_t v4 = @"Gigabytes";
      break;
    case CKOperationGroupTransferSizeTensOfGigabytes:
      char v3 = 0;
      uint64_t v4 = @"10s of Gigabytes";
      break;
    case CKOperationGroupTransferSizeHundredsOfGigabytes:
      char v3 = 0;
      uint64_t v4 = @"100s of Gigabytes";
      break;
    default:
      uint64_t v4 = 0LL;
      char v3 = 1;
      break;
  }

  switch(-[CKOperationGroup expectedReceiveSize](self, "expectedReceiveSize"))
  {
    case CKOperationGroupTransferSizeKilobytes:
      char v5 = 0;
      uint64_t v6 = @"Kilobytes";
      break;
    case CKOperationGroupTransferSizeMegabytes:
      char v5 = 0;
      uint64_t v6 = @"Megabytes";
      break;
    case CKOperationGroupTransferSizeTensOfMegabytes:
      char v5 = 0;
      uint64_t v6 = @"10s of Megabytes";
      break;
    case CKOperationGroupTransferSizeHundredsOfMegabytes:
      char v5 = 0;
      uint64_t v6 = @"100s of Megabytes";
      break;
    case CKOperationGroupTransferSizeGigabytes:
      char v5 = 0;
      uint64_t v6 = @"Gigabytes";
      break;
    case CKOperationGroupTransferSizeTensOfGigabytes:
      char v5 = 0;
      uint64_t v6 = @"10s of Gigabytes";
      break;
    case CKOperationGroupTransferSizeHundredsOfGigabytes:
      char v5 = 0;
      uint64_t v6 = @"100s of Gigabytes";
      break;
    default:
      uint64_t v6 = 0LL;
      char v5 = 1;
      break;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKOperationGroup name](self, "name"));
  id v8 = [v7 mutableCopy];

  if ((v3 & 1) == 0) {
    [v8 appendFormat:@" up: %@", v4];
  }
  if ((v5 & 1) == 0) {
    [v8 appendFormat:@" down: %@", v6];
  }
  if (-[CKOperationGroup quantity](self, "quantity")) {
    objc_msgSend(v8, "appendFormat:", @" count: %lu", -[CKOperationGroup quantity](self, "quantity"));
  }
  return v8;
}

@end