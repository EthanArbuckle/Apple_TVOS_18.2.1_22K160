@interface VCPPhotosAssetProcessingTask
+ (id)taskWithProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 withProgressHandler:(id)a6 andCompletionHandler:(id)a7;
- (BOOL)run:(id *)a3;
- (VCPPhotosAssetProcessingTask)initWithProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 withProgressHandler:(id)a6 andCompletionHandler:(id)a7;
@end

@implementation VCPPhotosAssetProcessingTask

- (VCPPhotosAssetProcessingTask)initWithProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 withProgressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___VCPPhotosAssetProcessingTask;
  v16 = -[VCPPhotosAssetProcessingTask initWithCompletionHandler:](&v21, "initWithCompletionHandler:", a7);
  v17 = v16;
  if (v16)
  {
    v16->_processingTypes = a3;
    objc_storeStrong((id *)&v16->_localIdentifiers, a4);
    objc_storeStrong((id *)&v17->_photoLibraryURL, a5);
    id v18 = objc_retainBlock(v15);
    id progressHandler = v17->_progressHandler;
    v17->_id progressHandler = v18;
  }

  return v17;
}

+ (id)taskWithProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 withProgressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = [objc_alloc((Class)objc_opt_class(a1)) initWithProcessingTypes:a3 forAssetsWithLocalIdentifiers:v15 fromPhotoLibraryWithURL:v14 withProgressHandler:v13 andCompletionHandler:v12];

  return v16;
}

