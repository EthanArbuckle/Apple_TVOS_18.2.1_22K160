@interface MTDownloadsGateway
+ (MTDownloadsGatewayProtocol)shared;
@end

@implementation MTDownloadsGateway

+ (MTDownloadsGatewayProtocol)shared
{
  if (qword_1002B6B68 != -1) {
    dispatch_once(&qword_1002B6B68, &stru_100244600);
  }
  return (MTDownloadsGatewayProtocol *)(id)qword_1002B6B60;
}

@end