@interface MTSetPlaybackQueueUtil
+ (BOOL)_setManifest:(id)a3 playerController:(id)a4 queueType:(int64_t)a5 startPlayback:(BOOL)a6 forceLocal:(BOOL)a7 reason:(unint64_t)a8 interactive:(BOOL)a9 completion:(id)a10;
+ (BOOL)_setPlaybackQueueForMyPodcastsWithOrder:(int64_t)a3 playerController:(id)a4 startPlayback:(BOOL)a5 forceLocal:(BOOL)a6 reason:(unint64_t)a7 interactive:(BOOL)a8 completion:(id)a9;
+ (BOOL)_setPlaybackQueueFromStoreForPodcastAdamId:(id)a3 playerController:(id)a4 siriAssetInfo:(id)a5 savePlayHistory:(BOOL)a6 playbackOrder:(int64_t)a7 startPlayback:(BOOL)a8 reason:(unint64_t)a9 interactive:(BOOL)a10 completion:(id)a11;
+ (BOOL)setAutoResumePlaybackQueueAndStartPlayback:(BOOL)a3 playerController:(id)a4 forceLocal:(BOOL)a5 reason:(unint64_t)a6 interactive:(BOOL)a7 completion:(id)a8;
+ (BOOL)setPlaybackQueueForRequest:(id)a3 playerController:(id)a4 siriAssetInfo:(id)a5 enqueuer:(id)a6 savePlayHistory:(BOOL)a7 startPlayback:(BOOL)a8 forceLocal:(BOOL)a9 isMagicMoment:(BOOL)a10 completion:(id)a11;
+ (BOOL)subscribeWithCommandURL:(id)a3 siriAssetInfo:(id)a4 requester:(id)a5 completion:(id)a6;
+ (id)queueCommandCustomStatusForRequestStatus:(int64_t)a3 queueType:(int64_t)a4;
+ (int64_t)_automaticCommandStatusForRequestStatus:(int64_t)a3;
+ (int64_t)queueCommandStatusForRequestStatus:(int64_t)a3 queueType:(int64_t)a4;
+ (int64_t)subscribeCommandStatusForErrorCode:(int64_t)a3;
@end

@implementation MTSetPlaybackQueueUtil

+ (BOOL)setPlaybackQueueForRequest:(id)a3 playerController:(id)a4 siriAssetInfo:(id)a5 enqueuer:(id)a6 savePlayHistory:(BOOL)a7 startPlayback:(BOOL)a8 forceLocal:(BOOL)a9 isMagicMoment:(BOOL)a10 completion:(id)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  id v16 = a3;
  id v17 = a4;
  id v91 = a5;
  id v18 = a6;
  id v19 = a11;
  id v20 = [v16 playQueueType];
  if (!v16 || !v20)
  {
    if (v19) {
      (*((void (**)(id, void, void))v19 + 2))(v19, 0LL, 0LL);
    }
    goto LABEL_10;
  }

  BOOL v89 = v11;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
  unsigned __int8 v22 = [v21 isReachable];

  if ((v22 & 1) == 0)
  {
    id v23 = +[PFClientUtil isRunningOnHomepod](&OBJC_CLASS___PFClientUtil, "isRunningOnHomepod");
    if ((_DWORD)v23)
    {
      uint64_t v25 = _MTLogCategoryPlayback(v23, v24);
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "No network connection for Homepod playback request.",  (uint8_t *)&buf,  2u);
      }

      (*((void (**)(id, uint64_t, void))v19 + 2))(v19, 11LL, 0LL);
