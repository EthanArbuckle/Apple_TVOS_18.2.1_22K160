@interface TVDAModeSwitch
+ (id)from:(id)a3 to:(id)a4;
- (BOOL)isVirtualModeSwitch;
- (BOOL)shouldEnableEARC;
- (PBSDisplayMode)destination;
- (PBSDisplayMode)source;
- (TVDAModeSwitch)init;
- (TVDAModeSwitch)initWithSource:(id)a3 destination:(id)a4;
- (int64_t)change;
- (void)setShouldEnableEARC:(BOOL)a3;
@end

@implementation TVDAModeSwitch

+ (id)from:(id)a3 to:(id)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  v4 = objc_alloc(&OBJC_CLASS___TVDAModeSwitch);
  v7 = -[TVDAModeSwitch initWithSource:destination:](v4, "initWithSource:destination:", location[0], v8);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (TVDAModeSwitch)init
{
  id location = self;
  objc_storeStrong(&location, 0LL);
  return 0LL;
}

- (TVDAModeSwitch)initWithSource:(id)a3 destination:(id)a4
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  v4 = v15;
  v15 = 0LL;
  v12.receiver = v4;
  v12.super_class = (Class)&OBJC_CLASS___TVDAModeSwitch;
  v15 = -[TVDAModeSwitch init](&v12, "init");
  objc_storeStrong((id *)&v15, v15);
  if (v15)
  {
    v5 = (PBSDisplayMode *)[location[0] copy];
    source = v15->_source;
    v15->_source = v5;

    v7 = (PBSDisplayMode *)[v13 copy];
    destination = v15->_destination;
    v15->_destination = v7;
  }

  v10 = v15;
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v15, 0LL);
  return v10;
}

- (BOOL)isVirtualModeSwitch
{
  v3 = -[TVDAModeSwitch destination](self, "destination");
  unsigned __int8 v4 = -[PBSDisplayMode isVirtual](v3, "isVirtual");

  return v4 & 1;
}

