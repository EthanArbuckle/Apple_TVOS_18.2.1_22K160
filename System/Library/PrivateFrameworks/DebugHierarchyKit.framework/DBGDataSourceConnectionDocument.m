@interface DBGDataSourceConnectionDocument
+ (Class)matchingDataCoordinatorClass;
+ (id)connectionForDocumentDirectoryAtURL:(id)a3;
- (DBGDataSourceConnectionDelegate)delegate;
- (DBGDataSourceConnectionDocument)initWithDirectoryURL:(id)a3;
- (NSArray)dateOrderedDirectoryContents;
- (NSURL)directoryURL;
- (float)debugHierarchyVersion;
- (id)dataForFetchAtIndex:(int64_t)a3;
- (id)dateOrdererdContentsOfDirectory:(id)a3;
- (void)retrieveDebugHierarchyConfiguration:(id)a3;
- (void)setDateOrderedDirectoryContents:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDirectoryURL:(id)a3;
- (void)simulateInitialDataFetch;
- (void)simulateSecondaryDataFetch;
- (void)simulateTertiaryDataFetch;
- (void)simulateTotalDataFetchForRequest:(id)a3;
@end

@implementation DBGDataSourceConnectionDocument

+ (id)connectionForDocumentDirectoryAtURL:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDirectoryURL:v4];

  return v5;
}

- (DBGDataSourceConnectionDocument)initWithDirectoryURL:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___DBGDataSourceConnectionDocument;
  id v5 = -[DBGDataSourceConnectionDocument init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[DBGDataSourceConnectionDocument setDirectoryURL:](v5, "setDirectoryURL:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataSourceConnectionDocument directoryURL](v6, "directoryURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[DBGDataSourceConnectionDocument dateOrdererdContentsOfDirectory:]( v6,  "dateOrdererdContentsOfDirectory:",  v7));
    -[DBGDataSourceConnectionDocument setDateOrderedDirectoryContents:](v6, "setDateOrderedDirectoryContents:", v8);
  }

  return v6;
}

+ (Class)matchingDataCoordinatorClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___DBGDataCoordinatorOnDiskTargetHub, a2);
}

- (id)dateOrdererdContentsOfDirectory:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 contentsOfDirectoryAtPath:v5 error:0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sortedArrayUsingComparator:&__block_literal_global]);

  return v7;
}

int64_t __67__DBGDataSourceConnectionDocument_dateOrdererdContentsOfDirectory___block_invoke( id a1,  NSString *a2,  NSString *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSString componentsSeparatedByString:](v4, "componentsSeparatedByString:", @"-"));
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __67__DBGDataSourceConnectionDocument_dateOrdererdContentsOfDirectory___block_invoke_2;
  v10[3] = &unk_20710;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[NSString componentsSeparatedByString:](v5, "componentsSeparatedByString:", @"-"));
  id v11 = v7;
  v12 = &v13;
  [v6 enumerateObjectsUsingBlock:v10];
  int64_t v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __67__DBGDataSourceConnectionDocument_dateOrdererdContentsOfDirectory___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  double v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndex:a3]);
  [v9 doubleValue];
  double v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v11));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v12 compare:v13];

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    *a4 = 1;
  }
}

- (id)dataForFetchAtIndex:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataSourceConnectionDocument dateOrderedDirectoryContents](self, "dateOrderedDirectoryContents"));
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    v12 = 0LL;
  }

  else
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataSourceConnectionDocument dateOrderedDirectoryContents](self, "dateOrderedDirectoryContents"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:a3]);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataSourceConnectionDocument directoryURL](self, "directoryURL"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:v8]);
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v11));
  }

  return v12;
}

- (void)simulateInitialDataFetch
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[DBGDataSourceConnectionDocument dataForFetchAtIndex:](self, "dataForFetchAtIndex:", 0LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataSourceConnectionDocument delegate](self, "delegate"));
  [v3 didReceiveData:v4 forRequest:0];
}

- (void)simulateSecondaryDataFetch
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[DBGDataSourceConnectionDocument dataForFetchAtIndex:](self, "dataForFetchAtIndex:", 1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataSourceConnectionDocument delegate](self, "delegate"));
  [v3 didReceiveData:v4 forRequest:0];
}

- (void)simulateTertiaryDataFetch
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[DBGDataSourceConnectionDocument dataForFetchAtIndex:](self, "dataForFetchAtIndex:", 2LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataSourceConnectionDocument delegate](self, "delegate"));
  [v3 didReceiveData:v4 forRequest:0];
}

- (void)simulateTotalDataFetchForRequest:(id)a3
{
  id v11 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataSourceConnectionDocument dateOrderedDirectoryContents](self, "dateOrderedDirectoryContents"));
  id v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0LL;
    do
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataSourceConnectionDocument dataForFetchAtIndex:](self, "dataForFetchAtIndex:", v6));
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[DBGDataSourceConnectionDocument delegate](self, "delegate"));
      [v8 didReceiveData:v7 forRequest:v11];

      ++v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue( -[DBGDataSourceConnectionDocument dateOrderedDirectoryContents]( self,  "dateOrderedDirectoryContents"));
      id v10 = [v9 count];
    }

    while (v6 < (unint64_t)v10);
  }
}

- (void)retrieveDebugHierarchyConfiguration:(id)a3
{
}

- (float)debugHierarchyVersion
{
  return 3.0;
}

- (DBGDataSourceConnectionDelegate)delegate
{
  return (DBGDataSourceConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)directoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDirectoryURL:(id)a3
{
}

- (NSArray)dateOrderedDirectoryContents
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDateOrderedDirectoryContents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end