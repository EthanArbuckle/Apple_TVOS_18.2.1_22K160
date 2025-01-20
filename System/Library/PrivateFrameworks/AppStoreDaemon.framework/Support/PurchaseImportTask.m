@interface PurchaseImportTask
- (PurchaseImportTask)init;
- (void)main;
@end

@implementation PurchaseImportTask

- (PurchaseImportTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PurchaseImportTask;
  result = -[Task init](&v3, "init");
  if (result) {
    *(_DWORD *)&result->super._success = 0;
  }
  return result;
}

- (void)main
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[PurchaseBatch count](self->_purchaseBatch, "count")));
  id v4 = -[PurchaseBatch count](self->_purchaseBatch, "count");
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  purchaseBatch = self->_purchaseBatch;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001CD058;
  v15[3] = &unk_1003EB8A8;
  v15[4] = self;
  BOOL v18 = (unint64_t)v4 > 1;
  id v6 = v3;
  id v16 = v6;
  v17 = &v19;
  -[PurchaseBatch enumerateObjectsUsingBlock:](purchaseBatch, "enumerateObjectsUsingBlock:", v15);
  id v7 = sub_10023B9CC((uint64_t)&OBJC_CLASS___AppInstallScheduler);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  sub_10023C018((uint64_t)v8, 0x4000LL);

  sub_10020E6CC((uint64_t)self->super._error, v6, *(void **)&self->_lock._os_unfair_lock_opaque);
  if (*((_BYTE *)v20 + 24))
  {
    id v9 = sub_10023B9CC((uint64_t)&OBJC_CLASS___AppInstallScheduler);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    sub_10023C568((uint64_t)v10);
  }

  uint64_t v11 = ASDLogHandleForCategory(25LL);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (char *)[*(id *)&self->_lock._os_unfair_lock_opaque signpostID];
  if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)v13,  "Purchase/Import",  "",  v14,  2u);
  }

  -[Task completeWithSuccess](self, "completeWithSuccess");
  _Block_object_dispose(&v19, 8);
}

- (void).cxx_destruct
{
}

@end