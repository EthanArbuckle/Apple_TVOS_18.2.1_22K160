@interface __NSCFURLSessionTaskInfo
- (id)_AVAssetDownloadSessionOptions:(id)a3 config:(id)a4 asset:(id)a5;
- (id)_URLToUse;
- (id)_destinationURLToUse;
@end

@implementation __NSCFURLSessionTaskInfo

- (id)_URLToUse
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo AVURLAsset](self, "AVURLAsset"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo AVURLAsset](self, "AVURLAsset"));
    if (v4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo URL](self, "URL"));
    goto LABEL_8;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo downloadConfig](self, "downloadConfig"));
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 _asset]);

  v4 = (void *)v9;
  if (!v9) {
    goto LABEL_6;
  }
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URL]);
  unsigned int v6 = [v5 isFileURL];

  if (v6) {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 originalNetworkContentURL]);
  }
  else {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 URL]);
  }
LABEL_8:
  v10 = (void *)v7;

  return v10;
}

- (id)_destinationURLToUse
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo temporaryDestinationURL](self, "temporaryDestinationURL"));
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo destinationURL](self, "destinationURL"));
  }
  unsigned int v6 = v5;

  return v6;
}

- (id)_AVAssetDownloadSessionOptions:(id)a3 config:(id)a4 asset:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo options](self, "options"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo options](self, "options"));
    id v11 = [v10 mutableCopy];
  }

  else
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo assetTitle](self, "assetTitle"));
  [v11 setObject:v12 forKeyedSubscript:AVAssetDownloadSessionAssetNameKey];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo assetArtworkData](self, "assetArtworkData"));
  [v11 setObject:v13 forKeyedSubscript:AVAssetDownloadSessionAssetImageDataKey];

  v14 = v7;
  if (!v7) {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo bundleID](self, "bundleID"));
  }
  [v11 setObject:v14 forKeyedSubscript:AVAssetDownloadSessionClientBundleIdentifierKey];
  if (!v7) {

  }
  if (([v8 allowsExpensiveNetworkAccess] & 1) == 0) {
    [v11 setObject:&__kCFBooleanFalse forKeyedSubscript:AVAssetDownloadSessionAllowsExpensiveNetworkAccessKey];
  }
  if (([v8 allowsConstrainedNetworkAccess] & 1) == 0) {
    [v11 setObject:&__kCFBooleanFalse forKeyedSubscript:AVAssetDownloadSessionAllowsConstrainedNetworkAccessKey];
  }
  id v15 = [v11 copy];
  -[__NSCFURLSessionTaskInfo setOptions:](self, "setOptions:", v15);

  v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( [v11 objectForKeyedSubscript:@"AVAssetDownloadTaskMinimumRequiredPresentationSizeKey"]);
  v17 = v16;
  if (v16 && CGSizeMakeWithDictionaryRepresentation(v16, &v25))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  &v25,  "{CGSize=dd}"));
    [v11 setObject:v18 forKeyedSubscript:@"AVAssetDownloadTaskMinimumRequiredPresentationSizeKey"];
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo uniqueIdentifier](self, "uniqueIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);
  [v11 setObject:v20 forKeyedSubscript:@"AVAssetDownloadSessionDebugIdentifierKey"];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo retryError](self, "retryError"));
  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo retryError](self, "retryError"));
    [v11 setObject:v22 forKeyedSubscript:@"AVAssetDownloadSessionRetryErrorKey"];
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo downloadConfig](self, "downloadConfig"));
  [v11 setObject:v23 forKeyedSubscript:@"AVAssetDownloadTaskDownloadConfigurationKey"];

  return v11;
}

@end