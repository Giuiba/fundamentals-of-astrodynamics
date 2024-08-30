stk.v.9.0
WrittenBy    STK_v9.2.2

BEGIN Chain

Name  CommLink
BEGIN Definition

   Type        Chain
   Operator    Or
   Order       1
   Recompute   No
   IntervalType    0
   ComputeIntervalStart    216.768000
   ComputeIntervalStop     86616.768000
   UseSaveIntervalFile    No
   UseMinAngle     No
   UseMaxAngle     No
   UseMinLinkTime     No
   LTDelayCriterion    2.000000
   TimeConvergence     0.005000
   AbsValueConvergence 1.000000e-014
   RelValueConvergence 1.000000e-008
   MaxTimeStep         360.000000
   MinTimeStep         1.000000e-002
   UseLightTimeDelay   Yes
    DetectEventsUsingSamplesOnly No
    Object  Satellite/RepeatSat/Sensor/ToStations/Transmitter/Tx_dnlink
    Object  Facility/Nome/Sensor/tracking2/Receiver/Rx_dnlink2
   SaveMode    1
BEGIN StrandAccesses

  Strand    Satellite/RepeatSat/Sensor/ToStations/Transmitter/Tx_dnlink To Facility/Nome/Sensor/tracking2/Receiver/Rx_dnlink2
    Start    28841.999999999618
    Stop     29724
    Start    34754.999999999614
    Stop     35645
    Start    40647
    Stop     41511
    Start    46800
    Stop     47372
    Start    52373
    Stop     52671
    Start    58277
    Stop     59168
    Start    136959
    Stop     137834
    Start    142841
    Stop     143737
    Start    203895
    Stop     204787
    Start    209804
    Stop     210687
    Start    215688
    Stop     216000
    Start    221548
    Stop     222413
    Start    227415
    Stop     227729
    Start    233342
    Stop     234000
END StrandAccesses

   UseLoadIntervalFile    No

END Definition

BEGIN Extensions
    
    BEGIN Graphics

BEGIN Attributes

StaticColor					#0000ff
AnimationColor					#ffff00
AnimationLineWidth					2.000000
StaticLineWidth					3.000000

END Attributes

BEGIN Graphics

    ShowStatic		Off
    ShowAnimationHighlight		On
    ShowAnimationLine		Off
    ShowLinkDirection		Off

END Graphics
    END Graphics
    
    BEGIN ADFFileData
    END ADFFileData
    
    BEGIN Desc
    END Desc
    
    BEGIN VO
    END VO

END Extensions

END Chain