LABEL_10:
      unsigned __int8 v27 = 0;
      goto LABEL_11;
    }
  }

  id v29 = +[PFClientUtil isRunningOnHomepod](&OBJC_CLASS___PFClientUtil, "isRunningOnHomepod");
  if (v18 && (_DWORD)v29)
  {
    uint64_t v30 = _MTLogCategoryMediaRemote(v29);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Overriding active account, enqueuer: %@",  (uint8_t *)&buf,  0xCu);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance"));
    [v32 setAccountOverride:v18];
  }

  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance"));
    [v33 setAccountOverride:0];
  }

  id v88 = [v16 playReason];
  if ([v16 playQueueType] != (id)1)
  {
    if ([v16 playQueueType] != (id)2)
    {
      if ([v16 playQueueType] != (id)3)
      {
        if (v19)
        {
          uint64_t v59 = (*((uint64_t (**)(id, void, void))v19 + 2))(v19, 0LL, 0LL);
          uint64_t v60 = _MTLogCategoryMediaRemote(v59);
          v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            v62 = (void *)objc_claimAutoreleasedReturnValue([v16 urlString]);
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v62;
            _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "Unexpected command: %@",  (uint8_t *)&buf,  0xCu);
          }
        }

        goto LABEL_10;
      }

      uint64_t v52 = _MTLogCategoryPlayback(3LL, v51);
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "setPlaybackQueueForRequest for type MTURLPlayCommandQueueTypeStation",  (uint8_t *)&buf,  2u);
      }

      v54 = (void *)objc_claimAutoreleasedReturnValue([v16 stationUuid]);
      v55 = (void *)objc_claimAutoreleasedReturnValue([v16 episodeUuid]);
      if (+[PFClientUtil isRunningOnHomepod](&OBJC_CLASS___PFClientUtil, "isRunningOnHomepod"))
      {
        v56 = -[MTNetworkMediaManifest initWithStationId:assetInfo:]( objc_alloc(&OBJC_CLASS___MTNetworkMediaManifest),  "initWithStationId:assetInfo:",  v54,  v91);
        -[MTPlayerManifest setNetworkUPPEnabled:](v56, "setNetworkUPPEnabled:", v12);
        uint64_t v57 = 8LL;
      }

      else
      {
        if (v55) {
          uint64_t v72 = objc_claimAutoreleasedReturnValue( +[MTPlaybackQueueFactory playStationUuid:episodeUuid:limit:]( &OBJC_CLASS___MTPlaybackQueueFactory,  "playStationUuid:episodeUuid:limit:",  v54,  v55,  0x7FFFFFFFFFFFFFFFLL));
        }
        else {
          uint64_t v72 = objc_claimAutoreleasedReturnValue( +[MTPlaybackQueueFactory playStationUuid:limit:]( &OBJC_CLASS___MTPlaybackQueueFactory,  "playStationUuid:limit:",  v54,  0x7FFFFFFFFFFFFFFFLL));
        }
        v56 = (MTNetworkMediaManifest *)v72;
        uint64_t v57 = 4LL;
      }

      if (a10)
      {
        v92[0] = _NSConcreteStackBlock;
        v92[1] = 3221225472LL;
        v92[2] = sub_1000578F8;
        v92[3] = &unk_100242010;
        v93 = v56;
        id v94 = v17;
        id v95 = v19;
        v79 = v56;
        [v94 setManifestAsDryRun:v79 reason:9 completion:v92];

        unsigned __int8 v27 = 1;
      }

      else
      {
        LOBYTE(v84) = 0;
        unsigned __int8 v27 = [a1 _setManifest:v56 playerController:v17 queueType:v57 startPlayback:v89 forceLocal:0 reason:v88 interactive:v84 completion:v19];
      }

      goto LABEL_11;
    }

    uint64_t v38 = _MTLogCategoryPlayback(2LL, v37);
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "setPlaybackQueueForRequest for type MTURLPlayCommandQueueTypePodcast",  (uint8_t *)&buf,  2u);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v137 = 0x3032000000LL;
    v138 = sub_10005765C;
    v139 = sub_10005766C;
    id v140 = (id)objc_claimAutoreleasedReturnValue([v16 podcastUuid]);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v16 episodeUuid]);
    uint64_t v129 = 0LL;
    v130 = &v129;
    uint64_t v131 = 0x3032000000LL;
    v132 = sub_10005765C;
    v133 = sub_10005766C;
    id v134 = (id)objc_claimAutoreleasedReturnValue([v16 podcastAdamId]);
    uint64_t v123 = 0LL;
    v124 = &v123;
    uint64_t v125 = 0x3032000000LL;
    v126 = sub_10005765C;
    v127 = sub_10005766C;
    id v128 = (id)objc_claimAutoreleasedReturnValue([v16 episodeAdamId]);
    id v86 = [v16 playbackOrder];
    uint64_t v119 = 0LL;
    v120 = &v119;
    uint64_t v121 = 0x2020000000LL;
    char v122 = 0;
    uint64_t v115 = 0LL;
    v116 = &v115;
    uint64_t v117 = 0x2020000000LL;
    char v118 = 0;
    uint64_t v111 = 0LL;
    v112 = &v111;
    uint64_t v113 = 0x2020000000LL;
    char v114 = 0;
    id v41 = [(id)v124[5] length];
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 mainOrPrivateContext]);

    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472LL;
    v101[2] = sub_100057674;
    v101[3] = &unk_100241FC0;
    id v44 = v43;
    id v102 = v44;
    id v45 = v40;
    id v103 = v45;
    p___int128 buf = &buf;
    v106 = &v119;
    v107 = &v115;
    v108 = &v129;
    v109 = &v111;
    v110 = &v123;
    id v104 = v16;
    id v46 = [v44 performBlockAndWait:v101];
    v87 = v44;
    if (*((_BYTE *)v120 + 24) || v41)
    {
      if (!*((_BYTE *)v120 + 24))
      {
LABEL_31:
        uint64_t v48 = _MTLogCategoryPlayback(v46, v47);
        v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v135 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "setPlaybackQueueForRequest using MAPI to get latest episode",  v135,  2u);
        }

        if ((v22 & 1) == 0)
        {
          uint64_t v69 = _MTLogCategoryPlayback(v46, v47);
          v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v135 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_ERROR,  "No network connection for playback request that needs the network.",  v135,  2u);
          }

          uint64_t v71 = 11LL;
          goto LABEL_67;
        }

        int v50 = 0;
