@interface VCPPhotosFaceIdentificationTask
+ (id)taskWithFaceLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 withCompletionHandler:(id)a5;
- (BOOL)run:(id *)a3;
- (VCPPhotosFaceIdentificationTask)initWithFaceLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 withCompletionHandler:(id)a5;
- (void)_classifyPerson:(id)a3 usingModel:(id)a4 withResults:(id *)a5;
- (void)_classifyPet:(id)a3 usingModel:(id)a4 withResults:(id *)a5;
@end

@implementation VCPPhotosFaceIdentificationTask

- (VCPPhotosFaceIdentificationTask)initWithFaceLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 withCompletionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___VCPPhotosFaceIdentificationTask;
  v11 = -[VCPPhotosFaceIdentificationTask initWithCompletionHandler:](&v14, "initWithCompletionHandler:", a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_faceLocalIdentifiers, a3);
    objc_storeStrong((id *)&v12->_photoLibraryURL, a4);
  }

  return v12;
}

+ (id)taskWithFaceLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)objc_opt_class(a1)) initWithFaceLocalIdentifiers:v10 fromPhotoLibraryWithURL:v9 withCompletionHandler:v8];

  return v11;
}

- (void)_classifyPerson:(id)a3 usingModel:(id)a4 withResults:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v10 = MediaAnalysisLogLevel(v8, v9);
  if ((int)v10 >= 6)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v14 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v7 localIdentifier]);
      *(_DWORD *)buf = 138412290;
      v75 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[%@] Predicting person(s) from VIP model", buf, 0xCu);
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v7 faceClusteringProperties]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 faceprint]);

  if (v17)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v17 faceprintData]);
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceIDModel faceObservationFromFaceprintData:]( &OBJC_CLASS___VCPFaceIDModel,  "faceObservationFromFaceprintData:",  v20));

    if (!v21)
    {
      uint64_t v40 = MediaAnalysisLogLevel(v22, v23);
      if ((int)v40 < 4)
      {
LABEL_36:

        goto LABEL_37;
      }

      uint64_t v42 = VCPLogInstance(v40, v41);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      os_log_type_t v43 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v27, v43))
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue([v7 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        v75 = v44;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  v43,  "[%@] Failed to obtain face observation; skipping",
          buf,
          0xCu);
      }

