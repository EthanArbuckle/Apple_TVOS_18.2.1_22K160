@interface QOSMetrics
+ (BOOL)shouldCollectMetrics;
- (_TtC9appstored10QOSMetrics)init;
@end

@implementation QOSMetrics

+ (BOOL)shouldCollectMetrics
{
  return sub_10006D9EC();
}

- (_TtC9appstored10QOSMetrics)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for QOSMetrics();
  return -[QOSMetrics init](&v3, "init");
}

@end