LABEL_51:
        uint64_t v67 = _MTLogCategoryPlayback(v46, v47);
        v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v135 = 67109120;
          *(_DWORD *)&v135[4] = v50;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "playUsingDatabaseUuids -- %d", v135, 8u);
        }

        if (v50
          && (+[PFClientUtil isRunningOnHomepod](&OBJC_CLASS___PFClientUtil, "isRunningOnHomepod") & 1) == 0)
        {
          *(void *)v135 = 0LL;
          if (*((_BYTE *)v120 + 24)
            && (v76 = (void *)objc_claimAutoreleasedReturnValue( +[MTPlaybackQueueFactory playEpisodeUuid:context:limit:]( &OBJC_CLASS___MTPlaybackQueueFactory,  "playEpisodeUuid:context:limit:",  v45,  0LL,  0x7FFFFFFFFFFFFFFFLL))) != 0LL || (v76 = (void *)objc_claimAutoreleasedReturnValue( +[MTPlaybackQueueFactory playPodcastUuid:order:limit:error:]( &OBJC_CLASS___MTPlaybackQueueFactory,  "playPodcastUuid:order:limit:error:",  *(void *)(*((void *)&buf + 1) + 40LL),  v86,  0x7FFFFFFFFFFFFFFFLL,  v135)),  *(void *)v135 != 3LL))
          {
            if (a10)
            {
              v96[0] = _NSConcreteStackBlock;
              v96[1] = 3221225472LL;
              v96[2] = sub_100057880;
              v96[3] = &unk_100241FE8;
              id v78 = v76;
              id v97 = v78;
              id v98 = v17;
              id v99 = v19;
              uint64_t v100 = 2LL;
              [v98 setManifestAsDryRun:v78 reason:9 completion:v96];

              unsigned int v74 = 0;
              char v75 = 0;
LABEL_95:
              unsigned __int8 v27 = 1;
LABEL_96:

              _Block_object_dispose(&v111, 8);
              _Block_object_dispose(&v115, 8);
              _Block_object_dispose(&v119, 8);
              _Block_object_dispose(&v123, 8);

              _Block_object_dispose(&v129, 8);
              _Block_object_dispose(&buf, 8);

              if ((v75 & 1) != 0) {
                unsigned __int8 v27 = v74 != 0;
              }
              goto LABEL_11;
            }

            LOBYTE(v84) = 0;
            unsigned int v74 = [a1 _setManifest:v76 playerController:v17 queueType:2 startPlayback:v89 forceLocal:a9 reason:v88 interactive:v84 completion:v19];
          }

          else
          {
            if (v19) {
              (*((void (**)(id, uint64_t, uint64_t))v19 + 2))(v19, 4LL, 2LL);
            }
            unsigned int v74 = 0;
          }
        }

        else if ([(id)v124[5] length])
        {
          if (a10) {
            goto LABEL_65;
          }
          if (v12) {
            id v77 = +[PFClientUtil isRunningOnHomepod](&OBJC_CLASS___PFClientUtil, "isRunningOnHomepod");
          }
          else {
            id v77 = 0LL;
          }
          v80 = objc_alloc(&OBJC_CLASS___MTNetworkMediaManifest);
          v81 = -[MTNetworkMediaManifest initWithEpisodeAdamId:assetInfo:]( v80,  "initWithEpisodeAdamId:assetInfo:",  v124[5],  v91);
          -[MTPlayerManifest setNetworkUPPEnabled:](v81, "setNetworkUPPEnabled:", v77);
          LOBYTE(v84) = 0;
          unsigned int v74 = [a1 _setManifest:v81 playerController:v17 queueType:8 startPlayback:v89 forceLocal:a9 reason:v88 interactive:v84 completion:v19];
        }

        else if ([(id)v130[5] length])
        {
          if (a10)
          {
LABEL_65:
            v73 = (void *)objc_claimAutoreleasedReturnValue([v17 playbackQueueController]);
            [v73 setMagicMomentPlayerItem:0];

            if (!v19)
            {
LABEL_68:
              unsigned int v74 = 0;
              char v75 = 0;
              unsigned __int8 v27 = 0;
              goto LABEL_96;
            }

            uint64_t v71 = 1LL;
LABEL_67:
            (*((void (**)(id, uint64_t, void))v19 + 2))(v19, v71, 0LL);
            goto LABEL_68;
          }

          LOBYTE(v85) = 0;
          unsigned int v74 = [a1 _setPlaybackQueueFromStoreForPodcastAdamId:v130[5] playerController:v17 siriAssetInfo:v91 savePlayHistor y:v12 playbackOrder:v86 startPlayback:v89 reason:v88 interactive:v85 completion:v19];
        }

        else
        {
          uint64_t v82 = _MTLogCategoryDefault(0LL);
          v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
          if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v135 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_ERROR,  "Invalid queue component specification.",  v135,  2u);
          }

          if (v19) {
            (*((void (**)(id, void, void))v19 + 2))(v19, 0LL, 0LL);
          }
          unsigned int v74 = 0;
        }

        char v75 = 1;
        goto LABEL_95;
      }
    }

    else if (*((_BYTE *)v112 + 24) || !*((_BYTE *)v116 + 24))
    {
      goto LABEL_31;
    }

    int v50 = 1;
    goto LABEL_51;
  }

  uint64_t v35 = _MTLogCategoryPlayback(1LL, v34);
  v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "setPlaybackQueueForRequest for type MTURLPlayCommandQueueTypePodcasts",  (uint8_t *)&buf,  2u);
  }

  if (a10)
  {
    if (v19) {
      (*((void (**)(id, void, void))v19 + 2))(v19, 0LL, 0LL);
    }
    goto LABEL_10;
  }

  if (+[PFClientUtil isRunningOnHomepod](&OBJC_CLASS___PFClientUtil, "isRunningOnHomepod"))
  {
    v58 = -[MTNetworkMediaManifest initWithAssetInfo:]( objc_alloc(&OBJC_CLASS___MTNetworkMediaManifest),  "initWithAssetInfo:",  v91);
    -[MTPlayerManifest setNetworkUPPEnabled:](v58, "setNetworkUPPEnabled:", v12);
    LOBYTE(v84) = 0;
    unsigned __int8 v27 = [a1 _setManifest:v58 playerController:v17 queueType:8 startPlayback:v89 forceLocal:a9 reason:v88 interactive:v84 completion:v19];
  }

  else
  {
    id v63 = [v16 playbackOrder];
    uint64_t v65 = _MTLogCategoryPlayback(v63, v64);
    v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v63;
      _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "setPlaybackQueueForRequest with playback order: %ld",  (uint8_t *)&buf,  0xCu);
    }

    unsigned __int8 v27 = [a1 _setPlaybackQueueForMyPodcastsWithOrder:v63 playerController:v17 startPlayback:v89 forceLocal:a9 reason:v88 in teractive:0 completion:v19];
  }

