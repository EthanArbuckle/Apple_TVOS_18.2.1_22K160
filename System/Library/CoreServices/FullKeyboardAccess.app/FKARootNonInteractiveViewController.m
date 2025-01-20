@interface FKARootNonInteractiveViewController
- (FKATypeaheadNamesViewController)typeaheadNamesViewController;
- (void)setTypeaheadNamesViewController:(id)a3;
- (void)updateTypeaheadNamesForQueryString:(id)a3;
@end

@implementation FKARootNonInteractiveViewController

- (void)updateTypeaheadNamesForQueryString:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[FKARootNonInteractiveViewController typeaheadNamesViewController]( self,  "typeaheadNamesViewController"));

  if (v5)
  {
    if ([v4 length])
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000C01C;
      block[3] = &unk_100020708;
      block[4] = self;
      id v10 = v4;
      dispatch_async(v7, block);
    }

    else
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_10000C3C0;
      v8[3] = &unk_1000207E8;
      v8[4] = self;
      AXPerformBlockOnMainThread(v8);
    }
  }
}

- (FKATypeaheadNamesViewController)typeaheadNamesViewController
{
  return self->_typeaheadNamesViewController;
}

- (void)setTypeaheadNamesViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end