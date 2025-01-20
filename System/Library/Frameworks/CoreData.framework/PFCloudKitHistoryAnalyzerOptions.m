@interface PFCloudKitHistoryAnalyzerOptions
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
@end

@implementation PFCloudKitHistoryAnalyzerOptions

- (void)dealloc
{
  self->_request = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitHistoryAnalyzerOptions;
  -[PFCloudKitHistoryAnalyzerOptions dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PFCloudKitHistoryAnalyzerOptions;
  v4 = -[PFHistoryAnalyzerOptions copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[25] = *(&self->_includePrivateTransactions + 1);
  *((void *)v4 + 4) = self->_request;
  return v4;
}

@end