@interface TVSSMenuModeState
- (BOOL)hasUserAttention;
- (BOOL)headboardRequestedVisibility;
- (BOOL)isCameraInUse;
- (BOOL)isDictating;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFaceTimeActive;
- (BOOL)isLocationInUse;
- (BOOL)isMicInUse;
- (BOOL)isPipActive;
- (BOOL)isSplitViewVisible;
- (BOOL)systemGestureRequestedFocus;
- (FBSDisplayLayoutElement)focusedApp;
- (FBSDisplayLayoutElement)keyboardFocusedElement;
- (NSNumber)interactionRequestReason;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)faceTimePlatterState;
- (PBSScheduledSleep)currentScheduledSleep;
- (TVSSMenuModeBannerContext)bannerContext;
- (TVSSMenuModeState)initWithMenuModeEvaluationState:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)playbackControlsState;
- (int64_t)siriPresentationVisibility;
- (unint64_t)hash;
@end

@implementation TVSSMenuModeState

- (TVSSMenuModeState)initWithMenuModeEvaluationState:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v10;
  v10 = 0LL;
  v8.receiver = v3;
  v8.super_class = (Class)&OBJC_CLASS___TVSSMenuModeState;
  v10 = -[TVSSMenuModeState init](&v8, "init");
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    objc_storeStrong((id *)&v10->_focusedApp, *((id *)location[0] + 1));
    objc_storeStrong((id *)&v10->_keyboardFocusedElement, *((id *)location[0] + 2));
    v10->_headboardRequestedVisibility = *((_BYTE *)location[0] + 24) & 1;
    objc_storeStrong((id *)&v10->_interactionRequestReason, *((id *)location[0] + 4));
    v10->_hasUserAttention = *((_BYTE *)location[0] + 40) & 1;
    v10->_splitViewVisible = *((_BYTE *)location[0] + 41) & 1;
    v10->_pipActive = *((_BYTE *)location[0] + 42) & 1;
    objc_storeStrong((id *)&v10->_bannerContext, *((id *)location[0] + 6));
    v10->_locationInUse = *((_BYTE *)location[0] + 56) & 1;
    v10->_cameraInUse = *((_BYTE *)location[0] + 57) & 1;
    v10->_micInUse = *((_BYTE *)location[0] + 58) & 1;
    v10->_playbackControlsState = *((void *)location[0] + 8);
    v10->_faceTimeActive = *((_BYTE *)location[0] + 72) & 1;
    v4 = (NSString *)[*((id *)location[0] + 10) copy];
    faceTimePlatterState = v10->_faceTimePlatterState;
    v10->_faceTimePlatterState = v4;

    v10->_siriPresentationVisibility = *((void *)location[0] + 11);
    v10->_dictating = *((_BYTE *)location[0] + 96) & 1;
    objc_storeStrong((id *)&v10->_currentScheduledSleep, *((id *)location[0] + 13));
  }

  v7 = v10;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v152 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v152 == location[0])
  {
    char v153 = 1;
    int v150 = 1;
  }

  else
  {
    id v149 = location[0];
    v148 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  location[0],  objc_opt_class(&OBJC_CLASS___TVSSMenuModeState));
    v21 = v148;
    focusedApp = v152->_focusedApp;
    v142 = _NSConcreteStackBlock;
    int v143 = -1073741824;
    int v144 = 0;
    v145 = sub_10007BC88;
    v146 = &unk_1001B8EA8;
    id v147 = v149;
    id v3 = -[BSEqualsBuilder appendObject:counterpart:](v21, "appendObject:counterpart:", focusedApp, &v142);
    v23 = v148;
    keyboardFocusedElement = v152->_keyboardFocusedElement;
    v136 = _NSConcreteStackBlock;
    int v137 = -1073741824;
    int v138 = 0;
    v139 = sub_10007BCAC;
    v140 = &unk_1001B8EA8;
    id v141 = v149;
    id v4 = -[BSEqualsBuilder appendObject:counterpart:](v23, "appendObject:counterpart:", keyboardFocusedElement, &v136);
    v25 = v148;
    BOOL headboardRequestedVisibility = v152->_headboardRequestedVisibility;
    v130 = _NSConcreteStackBlock;
    int v131 = -1073741824;
    int v132 = 0;
    v133 = sub_10007BCD0;
    v134 = &unk_1001B7A30;
    id v135 = v149;
    id v5 =  -[BSEqualsBuilder appendBool:counterpart:]( v25,  "appendBool:counterpart:",  headboardRequestedVisibility,  &v130);
    v27 = v148;
    interactionRequestReason = v152->_interactionRequestReason;
    v124 = _NSConcreteStackBlock;
    int v125 = -1073741824;
    int v126 = 0;
    v127 = sub_10007BCF8;
    v128 = &unk_1001B8EA8;
    id v129 = v149;
    id v6 =  -[BSEqualsBuilder appendObject:counterpart:]( v27,  "appendObject:counterpart:",  interactionRequestReason,  &v124);
    v29 = v148;
    BOOL hasUserAttention = v152->_hasUserAttention;
    v118 = _NSConcreteStackBlock;
    int v119 = -1073741824;
    int v120 = 0;
    v121 = sub_10007BD1C;
    v122 = &unk_1001B7A30;
    id v123 = v149;
    id v7 = -[BSEqualsBuilder appendBool:counterpart:](v29, "appendBool:counterpart:", hasUserAttention, &v118);
    v31 = v148;
    BOOL splitViewVisible = v152->_splitViewVisible;
    v112 = _NSConcreteStackBlock;
    int v113 = -1073741824;
    int v114 = 0;
    v115 = sub_10007BD44;
    v116 = &unk_1001B7A30;
    id v117 = v149;
    id v8 = -[BSEqualsBuilder appendBool:counterpart:](v31, "appendBool:counterpart:", splitViewVisible, &v112);
    v33 = v148;
    BOOL pipActive = v152->_pipActive;
    v106 = _NSConcreteStackBlock;
    int v107 = -1073741824;
    int v108 = 0;
    v109 = sub_10007BD6C;
    v110 = &unk_1001B7A30;
    id v111 = v149;
    id v9 = -[BSEqualsBuilder appendBool:counterpart:](v33, "appendBool:counterpart:", pipActive, &v106);
    v35 = v148;
    bannerContext = v152->_bannerContext;
    v100 = _NSConcreteStackBlock;
    int v101 = -1073741824;
    int v102 = 0;
    v103 = sub_10007BD94;
    v104 = &unk_1001B8EA8;
    id v105 = v149;
    id v10 = -[BSEqualsBuilder appendObject:counterpart:](v35, "appendObject:counterpart:", bannerContext, &v100);
    v37 = v148;
    BOOL locationInUse = v152->_locationInUse;
    v94 = _NSConcreteStackBlock;
    int v95 = -1073741824;
    int v96 = 0;
    v97 = sub_10007BDB8;
    v98 = &unk_1001B7A30;
    id v99 = v149;
    id v11 = -[BSEqualsBuilder appendBool:counterpart:](v37, "appendBool:counterpart:", locationInUse, &v94);
    v39 = v148;
    BOOL cameraInUse = v152->_cameraInUse;
    v88 = _NSConcreteStackBlock;
    int v89 = -1073741824;
    int v90 = 0;
    v91 = sub_10007BDE0;
    v92 = &unk_1001B7A30;
    id v93 = v149;
    id v12 = -[BSEqualsBuilder appendBool:counterpart:](v39, "appendBool:counterpart:", cameraInUse, &v88);
    v41 = v148;
    BOOL micInUse = v152->_micInUse;
    v82 = _NSConcreteStackBlock;
    int v83 = -1073741824;
    int v84 = 0;
    v85 = sub_10007BE08;
    v86 = &unk_1001B7A30;
    id v87 = v149;
    id v13 = -[BSEqualsBuilder appendBool:counterpart:](v41, "appendBool:counterpart:", micInUse, &v82);
    v43 = v148;
    int64_t playbackControlsState = v152->_playbackControlsState;
    v76 = _NSConcreteStackBlock;
    int v77 = -1073741824;
    int v78 = 0;
    v79 = sub_10007BE30;
    v80 = &unk_1001B7550;
    id v81 = v149;
    id v14 =  -[BSEqualsBuilder appendInteger:counterpart:]( v43,  "appendInteger:counterpart:",  playbackControlsState,  &v76);
    v45 = v148;
    BOOL faceTimeActive = v152->_faceTimeActive;
    v70 = _NSConcreteStackBlock;
    int v71 = -1073741824;
    int v72 = 0;
    v73 = sub_10007BE54;
    v74 = &unk_1001B7A30;
    id v75 = v149;
    id v15 = -[BSEqualsBuilder appendBool:counterpart:](v45, "appendBool:counterpart:", faceTimeActive, &v70);
    v47 = v148;
    int64_t siriPresentationVisibility = v152->_siriPresentationVisibility;
    v64 = _NSConcreteStackBlock;
    int v65 = -1073741824;
    int v66 = 0;
    v67 = sub_10007BE7C;
    v68 = &unk_1001B7550;
    id v69 = v149;
    id v16 =  -[BSEqualsBuilder appendInteger:counterpart:]( v47,  "appendInteger:counterpart:",  siriPresentationVisibility,  &v64);
    v49 = v148;
    BOOL dictating = v152->_dictating;
    v58 = _NSConcreteStackBlock;
    int v59 = -1073741824;
    int v60 = 0;
    v61 = sub_10007BEA0;
    v62 = &unk_1001B7A30;
    id v63 = v149;
    id v17 = -[BSEqualsBuilder appendBool:counterpart:](v49, "appendBool:counterpart:", dictating, &v58);
    v51 = v148;
    currentScheduledSleep = v152->_currentScheduledSleep;
    v52 = _NSConcreteStackBlock;
    int v53 = -1073741824;
    int v54 = 0;
    v55 = sub_10007BEC8;
    v56 = &unk_1001B60F8;
    id v57 = v149;
    id v18 = -[BSEqualsBuilder appendObject:counterpart:](v51, "appendObject:counterpart:", currentScheduledSleep, &v52);
    char v153 = -[BSEqualsBuilder isEqual](v148, "isEqual") & 1;
    int v150 = 1;
    objc_storeStrong(&v57, 0LL);
    objc_storeStrong(&v63, 0LL);
    objc_storeStrong(&v69, 0LL);
    objc_storeStrong(&v75, 0LL);
    objc_storeStrong(&v81, 0LL);
    objc_storeStrong(&v87, 0LL);
    objc_storeStrong(&v93, 0LL);
    objc_storeStrong(&v99, 0LL);
    objc_storeStrong(&v105, 0LL);
    objc_storeStrong(&v111, 0LL);
    objc_storeStrong(&v117, 0LL);
    objc_storeStrong(&v123, 0LL);
    objc_storeStrong(&v129, 0LL);
    objc_storeStrong(&v135, 0LL);
    objc_storeStrong(&v141, 0LL);
    objc_storeStrong(&v147, 0LL);
    objc_storeStrong((id *)&v148, 0LL);
    objc_storeStrong(&v149, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v153 & 1;
}

