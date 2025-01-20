@interface PFCloudKitImporterWorkItem
- (PFCloudKitImporterWorkItem)initWithOptions:(id)a3 request:(id)a4;
- (void)dealloc;
- (void)doWorkForStore:(id)a3 inMonitor:(id)a4 completion:(id)a5;
@end

@implementation PFCloudKitImporterWorkItem

- (PFCloudKitImporterWorkItem)initWithOptions:(id)a3 request:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PFCloudKitImporterWorkItem;
  v6 = -[PFCloudKitImporterWorkItem init](&v8, sel_init);
  if (v6)
  {
    v6->_options = (PFCloudKitImporterOptions *)a3;
    v6->_request = (NSCloudKitMirroringImportRequest *)a4;
  }

  return v6;
}

- (void)dealloc
{
  self->_options = 0LL;
  self->_request = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitImporterWorkItem;
  -[PFCloudKitImporterWorkItem dealloc](&v3, sel_dealloc);
}

- (void)doWorkForStore:(id)a3 inMonitor:(id)a4 completion:(id)a5
{
}

@end