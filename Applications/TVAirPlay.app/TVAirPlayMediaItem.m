@interface TVAirPlayMediaItem
+ (id)sslPropertiesForIdentity:(id)a3 psk:(id)a4;
- (BOOL)hasTrait:(id)a3;
- (TVAirPlayResourceLoadingMediaItemDelegate)resourceLoadingDelegate;
- (void)loadStreamingKeyForRequest:(id)a3;
- (void)setResourceLoadingDelegate:(id)a3;
@end

@implementation TVAirPlayMediaItem

- (void)loadStreamingKeyForRequest:(id)a3
{
  p_resourceLoadingDelegate = &self->_resourceLoadingDelegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_resourceLoadingDelegate);
  sub_100017A3C(v5, self, WeakRetained);
}

- (BOOL)hasTrait:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:TVPMediaItemTraitAirPlayedContent])
  {
    BOOL v5 = 1;
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___TVAirPlayMediaItem;
    BOOL v5 = -[TVAirPlayMediaItem hasTrait:](&v7, "hasTrait:", v4);
  }

  return v5;
}

+ (id)sslPropertiesForIdentity:(id)a3 psk:(id)a4
{
  id v4 = 0LL;
  if (a3 && a4)
  {
    __int16 v10 = 174;
    id v6 = a4;
    id v7 = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v10, 2LL));
    v11[0] = kCFStreamSSLPSKIdentity;
    v11[1] = kCFStreamSSLPSKSharedSecret;
    v12[0] = v7;
    v12[1] = v6;
    v11[2] = kCFStreamSSLEnabledCiphers;
    v12[2] = v8;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  3LL));
  }

  return v4;
}

- (TVAirPlayResourceLoadingMediaItemDelegate)resourceLoadingDelegate
{
  return (TVAirPlayResourceLoadingMediaItemDelegate *)objc_loadWeakRetained((id *)&self->_resourceLoadingDelegate);
}

- (void)setResourceLoadingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end