- (unint64_t)hash
{
  v21 = self;
  v20[1] = (id)a2;
  v20[0] = +[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder");
  id v2 = [v20[0] appendObject:v21->_focusedApp];
  id v3 = [v20[0] appendObject:v21->_keyboardFocusedElement];
  id v4 = [v20[0] appendBool:v21->_headboardRequestedVisibility];
  id v5 = [v20[0] appendObject:v21->_interactionRequestReason];
  id v6 = [v20[0] appendBool:v21->_hasUserAttention];
  id v7 = [v20[0] appendBool:v21->_splitViewVisible];
  id v8 = [v20[0] appendBool:v21->_pipActive];
  id v9 = [v20[0] appendObject:v21->_bannerContext];
  id v10 = [v20[0] appendBool:v21->_locationInUse];
  id v11 = [v20[0] appendBool:v21->_cameraInUse];
  id v12 = [v20[0] appendBool:v21->_micInUse];
  id v13 = [v20[0] appendInteger:v21->_playbackControlsState];
  id v14 = [v20[0] appendBool:v21->_faceTimeActive];
  id v15 = [v20[0] appendInteger:v21->_siriPresentationVisibility];
  id v16 = [v20[0] appendBool:v21->_dictating];
  id v17 = [v20[0] appendObject:v21->_currentScheduledSleep];
  id v19 = [v20[0] hash];
  objc_storeStrong(v20, 0LL);
  return (unint64_t)v19;
}

- (id)succinctDescription
{
  id v3 = -[TVSSMenuModeState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v21 = self;
  v20[1] = (id)a2;
  v20[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v2 = [v20[0] appendObject:v21->_focusedApp withName:@"focusedApp"];
  id v3 = [v20[0] appendObject:v21->_keyboardFocusedElement withName:@"keyboardFocusedElement"];
  id v4 =  [v20[0] appendBool:v21->_headboardRequestedVisibility withName:@"headboardRequestedVisibility"];
  id v5 =  [v20[0] appendObject:v21->_interactionRequestReason withName:@"interactionRequestReason"];
  id v6 = [v20[0] appendBool:v21->_hasUserAttention withName:@"hasUserAttention"];
  id v7 = [v20[0] appendBool:v21->_splitViewVisible withName:@"splitViewVisible"];
  id v8 = [v20[0] appendBool:v21->_pipActive withName:@"pipActive"];
  id v9 = [v20[0] appendObject:v21->_bannerContext withName:@"bannerContext"];
  id v10 = [v20[0] appendBool:v21->_locationInUse withName:@"locationInUse"];
  id v11 = [v20[0] appendBool:v21->_cameraInUse withName:@"cameraInUse"];
  id v12 = [v20[0] appendBool:v21->_micInUse withName:@"micInUse"];
  id v13 = [v20[0] appendInteger:v21->_playbackControlsState withName:@"playbackControlsState"];
  id v14 = [v20[0] appendBool:v21->_faceTimeActive withName:@"faceTimeActive"];
  id v15 =  [v20[0] appendInteger:v21->_siriPresentationVisibility withName:@"siriPresentationVisibility"];
  id v16 = [v20[0] appendBool:v21->_dictating withName:@"dictating"];
  id v17 = [v20[0] appendObject:v21->_currentScheduledSleep withName:@"currentScheduledSleep"];
  id v19 = v20[0];
  objc_storeStrong(v20, 0LL);
  return v19;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSMenuModeState descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = -[TVSSMenuModeState succinctDescriptionBuilder](v7, "succinctDescriptionBuilder");
  [v5 setActiveMultilinePrefix:location[0]];
  id v4 = v5;
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (NSString)description
{
  return (NSString *)-[TVSSMenuModeState succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSMenuModeState descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (BOOL)systemGestureRequestedFocus
{
  return self->_interactionRequestReason != 0LL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TVSSMenuModeState initWithMenuModeEvaluationState:]( +[TVSSMutableMenuModeState allocWithZone:](&OBJC_CLASS___TVSSMutableMenuModeState, "allocWithZone:", a3),  "initWithMenuModeEvaluationState:",  self);
}

- (FBSDisplayLayoutElement)focusedApp
{
  return self->_focusedApp;
}

- (FBSDisplayLayoutElement)keyboardFocusedElement
{
  return self->_keyboardFocusedElement;
}

- (BOOL)headboardRequestedVisibility
{
  return self->_headboardRequestedVisibility;
}

- (NSNumber)interactionRequestReason
{
  return self->_interactionRequestReason;
}

- (BOOL)hasUserAttention
{
  return self->_hasUserAttention;
}

- (BOOL)isSplitViewVisible
{
  return self->_splitViewVisible;
}

- (BOOL)isPipActive
{
  return self->_pipActive;
}

- (BOOL)isDictating
{
  return self->_dictating;
}

- (PBSScheduledSleep)currentScheduledSleep
{
  return self->_currentScheduledSleep;
}

- (TVSSMenuModeBannerContext)bannerContext
{
  return self->_bannerContext;
}

- (BOOL)isLocationInUse
{
  return self->_locationInUse;
}

- (BOOL)isCameraInUse
{
  return self->_cameraInUse;
}

- (BOOL)isMicInUse
{
  return self->_micInUse;
}

- (int64_t)playbackControlsState
{
  return self->_playbackControlsState;
}

- (BOOL)isFaceTimeActive
{
  return self->_faceTimeActive;
}

- (NSString)faceTimePlatterState
{
  return self->_faceTimePlatterState;
}

- (int64_t)siriPresentationVisibility
{
  return self->_siriPresentationVisibility;
}

- (void).cxx_destruct
{
}

@end