- (void)_classifyPet:(id)a3 usingModel:(id)a4 withResults:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v10 = MediaAnalysisLogLevel(v8, v9);
  if ((int)v10 >= 6)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v14 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v7 localIdentifier]);
      *(_DWORD *)buf = 138412290;
      v77 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[%@] Predicting pet(s) from VIP model", buf, 0xCu);
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v7 faceClusteringProperties]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 faceprint]);

  if (v17)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v17 faceprintData]);
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceIDModel animalObservationFromAnimalprintData:]( &OBJC_CLASS___VCPFaceIDModel,  "animalObservationFromAnimalprintData:",  v20));

    if (!v21)
    {
      uint64_t v41 = MediaAnalysisLogLevel(v22, v23);
      if ((int)v41 < 4)
      {
LABEL_36:

        goto LABEL_37;
      }

      uint64_t v43 = VCPLogInstance(v41, v42);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      os_log_type_t v44 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v27, v44))
      {
        id v45 = (void *)objc_claimAutoreleasedReturnValue([v7 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        v77 = v45;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  v44,  "[%@] Failed to obtain pet observation; skipping",
          buf,
          0xCu);
      }

- (BOOL)run:(id *)a3
{
  uint64_t v5 = MediaAnalysisLogLevel(self, a2);
  if ((int)v5 >= 6)
  {
    uint64_t v7 = VCPLogInstance(v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    os_log_type_t v9 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v8, v9))
    {
      unsigned int v10 = -[NSArray count](self->_faceLocalIdentifiers, "count");
      photoLibraryURL = self->_photoLibraryURL;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v128 = v10;
      *(_WORD *)&v128[4] = 2112;
      *(void *)&v128[6] = photoLibraryURL;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  v9,  "Performing on-demand identification on %d faces from Photo Library (%@)",  buf,  0x12u);
    }
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 photoLibraryWithURL:self->_photoLibraryURL]);

  if (v13)
  {
    os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 librarySpecificFetchOptions]);
    uint64_t v124 = PHFacePropertySetClustering;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v124, 1LL));
    [v14 setFetchPropertySets:v15];

    [v14 setIncludedDetectionTypes:&off_1001C91C8];
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[PHFace fetchFacesWithLocalIdentifiers:options:]( &OBJC_CLASS___PHFace,  "fetchFacesWithLocalIdentifiers:options:",  self->_faceLocalIdentifiers,  v14));
    if (![v16 count])
    {
      if (!a3)
      {
        BOOL v46 = 0;
        goto LABEL_79;
      }

      NSErrorUserInfoKey v122 = NSLocalizedDescriptionKey;
      id v28 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Face fetch did not return any results"));
      id v123 = v28;
      uint64_t v36 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v123,  &v122,  1LL));
      id v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v36));
      BOOL v46 = 0;
      id v48 = *a3;
      *a3 = v47;
      goto LABEL_77;
    }

    id v17 = [v16 count];
    NSUInteger v18 = -[NSArray count](self->_faceLocalIdentifiers, "count");
    v108 = v16;
    if (v17 != (id)v18)
    {
      uint64_t v20 = MediaAnalysisLogLevel(v18, v19);
      if ((int)v20 >= 4)
      {
        uint64_t v22 = VCPLogInstance(v20, v21);
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        os_log_type_t v24 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v23, v24))
        {
          unsigned int v25 = [v16 count];
          unsigned int v26 = -[NSArray count](self->_faceLocalIdentifiers, "count");
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v128 = v25;
          *(_WORD *)&v128[4] = 1024;
          *(_DWORD *)&v128[6] = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "Face fetch count (%d) does not match requested (%d)",  buf,  0xEu);
        }
      }
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDefaultPhotoLibraryManager sharedManager]( &OBJC_CLASS___VCPDefaultPhotoLibraryManager,  "sharedManager"));
    id v28 = (id)objc_claimAutoreleasedReturnValue([v27 defaultPhotoLibrary]);

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "vcp_vipModelFilepathForVIPType:", 0));
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v31 = [v30 fileExistsAtPath:v29];

    if (v31)
    {
      id v34 = v28;
      uint64_t v35 = a3;
      id v116 = 0LL;
      uint64_t v36 = objc_claimAutoreleasedReturnValue( +[VCPFaceIDModel loadVIPModelAtPath:withVIPType:error:]( &OBJC_CLASS___VCPFaceIDModel,  "loadVIPModelAtPath:withVIPType:error:",  v29,  0LL,  &v116));
      uint64_t v37 = (os_log_s *)v116;
      os_log_type_t v39 = v37;
      if (!v36 || v37)
      {
        uint64_t v40 = MediaAnalysisLogLevel(v37, v38);
        if ((int)v40 >= 3)
        {
          uint64_t v42 = VCPLogInstance(v40, v41);
          uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          os_log_type_t v44 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v43, v44))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v128 = v39;
            _os_log_impl((void *)&_mh_execute_header, v43, v44, "Cannot load Person Identity Model - %@", buf, 0xCu);
          }
        }
      }
    }

    else
    {
      uint64_t v49 = MediaAnalysisLogLevel(v32, v33);
      if ((int)v49 < 5)
      {
        uint64_t v36 = 0LL;
        v16 = v108;
        float v53 = &ADClientSetValueForScalarKey_ptr;
LABEL_30:
        id v48 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "vcp_vipModelFilepathForVIPType:", 1));

        float v54 = (void *)objc_claimAutoreleasedReturnValue([v53[249] defaultManager]);
        unsigned int v55 = [v54 fileExistsAtPath:v48];

        v105 = v14;
        if (v55)
        {
          id v115 = 0LL;
          uint64_t v58 = objc_claimAutoreleasedReturnValue( +[VCPFaceIDModel loadVIPModelAtPath:withVIPType:error:]( &OBJC_CLASS___VCPFaceIDModel,  "loadVIPModelAtPath:withVIPType:error:",  v48,  1LL,  &v115));
          uint64_t v59 = (os_log_s *)v115;
          uint64_t v61 = v59;
          if (!v58 || v59)
          {
            uint64_t v62 = MediaAnalysisLogLevel(v59, v60);
            if ((int)v62 >= 3)
            {
              uint64_t v64 = VCPLogInstance(v62, v63);
              unsigned int v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
              os_log_type_t v66 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v65, v66))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v128 = v61;
                _os_log_impl((void *)&_mh_execute_header, v65, v66, "Cannot load Pet Identity Model - %@", buf, 0xCu);
              }

              v16 = v108;
            }
          }
        }

        else
        {
          uint64_t v67 = MediaAnalysisLogLevel(v56, v57);
          if ((int)v67 < 5)
          {
            uint64_t v58 = 0LL;
LABEL_43:
            if (v36 | v58)
            {
              id v103 = v48;
              v104 = v13;
              v101 = a3;
              id v102 = v28;
              __int128 v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
              __int128 v111 = 0u;
              __int128 v112 = 0u;
              __int128 v113 = 0u;
              __int128 v114 = 0u;
              id v72 = v16;
              id v73 = [v72 countByEnumeratingWithState:&v111 objects:v119 count:16];
              if (v73)
              {
                id v74 = v73;
                uint64_t v75 = *(void *)v112;
                v106 = v71;
                os_log_type_t type = VCPLogToOSLogType[5];
LABEL_46:
                uint64_t v76 = 0LL;
                while (1)
                {
                  if (*(void *)v112 != v75) {
                    objc_enumerationMutation(v72);
                  }
                  v77 = *(void **)(*((void *)&v111 + 1) + 8 * v76);
                  if (-[VCPPhotosFaceIdentificationTask isCanceled](self, "isCanceled"))
                  {
                    if (v101)
                    {
                      NSErrorUserInfoKey v117 = NSLocalizedDescriptionKey;
                      v96 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Face identification canceled"));
                      v118 = v96;
                      v97 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v118,  &v117,  1LL));
                      uint64_t v98 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v97));
                      id v99 = *v101;
                      id *v101 = (id)v98;
                    }

                    BOOL v46 = 0;
                    goto LABEL_74;
                  }

                  id v78 = [v77 detectionType];
                  if ((_DWORD)v78 == 1) {
                    break;
                  }
                  if (v58)
                  {
                    uint64_t v109 = 0LL;
                    v80 = (id *)&v109;
                    -[VCPPhotosFaceIdentificationTask _classifyPet:usingModel:withResults:]( self,  "_classifyPet:usingModel:withResults:",  v77,  v58,  &v109);
LABEL_55:
                    v81 = (os_log_s *)*v80;
                    if (v81)
                    {
                      v82 = v81;
                      v83 = (void *)objc_claimAutoreleasedReturnValue([v77 localIdentifier]);
                      [v71 setObject:v82 forKeyedSubscript:v83];

                      goto LABEL_65;
                    }

                    goto LABEL_66;
                  }

                  uint64_t v91 = MediaAnalysisLogLevel(v78, v79);
                  if ((int)v91 >= 5)
                  {
                    uint64_t v93 = VCPLogInstance(v91, v92);
                    v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
                    if (os_log_type_enabled(v82, type))
                    {
                      v87 = (void *)objc_claimAutoreleasedReturnValue([v77 localIdentifier]);
                      *(_DWORD *)buf = 138412290;
                      *(void *)v128 = v87;
                      v88 = v82;
                      os_log_type_t v89 = type;
                      v90 = "[%@] Skipped for Pet (no identity model)";
LABEL_63:
                      _os_log_impl((void *)&_mh_execute_header, v88, v89, v90, buf, 0xCu);
                    }

- (void).cxx_destruct
{
}

@end