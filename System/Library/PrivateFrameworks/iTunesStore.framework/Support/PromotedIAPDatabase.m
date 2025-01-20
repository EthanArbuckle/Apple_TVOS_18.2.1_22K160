@interface PromotedIAPDatabase
+ (BOOL)_setupDatabase:(id)a3;
+ (void)_createDatabaseDirectory;
- (PromotedIAPDatabase)init;
- (PromotedIAPDatabase)initWithDatabaseURL:(id)a3 readOnly:(BOOL)a4;
- (void)getOrderForIAPsInApp:(id)a3 completionHandler:(id)a4;
- (void)getVisibilityForAllIAPsInApp:(id)a3 completionHandler:(id)a4;
- (void)getVisibilityForIAPs:(id)a3 app:(id)a4 completionHandler:(id)a5;
- (void)modifyUsingTransactionBlock:(id)a3;
- (void)readAsyncUsingTransactionBlock:(id)a3;
- (void)readUsingTransactionBlock:(id)a3;
- (void)removeOverridesForApp:(id)a3 completionHandler:(id)a4;
- (void)setOrderForIAPs:(id)a3 app:(id)a4 completionHandler:(id)a5;
- (void)setVisibility:(int64_t)a3 forIAP:(id)a4 app:(id)a5 completionHandler:(id)a6;
@end

@implementation PromotedIAPDatabase

- (PromotedIAPDatabase)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PromotedIAPDatabaseSchema databasePath](&OBJC_CLASS___PromotedIAPDatabaseSchema, "databasePath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v3, 0LL));

  v5 = -[PromotedIAPDatabase initWithDatabaseURL:readOnly:](self, "initWithDatabaseURL:readOnly:", v4, 0LL);
  return v5;
}

- (PromotedIAPDatabase)initWithDatabaseURL:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PromotedIAPDatabase;
  v7 = -[PromotedIAPDatabase init](&v11, "init");
  if (v7)
  {
    +[PromotedIAPDatabase _createDatabaseDirectory](&OBJC_CLASS___PromotedIAPDatabase, "_createDatabaseDirectory");
    v8 = -[SSSQLiteDatabase initWithDatabaseURL:readOnly:protectionType:]( objc_alloc(&OBJC_CLASS___SSSQLiteDatabase),  "initWithDatabaseURL:readOnly:protectionType:",  v6,  v4,  NSFileProtectionCompleteUntilFirstUserAuthentication);
    database = v7->_database;
    v7->_database = v8;

    if (!v4) {
      -[SSSQLiteDatabase setSetupBlock:](v7->_database, "setSetupBlock:", &stru_10034FE38);
    }
  }

  return v7;
}

- (void)modifyUsingTransactionBlock:(id)a3
{
  id v4 = a3;
  database = self->_database;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100160D74;
  v7[3] = &unk_10034AD30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[SSSQLiteDatabase performTransactionWithBlock:](database, "performTransactionWithBlock:", v7);
}

- (void)readAsyncUsingTransactionBlock:(id)a3
{
  id v4 = a3;
  database = self->_database;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100160E5C;
  v7[3] = &unk_10034ACE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[SSSQLiteDatabase dispatchBlockAsync:](database, "dispatchBlockAsync:", v7);
}

- (void)readUsingTransactionBlock:(id)a3
{
  id v4 = a3;
  database = self->_database;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100160EE4;
  v7[3] = &unk_10034AD30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[SSSQLiteDatabase performTransactionWithBlock:](database, "performTransactionWithBlock:", v7);
}

- (void)getVisibilityForIAPs:(id)a3 app:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 count];
  if (v9 && v11)
  {
    v12 = objc_opt_new(&OBJC_CLASS___NSMutableString);
    if ([v8 count])
    {
      unint64_t v13 = 0LL;
      do
      {
        -[NSMutableString appendFormat:](v12, "appendFormat:", @"?, ");
        ++v13;
      }

      while (v13 < (unint64_t)[v8 count]);
    }

    -[NSMutableString deleteCharactersInRange:]( v12,  "deleteCharactersInRange:",  (char *)-[NSMutableString length](v12, "length") - 2,  2LL);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10016111C;
    v17[3] = &unk_10034FE60;
    v18 = v12;
    id v19 = v8;
    id v20 = v9;
    id v21 = v10;
    v14 = v12;
    -[PromotedIAPDatabase readAsyncUsingTransactionBlock:](self, "readAsyncUsingTransactionBlock:", v17);

    goto LABEL_9;
  }

  if (v10)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100161108;
    block[3] = &unk_10034ACB8;
    v23 = (NSMutableString *)v10;
    dispatch_async(v16, block);

    v14 = v23;
