@interface TVHImageProxyLoader
- (TVHImageProxyLoaderDelegate)delegate;
- (TVImageProxy)imageProxy;
- (UIImage)image;
- (int64_t)state;
- (void)_notifyDelegate;
- (void)_startLoadingImageWithImageProxy:(id)a3 userInterfaceLayoutDirection:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageProxy:(id)a3;
- (void)setState:(int64_t)a3;
- (void)startLoadingImageProxy:(id)a3 userInterfaceLayoutDirection:(int64_t)a4;
- (void)stopLoadingAndReset;
@end

@implementation TVHImageProxyLoader

- (void)startLoadingImageProxy:(id)a3 userInterfaceLayoutDirection:(int64_t)a4
{
  id v7 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHImageProxyLoader imageProxy](self, "imageProxy"));

  if (v6 != v7)
  {
    -[TVHImageProxyLoader stopLoadingAndReset](self, "stopLoadingAndReset");
    -[TVHImageProxyLoader _startLoadingImageWithImageProxy:userInterfaceLayoutDirection:]( self,  "_startLoadingImageWithImageProxy:userInterfaceLayoutDirection:",  v7,  a4);
  }
}

- (void)stopLoadingAndReset
{
  if ((id)-[TVHImageProxyLoader state](self, "state") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHImageProxyLoader imageProxy](self, "imageProxy"));
    [v3 cancel];
  }

  -[TVHImageProxyLoader setState:](self, "setState:", 0LL);
  -[TVHImageProxyLoader setImageProxy:](self, "setImageProxy:", 0LL);
  -[TVHImageProxyLoader setImage:](self, "setImage:", 0LL);
}

- (void)_startLoadingImageWithImageProxy:(id)a3 userInterfaceLayoutDirection:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    [v6 setCacheOnLoad:1];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v7);
    v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472LL;
    v10 = sub_10005FC44;
    v11 = &unk_1000FE758;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v13, &from);
    [v7 setCompletionHandler:&v8];
    objc_msgSend(v7, "setImageDirection:", a4 == 1, v8, v9, v10, v11);
    -[TVHImageProxyLoader setState:](self, "setState:", 1LL);
    -[TVHImageProxyLoader setImageProxy:](self, "setImageProxy:", v7);
    [v7 load];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

- (void)_notifyDelegate
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHImageProxyLoader delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHImageProxyLoader image](self, "image"));
  [v4 imageProxyLoader:self loadHasCompletedWithImage:v3];
}

- (TVHImageProxyLoaderDelegate)delegate
{
  return (TVHImageProxyLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (TVImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (void)setImageProxy:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end