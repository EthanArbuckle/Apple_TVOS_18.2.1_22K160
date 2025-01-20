@interface TVHMediaEntityPreviewFetchController
- (NSCopying)identifier;
- (NSString)context;
- (NSString)mediaEntitiesFetchControllerIdentifier;
- (TVHKMediaEntitiesFetchController)fetchController;
- (TVHKMediaEntitiesFetchResult)mediaEntitiesFetchResult;
- (TVHMediaEntityPreviewFetchController)init;
- (TVHMediaEntityPreviewFetchController)initWithFetchDescriptor:(id)a3;
- (TVHMediaEntityPreviewFetchControllerDelegate)delegate;
- (void)_handleMediaEntitiesFetchControllerResultSet:(id)a3;
- (void)dealloc;
- (void)disable;
- (void)enable;
- (void)invalidate;
- (void)mediaEntitiesFetchController:(id)a3 didCompleteWithResultSet:(id)a4 sourceMediaEntity:(id)a5;
- (void)mediaEntitiesFetchController:(id)a3 didFailWithError:(id)a4;
- (void)mediaEntitiesFetchController:(id)a3 mediaEntitiesDidChangeWithResultSet:(id)a4;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFetchController:(id)a3;
- (void)setMediaEntitiesFetchResult:(id)a3;
@end

@implementation TVHMediaEntityPreviewFetchController

- (TVHMediaEntityPreviewFetchController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMediaEntityPreviewFetchController)initWithFetchDescriptor:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVHMediaEntityPreviewFetchController;
  v5 = -[TVHMediaEntityPreviewFetchController init](&v22, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    v7 = (NSCopying *)[v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 context]);
    v10 = (NSString *)[v9 copy];
    context = v5->_context;
    v5->_context = v10;

    v12 = objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesFetchController);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaLibrary]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 fetchRequest]);
    v23 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
    v16 = -[TVHKMediaEntitiesFetchController initWithMediaLibrary:fetchRequests:]( v12,  "initWithMediaLibrary:fetchRequests:",  v13,  v15);
    fetchController = v5->_fetchController;
    v5->_fetchController = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 logName]);
    if (v18) {
      -[TVHKMediaEntitiesFetchController setLogName:](v5->_fetchController, "setLogName:", v18);
    }
    -[TVHKMediaEntitiesFetchController setDelegate:](v5->_fetchController, "setDelegate:", v5);
    -[TVHKMediaEntitiesFetchController enable](v5->_fetchController, "enable");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntitiesFetchController mediaLibrary](v5->_fetchController, "mediaLibrary"));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaLibraryFetchControllerManager managerForMediaLibrary:]( &OBJC_CLASS___TVHKMediaLibraryFetchControllerManager,  "managerForMediaLibrary:",  v19));

    [v20 addFetchController:v5->_fetchController];
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHMediaEntityPreviewFetchController;
  -[TVHMediaEntityPreviewFetchController dealloc](&v3, "dealloc");
}

- (void)enable
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityPreviewFetchController fetchController](self, "fetchController"));
  [v2 enable];
}

- (void)disable
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityPreviewFetchController fetchController](self, "fetchController"));
  [v2 disable];
}

- (void)invalidate
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityPreviewFetchController fetchController](self, "fetchController"));
  if (v3)
  {
    id v6 = v3;
    [v3 setDelegate:0];
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaLibrary]);
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaLibraryFetchControllerManager managerForMediaLibrary:]( &OBJC_CLASS___TVHKMediaLibraryFetchControllerManager,  "managerForMediaLibrary:",  v4));

    [v5 removeFetchController:v6];
    -[TVHMediaEntityPreviewFetchController setFetchController:](self, "setFetchController:", 0LL);

    objc_super v3 = v6;
  }
}

- (NSString)mediaEntitiesFetchControllerIdentifier
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityPreviewFetchController fetchController](self, "fetchController"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);

  return (NSString *)v3;
}

- (void)mediaEntitiesFetchController:(id)a3 didCompleteWithResultSet:(id)a4 sourceMediaEntity:(id)a5
{
}

- (void)mediaEntitiesFetchController:(id)a3 mediaEntitiesDidChangeWithResultSet:(id)a4
{
}

- (void)mediaEntitiesFetchController:(id)a3 didFailWithError:(id)a4
{
  id v4 = a3;
  id v5 = sub_100079DD8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10009C508(v4, v6);
  }
}

- (void)_handleMediaEntitiesFetchControllerResultSet:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 results]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v12 response]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityPreviewFetchController mediaEntitiesFetchResult](self, "mediaEntitiesFetchResult"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntitiesResult]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v12 changeSet]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaEntitiesChangeSet]);

  -[TVHMediaEntityPreviewFetchController setMediaEntitiesFetchResult:](self, "setMediaEntitiesFetchResult:", v7);
  v10 = -[TVHMediaEntityPreviewFetchControllerResult initWithLatestMediaEntitiesFetchResult:previousMediaEntitiesFetchResult:changeSet:]( objc_alloc(&OBJC_CLASS___TVHMediaEntityPreviewFetchControllerResult),  "initWithLatestMediaEntitiesFetchResult:previousMediaEntitiesFetchResult:changeSet:",  v7,  v6,  v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityPreviewFetchController delegate](self, "delegate"));
  [v11 controller:self didCompleteWithResult:v10];
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (TVHKMediaEntitiesFetchResult)mediaEntitiesFetchResult
{
  return self->_mediaEntitiesFetchResult;
}

- (void)setMediaEntitiesFetchResult:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (TVHMediaEntityPreviewFetchControllerDelegate)delegate
{
  return (TVHMediaEntityPreviewFetchControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVHKMediaEntitiesFetchController)fetchController
{
  return self->_fetchController;
}

- (void)setFetchController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end