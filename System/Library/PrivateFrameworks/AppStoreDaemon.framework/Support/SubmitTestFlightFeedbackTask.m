@interface SubmitTestFlightFeedbackTask
- (void)main;
@end

@implementation SubmitTestFlightFeedbackTask

- (void)main
{
  if (self)
  {
    id v3 = *(id *)&self->super.super._success;
    v4 = v3;
    if (v3) {
      v5 = (void *)*((void *)v3 + 5);
    }
    else {
      v5 = 0LL;
    }
    id v6 = v5;

    v7 = objc_opt_new(&OBJC_CLASS___TFUploadFeedbackRequest);
    id v8 = *(id *)&self->super.super._success;
    id v9 = sub_1001B0354(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = [v10 unsignedLongLongValue];
    if (v7)
    {
      *(_BYTE *)&v7->_has |= 2u;
      v7->_dsid = (unint64_t)v11;
    }

    id v12 = [v6 timestamp];
    if (v7)
    {
      *(_BYTE *)&v7->_has |= 4u;
      v7->_posixTimestampMillis = (unint64_t)v12;
    }

    v13 = objc_opt_new(&OBJC_CLASS___TFFeedback);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 email]);
    sub_1001DAC0C((uint64_t)v13, v14);

    __int128 v92 = 0u;
    __int128 v93 = 0u;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    v15 = (_TtC9appstored6LogKey *)*(id *)&self->super.super._success;
    id v17 = sub_1001B0444(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    id v19 = [v18 countByEnumeratingWithState:&v90 objects:v94 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v91;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v91 != v21) {
            objc_enumerationMutation(v18);
          }
          sub_1001DA588((uint64_t)v13, *(void **)(*((void *)&v90 + 1) + 8LL * (void)i));
        }

        id v20 = [v18 countByEnumeratingWithState:&v90 objects:v94 count:16];
      }

      while (v20);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue([v6 comments]);
    sub_1001DAC24((uint64_t)v13, v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue([v6 incidentID]);
    sub_1001DAC3C((uint64_t)v13, v24);

    sub_100287ED0((uint64_t)v7, v13);
    v25 = objc_opt_new(&OBJC_CLASS___TFApplication);
    id v26 = *(id *)&self->super.super._success;
    id v27 = sub_1001B060C(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    id v29 = [v28 unsignedLongLongValue];
    if (v25)
    {
      *(_BYTE *)&v25->_has |= 1u;
      v25->_applicationAdamId = (unint64_t)v29;
    }

    id v30 = *(id *)&self->super.super._success;
    v31 = v30;
    if (v30) {
      LOBYTE(v30) = sub_1001E2598(v30, (uint64_t)@"is_app_clip");
    }
    if (v25)
    {
      *(_BYTE *)&v25->_has |= 8u;
      v25->_isAppClip = (char)v30;
    }

    id v32 = *(id *)&self->super.super._success;
    id v33 = sub_1001B03B8(v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

    if (v34) {
      sub_100325524((uint64_t)v25, v34);
    }
    id v35 = *(id *)&self->super.super._success;
    v36 = v35;
    v86 = v34;
    if (v35) {
      v37 = (void *)*((void *)v35 + 4);
    }
    else {
      v37 = 0LL;
    }
    id v38 = v37;

    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 bundleID]);
    sub_1003254DC((uint64_t)v25, v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue([v38 bundleVersion]);
    sub_10032550C((uint64_t)v25, v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue([v38 shortVersion]);
    sub_1003254F4((uint64_t)v25, v41);

    id v42 = [v38 platform];
    if (v25)
    {
      if (v42 == (id)2) {
        int v43 = 3;
      }
      else {
        int v43 = 1;
      }
      if (v42 == (id)1) {
        int v43 = 2;
      }
      *(_BYTE *)&v25->_has |= 4u;
      v25->_platform = v43;
      id v44 = [v6 appUptime];
      *(_BYTE *)&v25->_has |= 2u;
      v25->_uptimeMillis = (unint64_t)v44;
    }

    else
    {
      [v6 appUptime];
    }

    sub_100287EE8((uint64_t)v7, v25);
    v45 = objc_opt_new(&OBJC_CLASS___TFDevice);
    v46 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceType]);
    sub_1002D0F30((uint64_t)v45, v46);

    v47 = (void *)objc_claimAutoreleasedReturnValue([v6 osVersion]);
    sub_1002D0F48((uint64_t)v45, v47);

    v48 = (void *)objc_claimAutoreleasedReturnValue([v6 architecture]);
    sub_1002D0F60((uint64_t)v45, v48);

    v49 = (void *)objc_claimAutoreleasedReturnValue([v6 locale]);
    sub_1002D0F90((uint64_t)v45, v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue([v6 timeZone]);
    sub_1002D0FA8((uint64_t)v45, v50);

    v51 = (void *)objc_claimAutoreleasedReturnValue([v6 carrier]);
    sub_1002D0FC0((uint64_t)v45, v51);

    v52 = (void *)objc_claimAutoreleasedReturnValue([v6 cellularNetworkType]);
    sub_1002D0FD8((uint64_t)v45, v52);

    id v53 = (id)objc_claimAutoreleasedReturnValue([v6 networkConnectionType]);
    if ([v53 isEqualToString:@"WI_FI"])
    {
      int v54 = 0;
    }

    else if ([v53 isEqualToString:@"MOBILE_DATA"])
    {
      int v54 = 1;
    }

    else if ([v53 isEqualToString:@"WIRE"])
    {
      int v54 = 2;
    }

    else if ([v53 isEqualToString:@"NONE"])
    {
      int v54 = 3;
    }

    else
    {
      int v54 = 0;
    }

    if (v45)
    {
      *(_BYTE *)&v45->_has |= 2u;
      v45->_connection = v54;

      unsigned int v55 = [v6 batteryPercentage];
      *(_BYTE *)&v45->_has |= 1u;
      v45->_batteryPercentage = v55;
    }

    else
    {

      [v6 batteryPercentage];
    }

    if ((+[AMSDevice deviceIsiPod](&OBJC_CLASS___AMSDevice, "deviceIsiPod") & 1) != 0)
    {
      int v56 = 2;
    }

    else if ((+[AMSDevice deviceIsiPad](&OBJC_CLASS___AMSDevice, "deviceIsiPad") & 1) != 0)
    {
      int v56 = 3;
    }

    else if ((+[AMSDevice deviceIsAppleTV](&OBJC_CLASS___AMSDevice, "deviceIsAppleTV") & 1) != 0)
    {
      int v56 = 4;
    }

    else if ((+[AMSDevice deviceIsAppleWatch](&OBJC_CLASS___AMSDevice, "deviceIsAppleWatch") & 1) != 0)
    {
      int v56 = 5;
    }

    else if (+[AMSDevice deviceIsMac](&OBJC_CLASS___AMSDevice, "deviceIsMac"))
    {
      int v56 = 6;
    }

    else
    {
      int v56 = 1;
    }

    if (v45)
    {
      *(_BYTE *)&v45->_has |= 4u;
      v45->_deviceFamily = v56;
      *(_BYTE *)&v45->_has |= 8u;
      v45->_devicePlatform = 3;
    }

    v57 = objc_opt_new(&OBJC_CLASS___TFDisplay);
    unsigned int v58 = [v6 screenWidth];
    if (v57)
    {
      *(_BYTE *)&v57->_has |= 2u;
      v57->_widthPixels = v58;
      unsigned int v59 = [v6 screenHeight];
      *(_BYTE *)&v57->_has |= 1u;
      v57->_heightPixels = v59;
    }

    else
    {
      [v6 screenHeight];
    }

    sub_1002D0F78((uint64_t)v45, v57);
    v60 = objc_opt_new(&OBJC_CLASS___TFMemoryUsage);
    id v61 = [v6 diskAvailable];
    if (v60)
    {
      *(_BYTE *)&v60->_has |= 1u;
      v60->_availableBytes = (unint64_t)v61;
      id v62 = [v6 diskTotal];
      *(_BYTE *)&v60->_has |= 2u;
      v60->_totalBytes = (unint64_t)v62;
    }

    else
    {
      [v6 diskTotal];
    }

    sub_1002D0FF0((uint64_t)v45, v60);
    sub_100287F00((uint64_t)v7, v45);
    uint64_t v63 = objc_claimAutoreleasedReturnValue([v6 pairedWatchOSVersion]);
    if (v63)
    {
      v64 = (void *)v63;
      v65 = (void *)objc_claimAutoreleasedReturnValue([v6 pairedWatchModel]);

      if (v65)
      {
        v66 = objc_opt_new(&OBJC_CLASS___TFAppleWatch);
        v67 = (void *)objc_claimAutoreleasedReturnValue([v6 pairedWatchModel]);
        sub_1002A2054((uint64_t)v66, v67);

        v68 = (void *)objc_claimAutoreleasedReturnValue([v6 pairedWatchOSVersion]);
        sub_1002A206C((uint64_t)v66, v68);

        sub_100287F18((uint64_t)v7, v66);
      }
    }
  }

  else
  {
    v7 = 0LL;
  }

  id v69 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
  id v89 = 0LL;
  id v71 = sub_100255E30((uint64_t)v70, (uint64_t)@"testflight-visual-feedback/upload-feedback-url", &v89);
  v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
  id v73 = v89;

  if (v73)
  {
    id v74 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find URL for feedback upload: %@",  v73));
    uint64_t v75 = ASDErrorWithDescription(ASDErrorDomain, 850LL, v74);
    v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
    -[Task completeWithError:](self, "completeWithError:", v76);
    v77 = v72;
  }

  else
  {
    v78 = sub_100260028((id *)&self->super.super.super.super.isa, v72);
    v77 = (void *)objc_claimAutoreleasedReturnValue(v78);

    v79 = (void *)objc_claimAutoreleasedReturnValue(-[TFUploadFeedbackRequest data](v7, "data"));
    id v88 = 0LL;
    id v80 = sub_10025FAEC((_TtC9appstored6LogKey **)self, 4LL, v77, v79, &v88);
    v76 = (void *)objc_claimAutoreleasedReturnValue(v80);
    id v74 = v88;

    if (v74)
    {
      uint64_t v81 = ASDErrorWithSafeUserInfo(v74);
      v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
      -[Task completeWithError:](self, "completeWithError:", v82);
    }

    else
    {
      id v83 = v76;
      v76 = v83;
      if (self)
      {
        if ([v83 responseStatusCode] == (id)200)
        {
          -[Task completeWithSuccess](self, "completeWithSuccess");
        }

        else
        {
          uint64_t v84 = ASDErrorWithDescription( ASDErrorDomain,  [v76 responseStatusCode],  @"An error occurred submitting the feedback");
          v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
          -[Task completeWithError:](self, "completeWithError:", v85);
        }
      }

      id v74 = 0LL;
    }
  }
}

@end