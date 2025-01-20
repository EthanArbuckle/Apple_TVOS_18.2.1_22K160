@interface MCClientTypeLoaders
+ (id)clientTypeLoaders;
@end

@implementation MCClientTypeLoaders

+ (id)clientTypeLoaders
{
  if (qword_1000DC180 != -1) {
    dispatch_once(&qword_1000DC180, &stru_1000C3BB8);
  }
  return [(id)qword_1000DC178 copy];
}

@end