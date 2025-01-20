@interface ACAccount
- (BOOL)_setAccountEnabled:(BOOL)a3 forDataclass:(id)a4 error:(id *)a5;
- (BOOL)tvp_isCPLEnabled;
- (BOOL)tvp_isMyPhotoStreamEnabled;
- (BOOL)tvp_isSharedAlbumsEnabled;
- (BOOL)tvp_setCPLEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)tvp_setMyPhotoStreamEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)tvp_setSharedAlbumsEnabled:(BOOL)a3 error:(id *)a4;
@end

@implementation ACAccount

- (BOOL)_setAccountEnabled:(BOOL)a3 forDataclass:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 1;
  if (-[ACAccount isEnabledForDataclass:](self, "isEnabledForDataclass:", v8) != v6)
  {
    -[ACAccount setEnabled:forDataclass:](self, "setEnabled:forDataclass:", v6, v8);
    dispatch_block_t v9 = dispatch_block_create((dispatch_block_flags_t)0LL, &stru_1000CC2E0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount accountStore](self, "accountStore"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000663A4;
    v14[3] = &unk_1000CC308;
    v16 = &v18;
    v17 = a5;
    id v11 = v9;
    id v15 = v11;
    [v10 saveAccount:self withCompletionHandler:v14];

    dispatch_block_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }

  char v12 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (BOOL)tvp_isMyPhotoStreamEnabled
{
  return -[ACAccount isEnabledForDataclass:]( self,  "isEnabledForDataclass:",  kAccountDataclassMediaStream);
}

- (BOOL)tvp_setMyPhotoStreamEnabled:(BOOL)a3 error:(id *)a4
{
  return -[ACAccount _setAccountEnabled:forDataclass:error:]( self,  "_setAccountEnabled:forDataclass:error:",  a3,  kAccountDataclassMediaStream,  a4);
}

- (BOOL)tvp_isSharedAlbumsEnabled
{
  return -[ACAccount isEnabledForDataclass:]( self,  "isEnabledForDataclass:",  kAccountDataclassSharedStreams);
}

- (BOOL)tvp_setSharedAlbumsEnabled:(BOOL)a3 error:(id *)a4
{
  return -[ACAccount _setAccountEnabled:forDataclass:error:]( self,  "_setAccountEnabled:forDataclass:error:",  a3,  kAccountDataclassSharedStreams,  a4);
}

- (BOOL)tvp_isCPLEnabled
{
  return -[ACAccount isEnabledForDataclass:]( self,  "isEnabledForDataclass:",  kAccountDataclassCloudPhotos);
}

- (BOOL)tvp_setCPLEnabled:(BOOL)a3 error:(id *)a4
{
  return -[ACAccount _setAccountEnabled:forDataclass:error:]( self,  "_setAccountEnabled:forDataclass:error:",  a3,  kAccountDataclassCloudPhotos,  a4);
}

@end