@interface CDPurgeableServiceRequestResult
- (unint64_t)reportedPurgeableBytes;
- (void)setReportedPurgeableBytes:(unint64_t)a3;
@end

@implementation CDPurgeableServiceRequestResult

- (unint64_t)reportedPurgeableBytes
{
  return self->_reportedPurgeableBytes;
}

- (void)setReportedPurgeableBytes:(unint64_t)a3
{
  self->_reportedPurgeableBytes = a3;
}

@end