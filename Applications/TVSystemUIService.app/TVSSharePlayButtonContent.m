@interface TVSSharePlayButtonContent
- (BOOL)contentIsSelected;
- (TVSSFaceTimePlatterBackingStore)backingStore;
- (TVSSharePlayButtonContent)initWithBackingStore:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation TVSSharePlayButtonContent

- (TVSSharePlayButtonContent)initWithBackingStore:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v5 = v10;
  id v7 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"shareplay");
  id v6 = [location[0] joinedActivitySession];
  v10 = 0LL;
  v8.receiver = v5;
  v8.super_class = (Class)&OBJC_CLASS___TVSSharePlayButtonContent;
  v10 = -[TVSSharePlayButtonContent initWithTitle:image:text1:isSelected:]( &v8,  "initWithTitle:image:text1:isSelected:",  0LL,  v7,  0LL,  v6 != 0LL);
  objc_storeStrong((id *)&v10, v10);

  if (v10) {
    objc_storeStrong((id *)&v10->_backingStore, location[0]);
  }
  v4 = v10;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v4;
}

- (BOOL)contentIsSelected
{
  v2 = -[TVSSFaceTimePlatterBackingStore joinedActivitySession](self->_backingStore, "joinedActivitySession");
  BOOL v4 = v2 != 0LL;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TVSSharePlayButtonContent initWithBackingStore:]( +[TVSSharePlayButtonContent allocWithZone:](&OBJC_CLASS___TVSSharePlayButtonContent, "allocWithZone:", a3),  "initWithBackingStore:",  self->_backingStore);
}

- (TVSSFaceTimePlatterBackingStore)backingStore
{
  return self->_backingStore;
}

- (void).cxx_destruct
{
}

@end