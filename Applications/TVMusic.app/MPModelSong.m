@interface MPModelSong
- (id)tvm_songWithLyrics:(id)a3;
- (id)tvm_songWithTTMLLyrics:(id)a3;
@end

@implementation MPModelSong

- (id)tvm_songWithTTMLLyrics:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelSong identifiers](self, "identifiers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000B9960;
  v9[3] = &unk_100269278;
  id v10 = v4;
  id v6 = v4;
  id v7 = -[MPModelSong copyWithIdentifiers:block:](self, "copyWithIdentifiers:block:", v5, v9);

  return v7;
}

- (id)tvm_songWithLyrics:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelSong identifiers](self, "identifiers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000B9B3C;
  v9[3] = &unk_100269278;
  id v10 = v4;
  id v6 = v4;
  id v7 = -[MPModelSong copyWithIdentifiers:block:](self, "copyWithIdentifiers:block:", v5, v9);

  return v7;
}

@end