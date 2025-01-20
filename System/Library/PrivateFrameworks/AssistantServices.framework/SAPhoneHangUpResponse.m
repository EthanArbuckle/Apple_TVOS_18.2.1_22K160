@interface SAPhoneHangUpResponse
- (int64_t)resultCallbackCode;
@end

@implementation SAPhoneHangUpResponse

- (int64_t)resultCallbackCode
{
  if ((-[SAPhoneHangUpResponse activeCallRemaining](self, "activeCallRemaining") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAPhoneHangUpResponse phoneHangUpCallType](self, "phoneHangUpCallType"));
    if ([v4 isEqualToString:SAPhoneHangUpCallTypeACTIVEValue])
    {
      v5 = (int64_t *)&SAPhoneActiveCallHungUpErrorCode;
    }

    else if ([v4 isEqualToString:SAPhoneHangUpCallTypeINCOMINGValue])
    {
      v5 = (int64_t *)&SAPhoneIncomingCallDeclinedErrorCode;
    }

    else
    {
      if (![v4 isEqualToString:SAPhoneHangUpCallTypeOUTGOINGValue])
      {
        else {
          int64_t v3 = 0LL;
        }
        goto LABEL_10;
      }

      v5 = (int64_t *)&SAPhoneOutgoingCallHungUpErrorCode;
    }

    int64_t v3 = *v5;
LABEL_10:

    return v3;
  }

  return 0LL;
}

@end