LABEL_9:
  }
}

- (void)getVisibilityForAllIAPsInApp:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10016161C;
    v12[3] = &unk_10034FE88;
    id v9 = &v13;
    id v13 = v6;
    v14 = v8;
    -[PromotedIAPDatabase readAsyncUsingTransactionBlock:](self, "readAsyncUsingTransactionBlock:", v12);
    id v10 = v14;
LABEL_5:

    goto LABEL_6;
  }

  if (v7)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100161608;
    block[3] = &unk_10034ACB8;
    id v9 = &v16;
    id v16 = v8;
    dispatch_async(v10, block);
    goto LABEL_5;
  }

- (void)setVisibility:(int64_t)a3 forIAP:(id)a4 app:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (v11)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100161A04;
    v17[3] = &unk_10034FED8;
    v14 = &v18;
    id v18 = v10;
    id v19 = (dispatch_queue_s *)v11;
    int64_t v21 = a3;
    id v20 = v13;
    -[PromotedIAPDatabase modifyUsingTransactionBlock:](self, "modifyUsingTransactionBlock:", v17);

    v15 = v19;
LABEL_5:

    goto LABEL_6;
  }

  if (v12)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001619F4;
    block[3] = &unk_10034ACB8;
    v14 = &v23;
    id v23 = v13;
    dispatch_async(v15, block);
    goto LABEL_5;
  }

- (void)getOrderForIAPsInApp:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001620BC;
    v12[3] = &unk_10034FE88;
    id v9 = &v13;
    id v13 = v6;
    v14 = v8;
    -[PromotedIAPDatabase readAsyncUsingTransactionBlock:](self, "readAsyncUsingTransactionBlock:", v12);
    id v10 = v14;
LABEL_5:

    goto LABEL_6;
  }

  if (v7)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001620A8;
    block[3] = &unk_10034ACB8;
    id v9 = &v16;
    id v16 = v8;
    dispatch_async(v10, block);
    goto LABEL_5;
  }

- (void)setOrderForIAPs:(id)a3 app:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v9)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", v8));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 array]);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100162488;
    v17[3] = &unk_10034FF00;
    id v18 = v9;
    id v19 = v13;
    id v20 = v11;
    id v14 = v13;
    -[PromotedIAPDatabase modifyUsingTransactionBlock:](self, "modifyUsingTransactionBlock:", v17);

LABEL_5:
    goto LABEL_6;
  }

  if (v10)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100162478;
    block[3] = &unk_10034ACB8;
    id v22 = v11;
    dispatch_async(v16, block);

    id v14 = v22;
    goto LABEL_5;
  }

- (void)removeOverridesForApp:(id)a3 completionHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100162ABC;
  v8[3] = &unk_10034FE88;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  -[PromotedIAPDatabase modifyUsingTransactionBlock:](self, "modifyUsingTransactionBlock:", v8);
}

+ (void)_createDatabaseDirectory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PromotedIAPDatabaseSchema databasePath](&OBJC_CLASS___PromotedIAPDatabaseSchema, "databasePath"));
  if (v2)
  {
    block[1] = 3221225472LL;
    block[2] = sub_100162EC4;
    block[3] = &unk_10034AC30;
    id v3 = v2;
    block[0] = _NSConcreteStackBlock;
    id v5 = v2;
    if (qword_1003A3578 != -1) {
      dispatch_once(&qword_1003A3578, block);
    }

    v2 = v3;
  }
}

+ (BOOL)_setupDatabase:(id)a3
{
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100162FF0;
  v6[3] = &unk_10034D398;
  id v8 = &v9;
  id v3 = a3;
  id v7 = v3;
  [v3 performTransactionWithBlock:v6];
  char v4 = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (void).cxx_destruct
{
}

@end