+ (BOOL)subscribeWithCommandURL:(id)a3 siriAssetInfo:(id)a4 requester:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = (void (**)(id, void, uint64_t))a6;
  id v12 = a3;
  v13 = -[MTURLCommandRequest initWithURLString:]( objc_alloc(&OBJC_CLASS___MTURLCommandRequest),  "initWithURLString:",  v12);

  if ((id)-[MTURLCommandRequest commandType](v13, "commandType") == (id)1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTURLCommandRequest podcastAdamId](v13, "podcastAdamId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v14 longLongValue]));
    if (+[MTStoreIdentifier isEmptyNumber:](&OBJC_CLASS___MTStoreIdentifier, "isEmptyNumber:", v15))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTURLCommandRequest podcastFeedUrl](v13, "podcastFeedUrl"));
      id v17 = [v16 length];

      if (!v17)
      {
        if (v11) {
          v11[2](v11, 0LL, 2LL);
        }
        BOOL v19 = 0;
        goto LABEL_18;
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTURLCommandRequest podcastFeedUrl](v13, "podcastFeedUrl"));
      +[MTSubscribeUtil subscribeToPodcastWithFeedUrl:completion:]( &OBJC_CLASS___MTSubscribeUtil,  "subscribeToPodcastWithFeedUrl:completion:",  v18,  v11);
    }

    else
    {
      if (!+[PFClientUtil isRunningOnHomepod](&OBJC_CLASS___PFClientUtil, "isRunningOnHomepod"))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue( +[MTStoreManifest podcastStorePlatformDictionaryFromSiriAssetInfo:podcastAdamId:]( &OBJC_CLASS___MTStoreManifest,  "podcastStorePlatformDictionaryFromSiriAssetInfo:podcastAdamId:",  v9,  v15));
        BOOL v19 = v21 != 0LL;
        if (v21)
        {
          +[MTSubscribeUtil subscribeToPodcastWithStorePlatformDictionary:completion:]( &OBJC_CLASS___MTSubscribeUtil,  "subscribeToPodcastWithStorePlatformDictionary:completion:",  v21,  v11);
        }

        else
        {
          unsigned __int8 v22 = objc_alloc_init(&OBJC_CLASS___MTAddPodcastParams);
          -[MTAddPodcastParams setStoreCollectionId:](v22, "setStoreCollectionId:", [v14 longLongValue]);
          uint64_t v25 = _NSConcreteStackBlock;
          uint64_t v26 = 3221225472LL;
          unsigned __int8 v27 = sub_100057DBC;
          v28 = &unk_1002406E8;
          id v29 = v11;
          -[MTAddPodcastParams setCompletion:](v22, "setCompletion:", &v25);
          id v23 = (void *)objc_claimAutoreleasedReturnValue( +[MTSubscriptionManager sharedInstance]( &OBJC_CLASS___MTSubscriptionManager,  "sharedInstance",  v25,  v26,  v27,  v28));
          [v23 subscribeToPodcastWithParams:v22];
        }

        goto LABEL_18;
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[MTSubscriptionController sharedInstance]( &OBJC_CLASS___MTSubscriptionController,  "sharedInstance"));
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_100057C50;
      v30[3] = &unk_100241DD8;
      v31 = v11;
      [v20 subscribeToShowWithPodcastStoreId:v14 account:v10 completion:v30];
    }

    BOOL v19 = 1;