- (int64_t)change
{
  v62 = self;
  *(void *)&v61[9] = a2;
  v61[8] = 0;
  v25 = -[TVDAModeSwitch source](self, "source");
  id v23 = -[PBSDisplayMode dynamicRange](v25, "dynamicRange");
  v24 = -[TVDAModeSwitch destination](v62, "destination");
  BOOL v26 = v23 != -[PBSDisplayMode dynamicRange](v24, "dynamicRange");

  *(void *)v61 = v26;
  char v57 = 0;
  char v53 = 0;
  LOBYTE(v27) = 1;
  if (!v26)
  {
    v58 = -[TVDAModeSwitch source](v62, "source");
    char v57 = 1;
    -[PBSDisplayMode resolution](v58, "resolution");
    double v59 = v2;
    double v60 = v3;
    v54 = -[TVDAModeSwitch destination](v62, "destination");
    char v53 = 1;
    id v4 = -[PBSDisplayMode resolution](v54, "resolution");
    double v55 = v5;
    double v56 = v6;
    int v27 = PBSDisplayResolutionEqualToResolution(v4, v59, v60, v5, v6) ^ 1;
  }

  v61[0] = v27 & 1;
  if ((v53 & 1) != 0) {

  }
  if ((v57 & 1) != 0) {
  char v51 = 0;
  }
  char v49 = 0;
  LOBYTE(v22) = 1;
  if ((v61[0] & 1) == 0)
  {
    v52 = -[TVDAModeSwitch source](v62, "source");
    char v51 = 1;
    -[PBSDisplayMode refreshRate](v52, "refreshRate");
    double v21 = v7;
    v50 = -[TVDAModeSwitch destination](v62, "destination");
    char v49 = 1;
    id v8 = -[PBSDisplayMode refreshRate](v50, "refreshRate");
    int v22 = PBSDisplayRefreshRateEqualToRefreshRate(v8, v21, v9) ^ 1;
  }

  v61[0] = v22 & 1;
  if ((v49 & 1) != 0) {

  }
  if ((v51 & 1) != 0) {
  if ((v61[0] & 1) == 0)
  }
  {
    v19 = -[TVDAModeSwitch source](v62, "source");
    char v46 = 0;
    BOOL v20 = 0;
    if (-[PBSDisplayMode dynamicRange](v19, "dynamicRange") == (id)538423557)
    {
      v47 = -[TVDAModeSwitch destination](v62, "destination");
      char v46 = 1;
      BOOL v20 = -[PBSDisplayMode dynamicRange](v47, "dynamicRange") == (id)538423557;
    }

    if ((v46 & 1) != 0) {

    }
    BOOL v48 = v20;
    char v43 = 0;
    char v41 = 0;
    BOOL v18 = 0;
    if (v20)
    {
      v44 = -[TVDAModeSwitch source](v62, "source");
      char v43 = 1;
      id v17 = -[PBSDisplayMode SDRColorMapping](v44, "SDRColorMapping");
      v42 = -[TVDAModeSwitch destination](v62, "destination");
      char v41 = 1;
      BOOL v18 = v17 != -[PBSDisplayMode SDRColorMapping](v42, "SDRColorMapping");
    }

    if ((v41 & 1) != 0) {

    }
    if ((v43 & 1) != 0) {
    BOOL v45 = v18;
    }
    if (v18)
    {
      *(void *)&v61[1] = 2LL;
    }

    else
    {
      v15 = -[TVDAModeSwitch source](v62, "source");
      char v38 = 0;
      BOOL v16 = 0;
      if (-[PBSDisplayMode dynamicRange](v15, "dynamicRange") == (id)538423556)
      {
        v39 = -[TVDAModeSwitch destination](v62, "destination");
        char v38 = 1;
        BOOL v16 = -[PBSDisplayMode dynamicRange](v39, "dynamicRange") == (id)538423556;
      }

      if ((v38 & 1) != 0) {

      }
      BOOL v40 = v16;
      char v36 = 0;
      char v34 = 0;
      BOOL v14 = 0;
      if (v16)
      {
        v37 = -[TVDAModeSwitch source](v62, "source");
        char v36 = 1;
        id v13 = -[PBSDisplayMode HDR10ChromaSubsampling](v37, "HDR10ChromaSubsampling");
        id v35 = -[TVDAModeSwitch destination](v62, "destination");
        char v34 = 1;
        BOOL v14 = v13 != [v35 HDR10ChromaSubsampling];
      }

      BOOL v40 = v14;
      if ((v34 & 1) != 0) {

      }
      if ((v36 & 1) != 0) {
      char v31 = 0;
      }
      char v29 = 0;
      BOOL v12 = 0;
      if (v48)
      {
        id v32 = -[TVDAModeSwitch source](v62, "source");
        char v31 = 1;
        id v11 = [v32 SDRChromaSubsampling];
        id v30 = -[TVDAModeSwitch destination](v62, "destination");
        char v29 = 1;
        BOOL v12 = v11 != [v30 SDRChromaSubsampling];
      }

      if ((v29 & 1) != 0) {

      }
      if ((v31 & 1) != 0) {
      BOOL v33 = v12;
      }
      if (v40 || v33)
      {
        *(void *)&v61[1] = 1LL;
      }

      else
      {
        os_log_t oslog = (os_log_t)sub_10001A69C();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          sub_100009320((uint64_t)v63, (uint64_t)v62);
          _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "Invalid TVDAModeSwitchChange %{public}@",  v63,  0xCu);
        }

        objc_storeStrong((id *)&oslog, 0LL);
      }
    }
  }

  return *(void *)&v61[1];
}

- (PBSDisplayMode)source
{
  return self->_source;
}

- (PBSDisplayMode)destination
{
  return self->_destination;
}

- (BOOL)shouldEnableEARC
{
  return self->_shouldEnableEARC;
}

- (void)setShouldEnableEARC:(BOOL)a3
{
  self->_shouldEnableEARC = a3;
}

- (void).cxx_destruct
{
}

@end