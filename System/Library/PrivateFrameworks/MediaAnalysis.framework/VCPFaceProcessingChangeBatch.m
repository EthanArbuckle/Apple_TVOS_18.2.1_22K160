@interface VCPFaceProcessingChangeBatch
+ (id)batchForPhotoLibrary:(id)a3 faceClusterer:(id)a4 andContext:(id)a5;
- (BOOL)publishWithError:(id *)a3;
- (VCPFaceProcessingChangeBatch)initWithPhotoLibrary:(id)a3 faceClusterer:(id)a4 andContext:(id)a5;
- (int)updateAsset:(id)a3 withAnalysis:(id)a4;
- (void)_publishPendingChanges;
@end

@implementation VCPFaceProcessingChangeBatch

- (VCPFaceProcessingChangeBatch)initWithPhotoLibrary:(id)a3 faceClusterer:(id)a4 andContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___VCPFaceProcessingChangeBatch;
    v12 = -[VCPFaceProcessingChangeBatch init](&v20, "init");
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_photoLibrary, a3);
      objc_storeStrong((id *)&v13->_clusterer, a4);
      objc_storeStrong((id *)&v13->_context, a5);
      uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      pendingChanges = v13->_pendingChanges;
      v13->_pendingChanges = (NSMutableArray *)v14;

      dispatch_queue_t v16 = dispatch_queue_create("com.apple.mediaanalysisd.VCPFaceProcessingChangeBatch", 0LL);
      publishQueue = v13->_publishQueue;
      v13->_publishQueue = (OS_dispatch_queue *)v16;
    }

    self = v13;
    v18 = self;
  }

  else
  {
    v18 = 0LL;
  }

  return v18;
}

+ (id)batchForPhotoLibrary:(id)a3 faceClusterer:(id)a4 andContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibrary:v8 faceClusterer:v9 andContext:v10];

  return v11;
}

- (int)updateAsset:(id)a3 withAnalysis:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = objc_msgSend(v7, "vcp_version");
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 photoLibrary]);
  unsigned int v10 = objc_msgSend(v9, "mad_faceProcessingInternalVersion");

  if (v8 == v10 && (objc_msgSend(v7, "vcp_types") & 4) != 0)
  {
    pendingChanges = self->_pendingChanges;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vcp_results"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceProcessingChangeEntry entryWithAsset:andAnalysis:]( &OBJC_CLASS___VCPFaceProcessingChangeEntry,  "entryWithAsset:andAnalysis:",  v6,  v12));
    -[NSMutableArray addObject:](pendingChanges, "addObject:", v13);
  }

  return 0;
}

- (void)_publishPendingChanges
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v3 = self->_pendingChanges;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)v6);
        id v11 = 0LL;
        objc_msgSend( v7,  "publish:scheduleTorsoOnlyPHFace:",  &v11,  -[VCPPhotosFaceProcessingContext clusterIncludeTorsoOnlyFaces](self->_context, "clusterIncludeTorsoOnlyFaces"));
        id v8 = v11;
        if ((-[PHPhotoLibrary vcp_isSyndicationLibrary](self->_photoLibrary, "vcp_isSyndicationLibrary") & 1) == 0)
        {
          clusterer = self->_clusterer;
          unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
          -[VCPFaceClusterer scheduleClusteringOfFacesWithLocalIdentifiers:]( clusterer,  "scheduleClusteringOfFacesWithLocalIdentifiers:",  v10);
        }

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v4);
  }
}

- (BOOL)publishWithError:(id *)a3
{
  uint64_t v15 = 0LL;
  dispatch_queue_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  uint64_t v5 = MediaAnalysisLogLevel(self, a2);
  if ((int)v5 >= 5)
  {
    uint64_t v7 = VCPLogInstance(v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    os_log_type_t v9 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = -[NSMutableArray count](self->_pendingChanges, "count");
      *(_DWORD *)buf = 134217984;
      id v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  v9,  "  Publishing PHAssetPropertySetFaceAnalysis for %lu assets",  buf,  0xCu);
    }
  }

  publishQueue = (dispatch_queue_s *)self->_publishQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AE524;
  block[3] = &unk_1001BCA98;
  block[4] = self;
  block[5] = &v15;
  block[6] = a3;
  dispatch_sync(publishQueue, block);
  char v12 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v12;
}

- (void).cxx_destruct
{
}

@end