LABEL_18:

    goto LABEL_19;
  }

  if (v11) {
    v11[2](v11, 0LL, 2LL);
  }
  BOOL v19 = 0;
LABEL_19:

  return v19;
}

+ (BOOL)setAutoResumePlaybackQueueAndStartPlayback:(BOOL)a3 playerController:(id)a4 forceLocal:(BOOL)a5 reason:(unint64_t)a6 interactive:(BOOL)a7 completion:(id)a8
{
  return [a1 _setPlaybackQueueForMyPodcastsWithOrder:0 playerController:a4 startPlayback:a3 forceLocal:a5 reason:a6 int eractive:a7 completion:a8];
}

+ (int64_t)queueCommandStatusForRequestStatus:(int64_t)a3 queueType:(int64_t)a4
{
  else {
    return qword_1001C3610[a3];
  }
}

+ (id)queueCommandCustomStatusForRequestStatus:(int64_t)a3 queueType:(int64_t)a4
{
  if (a3 == 11)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MTSetPlaybackQueueUtilErrorDomain",  -433001LL,  0LL));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[MPRemoteCommandStatus statusWithCode:error:]( &OBJC_CLASS___MPRemoteCommandStatus,  "statusWithCode:error:",  200LL,  v4));
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[MPRemoteCommandStatus statusWithCode:]( &OBJC_CLASS___MPRemoteCommandStatus,  "statusWithCode:",  +[MTSetPlaybackQueueUtil queueCommandStatusForRequestStatus:queueType:]( &OBJC_CLASS___MTSetPlaybackQueueUtil,  "queueCommandStatusForRequestStatus:queueType:",  a3,  a4)));
  }

  return v5;
}

