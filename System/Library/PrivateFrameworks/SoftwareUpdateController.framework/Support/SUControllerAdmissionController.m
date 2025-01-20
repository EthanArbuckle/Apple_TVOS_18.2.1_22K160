@interface SUControllerAdmissionController
+ (id)sharedController;
- (void)checkAdmissionForActivity:(int64_t)a3 withDescriptor:(id)a4 registerForChanges:(BOOL)a5 handler:(id)a6;
@end

@implementation SUControllerAdmissionController

+ (id)sharedController
{
  if (qword_100079678 != -1) {
    dispatch_once(&qword_100079678, &stru_100065C38);
  }
  return (id)qword_100079670;
}

- (void)checkAdmissionForActivity:(int64_t)a3 withDescriptor:(id)a4 registerForChanges:(BOOL)a5 handler:(id)a6
{
  id v6 = a6;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100038618;
  block[3] = &unk_100064888;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, block);
}

@end