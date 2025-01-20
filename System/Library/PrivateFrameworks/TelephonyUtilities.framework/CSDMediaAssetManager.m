@interface CSDMediaAssetManager
- (void)saveLivePhotoWithPhotoURL:(id)a3 videoURL:(id)a4 completion:(id)a5;
- (void)saveVideoWithURL:(id)a3 completion:(id)a4;
@end

@implementation CSDMediaAssetManager

- (void)saveLivePhotoWithPhotoURL:(id)a3 videoURL:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_1001704C4();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "photoURL: %@ videoURL: %@", buf, 0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v25 = sub_1000A76A8;
  v26 = sub_1000A76B8;
  id v27 = 0LL;
  id v12 = objc_msgSend((id)CUTWeakLinkClass(@"PHPhotoLibrary", @"Photos"), "sharedPhotoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000A76C0;
  v20[3] = &unk_1003D9238;
  id v14 = v7;
  id v21 = v14;
  id v15 = v8;
  id v22 = v15;
  v23 = buf;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000A7778;
  v17[3] = &unk_1003D9260;
  v19 = buf;
  id v16 = v9;
  id v18 = v16;
  [v13 performChanges:v20 completionHandler:v17];

  _Block_object_dispose(buf, 8);
}

- (void)saveVideoWithURL:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (TUAllowLocalVideoRecording(v6))
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "saveVideoWithURL: %@", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x3032000000LL;
    v19 = sub_1000A76A8;
    v20 = sub_1000A76B8;
    id v21 = 0LL;
    id v9 = objc_msgSend((id)CUTWeakLinkClass(@"PHPhotoLibrary", @"PHPhotoLibrary"), "sharedPhotoLibrary");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000A7A5C;
    v14[3] = &unk_1003D9288;
    id v15 = v5;
    p___int128 buf = &buf;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000A7B00;
    v11[3] = &unk_1003D9260;
    v13 = &buf;
    id v12 = v6;
    [v10 performChanges:v14 completionHandler:v11];

    _Block_object_dispose(&buf, 8);
  }
}

@end