+ (int64_t)subscribeCommandStatusForErrorCode:(int64_t)a3
{
  else {
    return qword_1001C3660[a3];
  }
}

+ (BOOL)_setPlaybackQueueForMyPodcastsWithOrder:(int64_t)a3 playerController:(id)a4 startPlayback:(BOOL)a5 forceLocal:(BOOL)a6 reason:(unint64_t)a7 interactive:(BOOL)a8 completion:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v15 = a4;
  id v16 = a9;
  if (a3)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[MTPlaybackQueueFactory playMyPodcastsWithOrder:]( &OBJC_CLASS___MTPlaybackQueueFactory,  "playMyPodcastsWithOrder:",  a3));
    LOBYTE(v20) = a8;
    unsigned __int8 v18 = [a1 _setManifest:v17 playerController:v15 queueType:1 startPlayback:v12 forceLocal:v11 reason:a7 interactive:v20 completion:v16];
  }

  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100058020;
    v21[3] = &unk_100242038;
    id v22 = v15;
    BOOL v27 = v12;
    id v23 = v16;
    uint64_t v24 = 0LL;
    BOOL v28 = v11;
    id v25 = a1;
    unint64_t v26 = a7;
    BOOL v29 = a8;
    [v22 restorePlayerManifestWithCompletion:v21];

    unsigned __int8 v18 = 1;
  }

  return v18;
}

+ (BOOL)_setManifest:(id)a3 playerController:(id)a4 queueType:(int64_t)a5 startPlayback:(BOOL)a6 forceLocal:(BOOL)a7 reason:(unint64_t)a8 interactive:(BOOL)a9 completion:(id)a10
{
  BOOL v11 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a10;
  id v17 = v16;
  if (v14)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000582F8;
    v19[3] = &unk_100241E00;
    id v20 = v16;
    int64_t v21 = a5;
    [v15 setManifest:v14 startPlayback:v11 forceLocal:0 reason:a8 interactive:a9 completion:v19];
  }

  else if (v16)
  {
    (*((void (**)(id, uint64_t, int64_t))v16 + 2))(v16, 3LL, a5);
  }

  return v14 != 0LL;
}

+ (BOOL)_setPlaybackQueueFromStoreForPodcastAdamId:(id)a3 playerController:(id)a4 siriAssetInfo:(id)a5 savePlayHistory:(BOOL)a6 playbackOrder:(int64_t)a7 startPlayback:(BOOL)a8 reason:(unint64_t)a9 interactive:(BOOL)a10 completion:(id)a11
{
  BOOL v30 = a8;
  BOOL v28 = a6;
  id v14 = a3;
  id v15 = a5;
  id v16 = a11;
  id v17 = a4;
  id v18 = [v14 longLongValue];
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v18));
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[MTStoreManifest podcastStorePlatformDictionaryFromSiriAssetInfo:podcastAdamId:]( &OBJC_CLASS___MTStoreManifest,  "podcastStorePlatformDictionaryFromSiriAssetInfo:podcastAdamId:",  v15,  v19));

  if (v20)
  {
    int64_t v21 = objc_alloc(&OBJC_CLASS___MTStoreManifest);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v18));
    id v23 = -[MTStoreManifest initWithPodcastAdamId:siriAssetInfo:oldestEpisode:initiatedByAnotherUser:]( v21,  "initWithPodcastAdamId:siriAssetInfo:oldestEpisode:initiatedByAnotherUser:",  v22,  v15,  a7 == 2,  0LL);

    uint64_t v24 = 3LL;
  }

  else
  {
    id v23 = -[MTNetworkMediaManifest initWithPodcastAdamId:assetInfo:]( objc_alloc(&OBJC_CLASS___MTNetworkMediaManifest),  "initWithPodcastAdamId:assetInfo:",  v14,  v15);
    -[MTPlayerManifest setNetworkUPPEnabled:](v23, "setNetworkUPPEnabled:", v28);
    uint64_t v24 = 8LL;
  }

  LOBYTE(v27) = a10;
  unsigned __int8 v25 = [a1 _setManifest:v23 playerController:v17 queueType:v24 startPlayback:v30 forceLocal:0 reason:a9 interactive:v27 completion:v16];

  return v25;
}

+ (int64_t)_automaticCommandStatusForRequestStatus:(int64_t)a3
{
  if (a3 == 4) {
    return 110LL;
  }
  else {
    return -1LL;
  }
}

@end