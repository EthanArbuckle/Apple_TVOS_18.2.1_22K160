@interface IDEDataProvider_SpriteKit
+ (id)sharedDataProvider;
- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5;
- (IDEDataProvider_SpriteKit)init;
- (id)captureAttributes:(id)a3 forPIDs:(id)a4;
- (id)startSamplingForPIDs:(id)a3;
- (id)stopSamplingForPIDs:(id)a3;
- (id)supportedAttributes;
@end

@implementation IDEDataProvider_SpriteKit

+ (id)sharedDataProvider
{
  if (qword_11390 != -1) {
    dispatch_once(&qword_11390, &stru_C438);
  }
  return (id)qword_11388;
}

- (IDEDataProvider_SpriteKit)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDEDataProvider_SpriteKit;
  v2 = -[IDEDataProvider_SpriteKit init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    collectionStartedForPidDictionary = v2->_collectionStartedForPidDictionary;
    v2->_collectionStartedForPidDictionary = v3;

    dispatch_queue_t v5 = dispatch_queue_create("Lock to protect multithread access during capturing", 0LL);
    capture_lock = v2->_capture_lock;
    v2->_capture_lock = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (id)supportedAttributes
{
  if (qword_113A0 != -1) {
    dispatch_once(&qword_113A0, &stru_C458);
  }
  return (id)qword_11398;
}

- (id)startSamplingForPIDs:(id)a3
{
  return a3;
}

- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5
{
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_collectionStartedForPidDictionary, "objectForKey:", a5, a4));
  [v5 BOOLValue];

  return 0;
}

- (id)stopSamplingForPIDs:(id)a3
{
  return a3;
}

- (id)captureAttributes:(id)a3 forPIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  capture_lock = self->_capture_lock;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_172C;
  v16[3] = &unk_C480;
  id v17 = v7;
  v18 = self;
  id v19 = v6;
  id v10 = v8;
  id v20 = v10;
  id v11 = v6;
  id v12 = v7;
  dispatch_sync((dispatch_queue_t)capture_lock, v16);
  v13 = v20;
  id v14 = v10;

  return v14;
}

- (void).cxx_destruct
{
}

@end