- (BOOL)run:(id *)a3
{
  uint64_t v5 = MediaAnalysisLogLevel(self, a2);
  if ((int)v5 >= 6)
  {
    uint64_t v7 = VCPLogInstance(v5, v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    os_log_type_t v9 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v8, v9))
    {
      unsigned int v10 = -[NSArray count](self->_localIdentifiers, "count");
      photoLibraryURL = self->_photoLibraryURL;
      *(_DWORD *)buf = 67109378;
      unsigned int v132 = v10;
      __int16 v133 = 2112;
      v134 = photoLibraryURL;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  v9,  "Performing on-demand processing for %d assets from %@",  buf,  0x12u);
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 photoLibraryWithURL:self->_photoLibraryURL]);

  BOOL v14 = v13 != 0LL;
  if (v13)
  {
    v102 = a3;
    unint64_t processingTypes = self->_processingTypes;
    double v16 = 0.0;
    if ((processingTypes & 1) != 0) {
      double v17 = 1.0;
    }
    else {
      double v17 = 0.0;
    }
    unint64_t v18 = self->_processingTypes & 2;
    if ((processingTypes & 2) != 0) {
      double v17 = v17 + 1.0;
    }
    if ((processingTypes & 8) != 0) {
      double v17 = v17 + 1.0;
    }
    if ((processingTypes & 0x10) != 0) {
      double v19 = v17 + 1.0;
    }
    else {
      double v19 = v17;
    }
    if ((processingTypes & 1) != 0)
    {
      context = objc_autoreleasePoolPush();
      v110[0] = _NSConcreteStackBlock;
      v110[1] = 3221225472LL;
      v110[2] = sub_1000D1DC4;
      v110[3] = &unk_1001BD230;
      v110[4] = self;
      *(double *)&v110[5] = 0.0 / v19;
      *(double *)&v110[6] = v19;
      v20 = objc_retainBlock(v110);
      objc_super v21 = objc_alloc(&OBJC_CLASS___VCPMADSceneAssetProcessingTask);
      localIdentifiers = self->_localIdentifiers;
      v23 = self->_photoLibraryURL;
      v109[0] = _NSConcreteStackBlock;
      v109[1] = 3221225472LL;
      v109[2] = sub_1000D1DEC;
      v109[3] = &unk_1001BCA48;
      v109[4] = self;
      v24 = -[VCPMADSceneAssetProcessingTask initWithLocalIdentifiers:fromPhotoLibraryWithURL:cancelBlock:progressHandler:completionHandler:]( v21,  "initWithLocalIdentifiers:fromPhotoLibraryWithURL:cancelBlock:progressHandler:completionHandler:",  localIdentifiers,  v23,  v109,  v20,  &stru_1001BD250);
      unsigned int v25 = -[VCPMADSceneAssetProcessingTask run](v24, "run");
      if (v25 == -128)
      {
        if (a3)
        {
          NSErrorUserInfoKey v127 = NSLocalizedDescriptionKey;
          v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Scene asset processing cancelled"));
          v128 = v26;
          v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v128,  &v127,  1LL));
          v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v27));
          id v29 = *a3;
          *a3 = v28;

          BOOL v14 = v13 != 0LL;
        }

        BOOL v30 = 0;
      }

      else
      {
        signed int v35 = v25;
        BOOL v30 = v25 == 0;
        if (a3 && v25)
        {
          NSErrorUserInfoKey v125 = NSLocalizedDescriptionKey;
          v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Scene asset processing failed"));
          v126 = v36;
          v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v126,  &v125,  1LL));
          uint64_t v38 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v35,  v37));
          id v39 = *v102;
          id *v102 = (id)v38;
        }

        if (v35) {
          double v16 = 0.0;
        }
        else {
          double v16 = 1.0;
        }
      }

      objc_autoreleasePoolPop(context);
      if (!v30) {
        goto LABEL_71;
      }
      a3 = v102;
      unint64_t processingTypes = self->_processingTypes;
      unint64_t v18 = processingTypes & 2;
    }

    if (v18)
    {
      contexta = objc_autoreleasePoolPush();
      v108[0] = _NSConcreteStackBlock;
      v108[1] = 3221225472LL;
      v108[2] = sub_1000D1DF8;
      v108[3] = &unk_1001BD230;
      v108[4] = self;
      *(double *)&v108[5] = v16 * 100.0 / v19;
      *(double *)&v108[6] = v19;
      v40 = objc_retainBlock(v108);
      v41 = objc_alloc(&OBJC_CLASS___VCPMADOCRAssetProcessingTask);
      v42 = self->_localIdentifiers;
      v43 = self->_photoLibraryURL;
      v107[0] = _NSConcreteStackBlock;
      v107[1] = 3221225472LL;
      v107[2] = sub_1000D1E20;
      v107[3] = &unk_1001BCA48;
      v107[4] = self;
      v44 = -[VCPMADPhotoAssetProcessingTask initWithLocalIdentifiers:fromPhotoLibraryWithURL:cancelBlock:progressHandler:completionHandler:]( v41,  "initWithLocalIdentifiers:fromPhotoLibraryWithURL:cancelBlock:progressHandler:completionHandler:",  v42,  v43,  v107,  v40,  &stru_1001BD270);
      unsigned int v45 = -[VCPMADOCRAssetProcessingTask run](v44, "run");
      if (v45 == -128)
      {
        if (a3)
        {
          NSErrorUserInfoKey v123 = NSLocalizedDescriptionKey;
          v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"OCR asset processing cancelled"));
          v124 = v46;
          BOOL v47 = v14;
          v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v124,  &v123,  1LL));
          v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v48));
          id v50 = *a3;
          *a3 = v49;

          BOOL v14 = v47;
        }

        BOOL v51 = 0;
      }

      else
      {
        signed int v52 = v45;
        BOOL v51 = v45 == 0;
        if (a3 && v45)
        {
          NSErrorUserInfoKey v121 = NSLocalizedDescriptionKey;
          v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"OCR asset processing failed"));
          v122 = v53;
          v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v122,  &v121,  1LL));
          uint64_t v55 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v52,  v54));
          id v56 = *v102;
          id *v102 = (id)v55;
        }

        if (!v52) {
          double v16 = v16 + 1.0;
        }
      }

      objc_autoreleasePoolPop(contexta);
      if (!v51) {
        goto LABEL_71;
      }
      a3 = v102;
      unint64_t processingTypes = self->_processingTypes;
    }

    if ((processingTypes & 8) != 0)
    {
      contextb = objc_autoreleasePoolPush();
      v106[0] = _NSConcreteStackBlock;
      v106[1] = 3221225472LL;
      v106[2] = sub_1000D1E2C;
      v106[3] = &unk_1001BD230;
      v106[4] = self;
      *(double *)&v106[5] = v16 * 100.0 / v19;
      *(double *)&v106[6] = v19;
      v57 = objc_retainBlock(v106);
      v58 = objc_alloc(&OBJC_CLASS___VCPMADQuickFaceIDAssetProcessingTask);
      v59 = self->_localIdentifiers;
      v60 = self->_photoLibraryURL;
      v105[0] = _NSConcreteStackBlock;
      v105[1] = 3221225472LL;
      v105[2] = sub_1000D1E54;
      v105[3] = &unk_1001BCA48;
      v105[4] = self;
      v61 = -[VCPMADQuickFaceIDAssetProcessingTask initWithLocalIdentifiers:fromPhotoLibraryWithURL:cancelBlock:progressHandler:completionHandler:]( v58,  "initWithLocalIdentifiers:fromPhotoLibraryWithURL:cancelBlock:progressHandler:completionHandler:",  v59,  v60,  v105,  v57,  &stru_1001BD290);
      unsigned int v62 = -[VCPMADQuickFaceIDAssetProcessingTask run](v61, "run");
      if (v62 == -128)
      {
        if (a3)
        {
          NSErrorUserInfoKey v119 = NSLocalizedDescriptionKey;
          v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Face asset processing cancelled"));
          v120 = v63;
          BOOL v64 = v14;
          v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v120,  &v119,  1LL));
          v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v65));
          id v67 = *a3;
          *a3 = v66;

          BOOL v14 = v64;
        }

        BOOL v68 = 0;
      }

      else
      {
        signed int v69 = v62;
        BOOL v68 = v62 == 0;
        if (a3 && v62)
        {
          NSErrorUserInfoKey v117 = NSLocalizedDescriptionKey;
          v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Face asset processing failed"));
          v118 = v70;
          v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v118,  &v117,  1LL));
          uint64_t v72 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v69,  v71));
          id v73 = *v102;
          id *v102 = (id)v72;
        }

        if (!v69) {
          double v16 = v16 + 1.0;
        }
      }

      objc_autoreleasePoolPop(contextb);
      if (!v68) {
        goto LABEL_71;
      }
      unint64_t processingTypes = self->_processingTypes;
    }

    if ((processingTypes & 0x10) == 0)
    {
LABEL_72:
      v31 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[VCPPhotosAssetProcessingTask completionHandler]( self,  "completionHandler"));
      v31[2](v31, 0LL, 0LL);
      goto LABEL_73;
    }

    v74 = objc_autoreleasePoolPush();
    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472LL;
    v104[2] = sub_1000D1E60;
    v104[3] = &unk_1001BD230;
    v104[4] = self;
    *(double *)&v104[5] = v16 * 100.0 / v19;
    *(double *)&v104[6] = v19;
    v75 = objc_retainBlock(v104);
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
    v77 = (void *)objc_claimAutoreleasedReturnValue([v76 photoLibraryWithURL:self->_photoLibraryURL]);

    if (v77)
    {
      v78 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADFullAssetProcessingTask taskWithPhotoLibrary:localIdentifiers:]( &OBJC_CLASS___VCPMADFullAssetProcessingTask,  "taskWithPhotoLibrary:localIdentifiers:",  v77,  self->_localIdentifiers));
      v103[0] = _NSConcreteStackBlock;
      v103[1] = 3221225472LL;
      v103[2] = sub_1000D1E88;
      v103[3] = &unk_1001BCA48;
      v103[4] = self;
      [v78 setCancel:v103];
      [v78 setProgressHandler:v75];
      [v78 start];
      if ([v78 error] == -128)
      {
        if (v102)
        {
          NSErrorUserInfoKey v113 = NSLocalizedDescriptionKey;
          v100 = v74;
          v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Full asset processing cancelled"));
          v114 = v79;
          BOOL v80 = v14;
          v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v114,  &v113,  1LL));
          uint64_t v82 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v81));
          id v83 = *v102;
          id *v102 = (id)v82;

          BOOL v14 = v80;
          v74 = v100;
        }

        BOOL v84 = 1;
      }

      else
      {
        v101 = v74;
        unsigned int v89 = [v78 error];
        signed int v90 = v89;
        if (v102 && v89)
        {
          NSErrorUserInfoKey v111 = NSLocalizedDescriptionKey;
          v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Full asset processing failed"));
          v112 = v91;
          v92 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v112,  &v111,  1LL));
          uint64_t v93 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v90,  v92));
          id v94 = *v102;
          id *v102 = (id)v93;
        }

        BOOL v84 = v90 != 0;
        v74 = v101;
      }
    }

    else
    {
      if (!v102)
      {
        BOOL v84 = 1;
        goto LABEL_70;
      }

      NSErrorUserInfoKey v115 = NSLocalizedDescriptionKey;
      BOOL v99 = v14;
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_photoLibraryURL, "path"));
      v85 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[OnDemandFull] Failed to open Photo Library (%@)",  v78));
      v116 = v85;
      BOOL v84 = 1;
      v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v116,  &v115,  1LL));
      uint64_t v87 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -23LL,  v86));
      id v88 = *v102;
      id *v102 = (id)v87;

      BOOL v14 = v99;
    }

LABEL_70:
    objc_autoreleasePoolPop(v74);
    if (v84) {
      goto LABEL_71;
    }
    goto LABEL_72;
  }

  if (a3)
  {
    NSErrorUserInfoKey v129 = NSLocalizedDescriptionKey;
    v31 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to open specified Photo Library (%@)",  self->_photoLibraryURL));
    v130 = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v130,  &v129,  1LL));
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v32));
    id v34 = *a3;
    *a3 = v33;

LABEL_73:
    goto LABEL_74;
  }

- (void).cxx_destruct
{
}

@end