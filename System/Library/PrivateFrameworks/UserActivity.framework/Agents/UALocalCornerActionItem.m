@interface UALocalCornerActionItem
- (UALocalCornerActionItem)initWithUUID:(id)a3 type:(unint64_t)a4 options:(id)a5 originatingClient:(id)a6;
- (UAUserActivityClientProcess)originatingClient;
- (void)setOriginatingClient:(id)a3;
@end

@implementation UALocalCornerActionItem

- (UALocalCornerActionItem)initWithUUID:(id)a3 type:(unint64_t)a4 options:(id)a5 originatingClient:(id)a6
{
  id v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___UALocalCornerActionItem;
  v11 = -[UALocalCornerActionItem initWithUUID:type:options:](&v14, "initWithUUID:type:options:", a3, a4, a5);
  v12 = v11;
  if (v11) {
    objc_storeWeak((id *)&v11->_originatingClient, v10);
  }

  return v12;
}

- (UAUserActivityClientProcess)originatingClient
{
  return (UAUserActivityClientProcess *)objc_loadWeakRetained((id *)&self->_originatingClient);
}

- (void)setOriginatingClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end