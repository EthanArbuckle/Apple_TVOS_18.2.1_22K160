@interface PFCloudKitErrorLogEntry
- (PFCloudKitErrorLogEntry)initWithError:(id)a3 annotation:(id)a4;
- (void)dealloc;
@end

@implementation PFCloudKitErrorLogEntry

- (PFCloudKitErrorLogEntry)initWithError:(id)a3 annotation:(id)a4
{
  v6 = -[PFCloudKitErrorLogEntry init](self, "init");
  if (v6)
  {
    v6->_annotation = (NSString *)a4;
    v6->_error = (NSError *)a3;
  }

  return v6;
}

- (void)dealloc
{
  self->_annotation = 0LL;
  self->_error = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitErrorLogEntry;
  -[PFCloudKitErrorLogEntry dealloc](&v3, sel_dealloc);
}

@end