@interface PFCloudKitImporterOptions
- (PFCloudKitImporterOptions)initWithOptions:(id)a3 monitor:(id)a4 assetStorageURL:(id)a5 workQueue:(id)a6 andDatabase:(id)a7;
- (id)copy;
- (void)dealloc;
@end

@implementation PFCloudKitImporterOptions

- (PFCloudKitImporterOptions)initWithOptions:(id)a3 monitor:(id)a4 assetStorageURL:(id)a5 workQueue:(id)a6 andDatabase:(id)a7
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PFCloudKitImporterOptions;
  v12 = -[PFCloudKitImporterOptions init](&v15, sel_init);
  if (v12)
  {
    v12->_options = (NSCloudKitMirroringDelegateOptions *)[a3 copy];
    v12->_database = (CKDatabase *)a7;
    v12->_monitor = (PFCloudKitStoreMonitor *)a4;
    v12->_workQueue = (OS_dispatch_queue *)a6;
    v12->_assetStorageURL = (NSURL *)a5;
    workQueue = (dispatch_object_s *)v12->_workQueue;
    if (workQueue) {
      dispatch_retain(workQueue);
    }
  }

  return v12;
}

- (void)dealloc
{
  workQueue = (dispatch_object_s *)self->_workQueue;
  if (workQueue) {
    dispatch_release(workQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PFCloudKitImporterOptions;
  -[PFCloudKitImporterOptions dealloc](&v4, sel_dealloc);
}

- (id)copy
{
  return -[PFCloudKitImporterOptions initWithOptions:monitor:assetStorageURL:workQueue:andDatabase:]( objc_alloc(&OBJC_CLASS___PFCloudKitImporterOptions),  "initWithOptions:monitor:assetStorageURL:workQueue:andDatabase:",  self->_options,  self->_monitor,  self->_assetStorageURL,  self->_workQueue,  self->_database);
}

@end